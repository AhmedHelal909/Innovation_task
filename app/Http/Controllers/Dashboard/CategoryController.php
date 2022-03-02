<?php

namespace App\Http\Controllers\Dashboard;

use App\DataTables\DoctorDataTable;
use App\Http\Controllers\Api\site\Controller;
use App\Models\Category;
use App\Models\Patient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Tymon\JWTAuth\Facades\JWTAuth;
use Yajra\DataTables\DataTables;

class CategoryController extends BackEndController
{
    public function __construct(Category $model)
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
        $categories = Category::select();
        $module_name_plural = $this->getClassNameFromModel();
        return DataTables::of($categories)
            ->addColumn('record_select', 'dashboard.data_table.record_select')
            ->addColumn('actions', function($data){
            $module_name_plural = $this->getClassNameFromModel();
            $id = $data->id;
              return view('dashboard.data_table.actions',compact('module_name_plural','data','id'));
            })
            ->addColumn('image', function($data){
            $module_name_singular = $this->getSingularModelName();
            $image = $data->image;
              return view('dashboard.data_table.image',compact('module_name_singular','data','image'));
            })
            ->addColumn('active', function($data){
              return view('dashboard.data_table.active',compact('data'));
            })
           
            ->rawColumns(['record_select', 'actions','id','image','active'])
            ->toJson();

    }
    public function bulkDelete()
    {
        foreach (json_decode(request()->record_ids) as $recordId) {

            $doctor = $this->model->find($recordId);
            $doctor->delete();

        }//end of for each

        session()->flash('success', __('site.deleted_successfuly'));
        return redirect()->route('dashboard.'.$this->getClassNameFromModel().'.index');

    }// end of bulkDelete
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'required|image|mimes:jpg,jpeg,png,bmp|max:2000',
            'active' => 'required|boolean',
          
        ]);
        $request_data = $request->except(['_token','image']);
        if($request->has('image')){
            $path = rand(0,1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
            $request->file('image')->move(base_path('public/uploads/category') , $path);
            $request_data['image']   = $path;
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
            'image' => 'required|image|mimes:jpg,jpeg,png,bmp|max:2000',
            'active' => 'required|boolean',
        ]);
        $request_data = $request->except(['_token', 'image']);
        if ($request->image) {
            if ($request->image != null) {
                Storage::disk('public_uploads')->delete('/category/' . $request->image);
            }
           $request_data['image'] = $this->uploadImage($request->image, 'category');
        } //end of if
        $user->update($request_data);
        // $user->syncRoles($request->role_id);

        session()->flash('success', __('site.updated_successfuly'));
        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.index');
    }
    public function destroy($id, Request $request)
    {
        $category = $this->model->findOrFail($id);
        if($category->image != null){
            Storage::disk('public_uploads')->delete('/category/' . $category->image);
        }
        $category->delete();
        session()->flash('success', __('site.deleted_successfuly'));
        return redirect()->route('dashboard.'.$this->getClassNameFromModel().'.index');
    }
  
}
