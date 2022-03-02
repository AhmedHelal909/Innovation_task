<?php

namespace App\Http\Controllers\Api\Employee;

use App\CustomClass\response;
use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;

class Category_controller extends Controller
{
    public function get_cateogry(Request $request)
    {
        if ($request->id == 1) {
            $category = Category::where('active', 1)->get();
        } elseif ($request->id == 2) {
            $category = Category::where('active', 0)->get();

        } elseif ($request->id == 3) {
            $category = Category::with('product')->get();

        } elseif ($request->id == 4) {
            $arr = array();
            $category = Category::with('product')->get();
            foreach($category as $c)
            {
               if(count($c->product) ==0){
                   array_push($arr,$c);
               }
            }
            $category = $arr;

        } elseif ($request->id == 5) {
            $category = Category::with(['product'=>function($q){
                $q->where('price','<',100);
            }])->get();
        } elseif ($request->id == 6) {
            $category = Category::with(['product'=>function($q){
                $q->where('price','>',100);
            }])->get();

        } elseif ($request->id == 7) {
            $category = Category::where('active',1)->with(['product'=>function($q){
                $q->where('active',1);
            }])->get();
            
            
        }
        return response()->json([
            "status" => true,
            "data" => $category,
        ], 200);
}
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|string|max:255',
            'image' => 'required|image|mimes:jpg,jpeg,png,bmp|max:2000',
            'active' => 'required|boolean',

        ]);
        if ($validator->fails()) {
            return response::falid($validator->errors(), 422);
        }
        $request_data = $request->except(['_token', 'image']);
        if ($request->has('image')) {
            $path = rand(0, 1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
            $request->file('image')->move(base_path('public/uploads/category'), $path);
            $request_data['image'] = $path;
        }
        $category = Category::create($request_data);
        return response()->json([
            "status" => true,
            "data" => $category,
        ], 200);
    }
    public function update_category(Request $request)
    {
        $category = Category::find($request->id);

        $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'required|image|mimes:jpg,jpeg,png,bmp|max:2000',
            'active' => 'required|boolean',
        ]);
        $request_data = $request->except(['image']);
        if ($request->image) {
            if ($request->image != null) {
                Storage::disk('public_uploads')->delete('/category/' . $request->image);
            }
            $path = rand(0, 1000000) . time() . '.' . $request->file('image')->getClientOriginalExtension();
            $request->file('image')->move(base_path('public/uploads/category'), $path);
            $request_data['image'] = $path;
        } //end of if
        $category->update($request_data);
        // $user->syncRoles($request->role_id);

        return response()->json([
            "status" => true,
            "data" => $category,
        ], 200);
    }
    public function delete_category(Request $request)
    {
        $category = Category::find($request->id);
        if ($category->image != null) {
            Storage::disk('public_uploads')->delete('/category/' . $category->image);
        }
        $category->delete();
        return response()->json([
            "status" => true,
            "message" => "deleted succfully",
        ], 200);
    }
    public function update_status(Request $request)
    {
        Category::where('id', $request->id)->update([
            'active' => $request->active,
        ]);
        $category = Category::where('id', $request->id)->first();
        return response()->json([
            "status" => true,
            "data" => $category,
        ], 200);
    }

}
