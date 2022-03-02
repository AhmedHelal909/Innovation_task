<?php

namespace App\Http\Controllers\Dashboard;

use App\DataTables\DoctorDataTable;
use App\Http\Controllers\Api\site\Controller;
use App\Models\Client;
use App\Models\Doctor;
use App\Models\Employee;
use App\Models\Patient;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Tymon\JWTAuth\Facades\JWTAuth;
use Yajra\DataTables\DataTables;

class ClientController extends BackEndController
{
    public function __construct(Client $model)
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
        $doctors = Client::select();
        $module_name_plural = $this->getClassNameFromModel();
        return DataTables::of($doctors)
            ->addColumn('record_select', 'dashboard.data_table.record_select')
            ->editColumn('created_at', function (Client $user) {
                return $user->created_at->format('d/m/Y');
            })
            ->addColumn('forceDelete',function($data){
                $id = $data->id;
                $active = $data->active;
                $module_name_plural = $this->getClassNameFromModel();

                return view('dashboard.data_table.force_delete',compact('id','module_name_plural','active'));
            })
            ->addColumn('active', function ($data) {
                return view('dashboard.data_table.active', compact('data'));
            })
            ->addColumn('actions', function($data){
            $module_name_plural = $this->getClassNameFromModel();
            $id = $data->id;
              return view('dashboard.data_table.actions',compact('module_name_plural','data','id'));
            })
           
            ->rawColumns(['record_select', 'actions','forceDelete','id'])
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
            'email' =>  'nullable|string|email|max:255|unique:clients' ,
            'phone'         => 'required|digits:11|regex:/(01)[0-2]{1}[0-9]{8}/|unique:clients,phone',
            'password'          => 'required|string|min:6',
            'confirmPassword'   => 'required|string|same:password',
        ]);
        $condition = Employee::where('email',$request->email)->first();
        $condition1 = User::where('email',$request->email)->first();
        if($condition || $condition1){
            session()->flash('error', __('site.email_exist'));

        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.create');

        }
        $request_data = $request->except(['_token', 'password', 'confirmPassword']);
        $request_data['password'] = bcrypt($request->password);
        $newuser = $this->model->create($request_data);


        session()->flash('success', __('site.add_successfuly'));
        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.index');
    }

   
    public function update(Request $request, $id)
    {
        $user = $this->model->find($id);

        $request->validate([
            'name' => 'required|string|max:255',
            'email' =>  'nullable|string|email|max:255|unique:clients,email,'.$id ,
            'phone'         => 'required|digits:11|regex:/(01)[0-2]{1}[0-9]{8}/|unique:clients,phone,'.$id,
            'password'          => 'required|string|min:6',
            'confirmPassword'   => 'required|string|same:password',
        ]);
        $condition = Employee::where('email',$request->email)->first();
        $condition1 = User::where('email',$request->email)->first();
        if($condition || $condition1){
            session()->flash('error', __('site.email_exist'));

        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.create');

        }
        $request_data = $request->except(['_token', 'password', 'confirmPassword']);
        $request_data['password'] = bcrypt($request->password);
        $user->update($request_data);
        // $user->syncRoles($request->role_id);

        session()->flash('success', __('site.updated_successfuly'));
        return redirect()->route('dashboard.' . $this->getClassNameFromModel() . '.index');
    }
    public function destroy($id, Request $request)
    {
        $category = $this->model->findOrFail($id);
        $category->delete();
        session()->flash('success', __('site.deleted_successfuly'));
        return redirect()->route('dashboard.'.$this->getClassNameFromModel().'.index');
    }
   
}
