<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Route;
use Kutia\Larafirebase\Facades\Larafirebase;



Route::get('/clear-cache',function(){
    Artisan::call('config:cache');
    Artisan::call('cache:clear');
    // Artisan::call('jwt:secret');
    return "cache clear";
});
Route::post('register', 'Authentication\register@register');
Route::post('login', 'Authentication\authentication@authenticate')->name('doctor');
Route::post('logout', 'Authentication\authentication@logout');
Route::post('forgetPassword','Authentication\Resetpasswordcontroller@ForgetPassword');
Route::post('ResetPassword','Authentication\Resetpasswordcontroller@ResetPassword');
Route::post('verifiedtoken','Authentication\Resetpasswordcontroller@verifiedToken');
//category 
//product
Route::get('get_product/{id?}','Product_controller@get_product');
//contact us
// Route::post('contactus','Both\ContactUsController@contactUs');