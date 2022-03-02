<?php

namespace App\Http\Controllers\Dashboard;

use App\Exports\ProductsExport;
use App\Imports\ProductsImport;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\DataTables;

class ProductController extends BackEndController
{
    public function __construct(Product $model)
    {
        parent::__construct($model);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $module_name_plural = $this->getClassNameFromModel();
        $module_name_singular = $this->getSingularModelName();
        return view('dashboard.' . $module_name_plural . '.index', compact('module_name_singular', 'module_name_plural'));
    }
    public function data()
    {
        $categories = Product::with('category:id,name')->select();
        $module_name_plural = $this->getClassNameFromModel();
        return DataTables::of($categories)
            ->addColumn('record_select', 'dashboard.data_table.record_select')
            ->addColumn('actions', function ($data) {
                $module_name_plural = $this->getClassNameFromModel();
                $id = $data->id;
                return view('dashboard.data_table.actions', compact('module_name_plural', 'data', 'id'));
            })
            ->editColumn('category', function (Product $product) {
                return $product->category->name;
            })
            ->addColumn('image', function ($data) {
                $module_name_singular = $this->getSingularModelName();
                $image = json_decode($data->image)[0];
                return view('dashboard.data_table.image', compact('module_name_singular', 'data', 'image'));
            })
            ->addColumn('active', function ($data) {
                return view('dashboard.data_table.active', compact('data'));
            })

            ->rawColumns(['record_select', 'actions', 'id', 'image', 'active'])
            ->toJson();

    }
    public function export() 
    {
        return Excel::download(new ProductsExport, 'products.xlsx');
    }
    public function bulkDelete()
    {
        foreach (json_decode(request()->record_ids) as $recordId) {

            $doctor = $this->model->find($recordId);
            $doctor->delete();

        } //end of for each

        session()->flash('success', __('site.deleted_successfuly'));
        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.index');

    } // end of bulkDelete
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'required|array',
            'image.*' => 'required|mimes:jpg,jpeg,png,svg',
            'active' => 'required|boolean',
            'price' => 'required|numeric',
            'cat_id' => 'required|exists:categories,id',
            'description' => 'nullable',

        ]);
        $request_data = $request->except(['_token', 'image']);
        if ($request->has('image')) {
            $arr = array();
            foreach ($request->image as $photo) {

                $path = rand(0, 1000000) . time() . '.' . $photo->getClientOriginalExtension();
                $photo->move(base_path('public/uploads/product'), $path);
                array_push($arr, $path);

            }
            $request_data['image'] = json_encode($arr);
        }
        $category = $this->model->create($request_data);

        session()->flash('success', __('site.add_successfuly'));
        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.index');
    }

    public function update(Request $request, $id)
    {
        $user = $this->model->find($id);

        $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'nullable|array',
            'image.*' => 'nullable|mimes:jpg,jpeg,png,svg',
            'active' => 'required|boolean',
            'price' => 'required|numeric',
            'cat_id' => 'required|exists:categories,id',
            'description' => 'nullable',
        ]);
        $request_data = $request->except(['_token', 'image']);

        if ($request->image) {
            if ($user->image != null) {
                $image = json_decode($user->image);
                foreach ($image as $im) {
                    Storage::disk('public_uploads')->delete('/product/' . $im);

                }
                $arr = array();
                foreach ($request->image as $photo) {

                    $path = rand(0, 1000000) . time() . '.' . $photo->getClientOriginalExtension();
                    $photo->move(base_path('public/uploads/product'), $path);
                    array_push($arr, $path);

                }
                $request_data['image'] = json_encode($arr);
            } else {
                $arr = array();
                foreach ($request->image as $photo) {

                    $path = rand(0, 1000000) . time() . '.' . $photo->getClientOriginalExtension();
                    $photo->move(base_path('public/uploads/product'), $path);
                    array_push($arr, $path);

                }
                $request_data['image'] = json_encode($arr);
            }
        } //end of ifs
        $user->update($request_data);
        // $user->syncRoles($request->role_id);

        session()->flash('success', __('site.updated_successfuly'));
        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.index');
    }
    public function destroy($id, Request $request)
    {
        $category = $this->model->findOrFail($id);
        $image = json_decode($category->image);
        foreach ($image as $im) {
            Storage::disk('public_uploads')->delete('/product/' . $im);
        }
        $category->delete();
        session()->flash('success', __('site.deleted_successfuly'));
        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.index');
    }

    public function store_excel(Request $request)
    {
        Excel::import(new ProductsImport, $request->excel);
        session()->flash('success', __('site.add_successfuly'));

        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.index');

        
    }

}
