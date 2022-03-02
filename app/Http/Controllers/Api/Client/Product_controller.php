<?php

namespace App\Http\Controllers\Api\Client;

use App\CustomClass\response;
use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Tymon\JWTAuth\Facades\JWTAuth;
use Illuminate\Validation\Rule;
use App\Models\Doctor;
use App\Models\Patient;
use App\Models\Product;
use Illuminate\Support\Facades\Storage;

class Product_controller extends Controller
{
    public function get_product(Request $request){
       $product = Product::where('active',true)->with(['category'=>function($q){
           $q->where('active',1);
       }])->get();
       return response()->json([
            "status"=>true,
            "data"=>$product,
       ],200);

    
    }
   
   

}
