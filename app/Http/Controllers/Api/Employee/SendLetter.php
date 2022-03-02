<?php

namespace App\Http\Controllers\Api\Employee;

use App\CustomClass\response;
use App\Models\Client;
use App\Models\Employee;
use App\Notifications\SendMessage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Notification;

class SendLetter
{
    public function send_message(Request $request)
    {

        $client = Client::where('email', $request->email)->first();
        $client['message'] = $request->message;

        Notification::send($client, new SendMessage($client));

        return response()->json([
            'status' => true,
            'message' => 'Code Send To Your Email Please Check Your Mail To Reset Your Password',
        ]);
    }
}
