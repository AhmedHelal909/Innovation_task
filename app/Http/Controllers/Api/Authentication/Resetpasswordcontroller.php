<?php

namespace App\Http\Controllers\Api\Authentication;

use App\Models\Client;
use App\Models\Employee;
use App\Models\ForgetEmail;
use App\Notifications\SendKey;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class Resetpasswordcontroller
{

    public function ForgetPassword(Request $request)
    {

        $client = Client::where('email', $request->email)->where('verified_email', true)->first();
        $employee = Employee::where('email', $request->email)->where('verified_email', true)->first();

        if (empty($client) && empty($employee)) {
            return response()->json([
                'status' => false,
                'message' => 'Please Verify Your Account First',
            ]);
        }
        if ($client || $employee) {
            $token = Str::random(6);

            $verifies = ForgetEmail::where('email', $request->email)->delete();

            $verify = ForgetEmail::create([
                'email' => $request->email,
                'token' => $token,
            ]);

            if (!empty($client)) {
                //  Mail::to($request->email)->send(new ForgetPassword($doctor->full_name,$token));
                Notification::send($client, new SendKey($token));
                return response()->json([
                    'status' => true,
                    'message' => 'Code Send To Your Email Please Check Your Mail To Reset Your Password',
                ]);
            } else if (!empty($employee)) {
                // Mail::to($request->email)->send(new ForgetPassword($patient->name,$token));
                Notification::send($employee, new SendKey($token));
                return response()->json([
                    'status' => true,
                    'message' => 'Code Send To Your Email Please Check Your Mail To Reset Your Password',
                ]);
            }
        }
    }
    public function ResetPassword(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'token' => 'required|exists:forget_emails,token',
            'password' => 'required | min:6| confirmed',
            'password_confirmation' => "same:password",
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->errors()->tojson(),
            ]);
        }
        //  $arr=explode('-',$request->token);
        $tokenRow = ForgetEmail::where('token', $request->token)->where('verified', true)->first();
        if (empty($tokenRow)) {
            return response()->json([
                'status' => false,
                'message' => 'Please Write The Right Code',
            ]);
        }
        ///////////////////
        $client = Client::where('email', $tokenRow->email)->first();
        $employee = Employee::where('email', $tokenRow->email)->first();
        if (empty($client) && empty($employee)) {
            return response()->json([
                'status' => false,
                'message' => 'Please Write The Right Code',
            ]);
        }
        if ($client != null) {

            $client->update([
                'password' => Hash::make($request->password),

            ]);

        } else if ($employee != null) {

            $employee->update([
                'password' => Hash::make($request->password),

            ]);
        }
        $tokenRow->delete();

        return response()->json([
            'status' => true,
            'message' => 'Your Password Reset Successfully',
        ]);
    }
    public function verifiedToken(Request $request)
    {
        $token = ForgetEmail::where('token', $request->token)->where('verified', false)->first();
        if ($token) {
            $token->update([
                'verified' => true,
            ]);
            return response()->json([
                'status' => true,
                'message' => 'verified succefully',
            ]);

        } else {
            return response()->json([
                'status' => false,
                'message' => 'Please Write the right code',
            ]);
        }
    }
    public function createToken($model)
    {
        $token = Str::random(6);
        if ($model->where('token', $token)->get()->count() > 0) {
            $this->createToken($model);
        }
        return $token;
    }
}
