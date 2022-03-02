<?php

namespace App\Http\Controllers\Api\Employee;

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
       if($request->id == 1)
       {
           $product = Product::where('active',1)->get();
       }elseif($request->id == 2){
        $product = Product::where('active',0)->get();

       }elseif($request->id == 3)
       {
        $product = Product::where('price','<',100)->get();

       }elseif($request->id == 4)
       {
        $product = Product::where('price','>',100)->get();

       }
       return response()->json([
            "status"=>true,
            "data"=>$product,
       ],200);

    
    }
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'image' => 'required|array',
            'image.*' => 'required|mimes:jpg,jpeg,png,svg',
            'active' => 'required|boolean',
            'price' => 'required|numeric',
            'cat_id' => 'required|exists:categories,id',
            'description' => 'nullable',

        ]);
        if ($validator->fails()) {
            return response::falid($validator->errors(), 422);
        }
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
        $category = Product::create($request_data);
        return response()->json([
            "status"=>true,
            "data"=>$category,
       ],200);
    }
    public function update_product(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'image' => 'required|array',
            'image.*' => 'required|mimes:jpg,jpeg,png,svg',
            'active' => 'required|boolean',
            'price' => 'required|numeric',
            'cat_id' => 'required|exists:categories,id',
            'description' => 'nullable',

        ]);
        if ($validator->fails()) {
            return response::falid($validator->errors(), 422);
        }
        $category = Product::find($request->id);

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
            if ($category->image != null) {
                $image = json_decode($category->image);
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
        $category->update($request_data);
        // $user->syncRoles($request->role_id);

        return response()->json([
            "status"=>true,
            "data"=>$category,
       ],200);
    }
    public function delete_product(Request $request)
    {
        $category = Product::find($request->id);
        if($category){
        if($category->image != null){
            foreach($category->image as $p)
            {
            Storage::disk('public_uploads')->delete('/product/' . $p->image);
            }
        }
        $category->delete();
        return response()->json([
            "status"=>true,
            "message"=>"deleted succfully",
       ],200);
    }else{
        return response()->json([
            "status"=>false,
            "message"=>"id not exist",
       ],402);
    }
    }
    public function update_status(Request $request)
    {
         Product::where('id',$request->id)->update([
            'active'=>$request->active
        ]);
        $category = Product::where('id',$request->id)->first();
        return response()->json([
            "status"=>true,
            "data"=>$category,
       ],200);
    }
   

}
