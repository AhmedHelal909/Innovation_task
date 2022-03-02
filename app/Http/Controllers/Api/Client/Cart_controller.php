<?php

namespace App\Http\Controllers\Api\Client;

use App\Models\Cart;
use Illuminate\Http\Request;
use App\CustomClass\response;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Validator;


class Cart_controller extends Controller
{
    public function add_cart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'quantity' => 'required|numeric',
            'product_id' => 'required|exists:products,id',

        ]);
        if ($validator->fails()) {
            return response::falid($validator->errors(), 422);
        }
        $client = auth('client')->user();

        Cart::create([
            'client_id'=>$client->id,
            'product_id'=>$request->product_id,
            'quantity'=>$request->quantity,
        ]);
        $cart = Cart::latest()->first();
        return response()->json([
            "status"=>true,
            "cart"=>$cart,
       ],200);

    }
    public function update_cart(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'quantity' => 'required|numeric',
            'product_id' => 'required|exists:products,id',

        ]);
        if ($validator->fails()) {
            return response::falid($validator->errors(), 422);
        }
        $client = auth('client')->user();

        Cart::where([
            ['id',$request->id],
            ['client_id',$client->id],
        
        ])->update([
            'client_id'=>$client->id,
            'product_id'=>$request->product_id,
            'quantity'=>$request->quantity,
        ]);
        $cart = Cart::where([
            ['id',$request->id],
            ['client_id',$client->id],
        
        ])->first();
        return response()->json([
            "status"=>true,
            "cart"=>$cart,
       ],200);
        
    }
    public function delete_cart(Request $request)
    {
        $client = auth('client')->user();
        Cart::where([
            ['id',$request->id],
            ['client_id',$client->id],
        
        ])->delete();
        return response()->json([
            "status"=>true,
            "message"=>"deleted succfully",
       ],200);

    }
    public function getall(Request $request)
    {
        $client = auth('client')->user();
        $cart = Cart::where('client_id',$client->id)->get();
        return response()->json([
            "status"=>true,
            "cart"=>$cart,
       ],200);
    }
}
