<?php

use Illuminate\Support\Facades\Route;
Route::group(['middleware' => ['auth_employee']], function () {
    Route::prefix('category')->group(function () {
        Route::get('get_category', 'Category_controller@get_cateogry');
        Route::post('store_category', 'Category_controller@store');
        Route::post('update_category', 'Category_controller@update_category');
        Route::post('delete_category', 'Category_controller@delete_category');
        Route::post('update_status', 'Category_controller@update_status');
    });
    Route::prefix('product')->group(function () {
        Route::get('get_product', 'Product_controller@get_product');
        Route::post('store_product', 'Product_controller@store');
        Route::post('update_product', 'Product_controller@update_product');
        Route::post('delete_product', 'Product_controller@delete_product');
        Route::post('update_status', 'Product_controller@update_status');
    });
    Route::prefix('profile')->group(function(){
        Route::get('get_profile','Profile_controller@get_profile');
        Route::post('edit_profile','Profile_controller@edit_profile');
        Route::post('change_password','Profile_controller@change_password');
    });
    Route::post('sendmessage','SendLetter@send_message');

});
