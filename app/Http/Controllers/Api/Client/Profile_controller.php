<?php

namespace App\Http\Controllers\Api\Client;

use App\CustomClass\response;
use App\Http\Resources\clientResource;
use App\Http\Resources\DoctorResource;
use App\Http\Resources\employeeResource;
use App\Models\Employee;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
class Profile_controller 
{
    public function get_profile(Request $request){
       
        $client = auth('client')->user();
        
            return response::suceess('success', 200, 'client', new clientResource($client));
    }  
    public function edit_profile(Request $request){
        
        $employee = auth('client')->user();
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'name' => 'required|string|max:255',
            'email' =>  'required|string|email|max:255|unique:clients,email,'.$employee->id ,
            'phone'         => 'required|digits:11|regex:/(01)[0-2]{1}[0-9]{8}/|unique:clients,phone,'.$employee->id,
        ]);
        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }
        if($request->has('name')){
            $employee->name      = $request->get('name');
        }
        if($request->has('phone')){
            $employee->phone      = $request->get('phone');
        }
        if($request->has('email')){
            $employee->email      = $request->get('email');
        }
        if($request->has('address')){
            $employee->address      = $request->get('address');
        }
       
       
     
      
        if($employee->save()){
            return response::suceess('update profile success', 200, 'client', new clientResource($employee));

        }
    }
    public function change_password(Request $request)
    {
        
        $employee = auth('client')->user();
        

       $cond =  $this->check_old($request->oldpassword,$employee->password);
       if($cond ==false)
       {
        return response()->json([
            "status"=>false,
            "message"=>"old password is not correct",
       ],402);
       }else{
        $validator = Validator::make($request->all(), [
            'password'          => 'required|string|min:6',
            'confirmPassword'   => 'required|string|same:password',
        ]);
        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }
        $count = $employee->update([
            'password'=>bcrypt($request->password),
        ]);
        if($count != 0)
        {return response()->json([
            "status"=>true,
            "message"=>"updated succfully",
       ],200);

        }
    }
    
}
public function check_old($old,$password)
{
    return Hash::check($old,$password);
}
}