<?php

namespace App\Http\Controllers\Api\Authentication;

use App\CustomClass\response;
use App\Http\Controllers\Controller;
use App\Http\Resources\clientResource;
use App\Http\Resources\DoctorResource;
use App\Http\Resources\employeeResource;
use App\Http\Resources\PatientResource;
use App\Models\Client;
use App\Models\Doctor;
use App\Models\Employee;
use App\Models\Patient;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Tymon\JWTAuth\Exceptions\JWTException;

class authentication extends Controller
{
    public function authenticate(Request $request)
    {

        if ($request->email != null) {

            $user = Client::where('email', $request->email)->first();
            $user2 = Employee::where('email', $request->email)->first();
            $credentials = ['email' => $request->email, 'password' => $request->password, 'active' => true];

            if ($user) {

                try {
                    if (!$token = auth('client')->attempt($credentials)) {
                        return response()->json([
                            'status' => false,
                            'message' => 'passwored or email is wrong',
                        ], 404);
                    }
                } catch (JWTException $e) {
                    return response()->json([
                        'status' => false,
                        'message' => 'some thing is wrong',
                    ], 404);
                }
                return response()->json([
                    'status' => true,
                    'message' => 'succeess',
                    'user' => new clientResource($user),
                    'token' => $token,
                ], 200);
            } elseif ($user2) {
                try {
                    if (!$token = auth('employee')->attempt($credentials)) {
                        return response()->json([
                            'status' => false,
                            'message' => 'passwored or email is wrong',
                        ], 404);
                    }
                } catch (JWTException $e) {
                    return response()->json([
                        'status' => false,
                        'message' => 'some thing is wrong',
                    ], 404);
                }
                return response()->json([
                    'status' => true,
                    'message' => 'succeess',
                    'user' => new employeeResource($user2),
                    'token' => $token,
                ], 200);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'passwored or email is wrong',
                ], 404);
            }

        } else {
            return response()->json([
                'status' => false,
                'message' => 'passwored or email is wrong',
            ], 404);
        }
    }
    public function logout(Request $request)
    {
        if (auth('client')->user() == null && auth('employee')->user() == null) {
            return response::falid('user_not_found', 404);
        }
        if (Auth::guard('client')->check()) {
            Auth::guard('client')->logout();
        } elseif (Auth::guard('employee')->check()) {
    

            Auth::guard('employee')->logout();

        }
        return response()->json([
            'status' => true,
            'message' => 'Logout Successfully',
        ], 200);
    }
}
