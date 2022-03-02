<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;
use Kutia\Larafirebase\Facades\Larafirebase;

Route::group(['middleware' => ['auth_client']], function () {

Route::prefix('profile')->group(function(){
        Route::get('get_profile','Profile_controller@get_profile');
        Route::post('edit_profile','Profile_controller@edit_profile');
        Route::post('change_password','Profile_controller@change_password');
    });
Route::prefix('cart')->group(function(){
        Route::post('add_cart','Cart_controller@add_cart');
        Route::post('update_cart','Cart_controller@update_cart');
        Route::post('delete_cart','Cart_controller@delete_cart');
        Route::get('getall','Cart_controller@getall');
    });
    Route::prefix('product')->group(function(){
       Route::get('get_product','Product_controller@get_product');
    });
});