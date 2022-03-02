<?php

namespace App\Http\Controllers\Api\Authentication;

use App\CustomClass\response;
use App\Http\Controllers\Controller;
use App\Models\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Validation\Rule;
use App\Models\Doctor;
use App\Models\Employee;
use App\Models\Patient;


class register extends Controller
{
    public function register(Request $request){
       
        if($request->type =="client"){
            $validator = Validator::make($request->all(), [
                'name' => 'required|string|max:255',
                'phone'         => 'nullable|numeric|unique:clients,phone',
                'email' =>  'nullable|string|email|max:255|unique:clients' ,
                'password'          => 'required|string|min:6',
                'confirmPassword'   => 'required|string|same:password',
                'type' => ['required',Rule::in('client','employee')],
                'address'=>'required|string'
    
            ]);
            if($validator->fails()){
                return response::falid($validator->errors(), 422);
            }
          
          
        $client = Client::create([
            'name'                  => $request->get('name'),
            'phone'                   => $request->get('phone'),
            'email'                     => $request->get('email'),
            'password'                  => Hash::make($request->get('password')),
            'active'                    => true,
            'address'                   => $request->get('address'),
            'type'                      =>'client',

        ]);
        if($client->save()){
            $token = JWTAuth::fromUser($client);
        return response()->json([
            "status" => true,
            'message'=> 'register success',
            'client'   =>$client,
            'token'  => $token,
        ], 200);
        }
    }elseif($request->type =="employee"){
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'phone'         => 'nullable|numeric|unique:employees,phone',
            'email' =>  'nullable|string|email|max:255|unique:employees' ,
            'password'          => 'required|string|min:6',
            'confirmPassword'   => 'required|string|same:password',
            'type' => ['required',Rule::in('client','employee')],
            'address'=>'nullable|string'

        ]);
        if($validator->fails()){
            return response::falid($validator->errors(), 422);
        }
      
        $employee = Employee::create([
            'name'                  => $request->get('name'),
            'phone'                   => $request->get('phone'),
            'email'                     => $request->get('email'),
            'password'                  => Hash::make($request->get('password')),
            'active'                    => true,
            'type'                      =>'employee',


        ]);
        if($employee->save()){
            $token = JWTAuth::fromUser($employee);
       
        return response()->json([
            "status" => true,
            'message'=> 'register success',
            'employee'   =>$employee,
            'token'  => $token,
        ], 200);
        }
    }

  
}
   

}
