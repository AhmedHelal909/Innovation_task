<?php

use App\Http\Controllers\Dashboard\CategoryController;
use Illuminate\Support\Facades\Auth;

use Illuminate\Support\Facades\Route;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use App\Http\Controllers\Dashboard\cityController;
use App\Http\Controllers\Dashboard\ProfileController;
use Illuminate\Support\Facades\Artisan;

Auth::routes(['register' => false]);



Route::group(['middleware' => ['guest']], function () {
    Route::get('/', function () {
        return view('auth.login');
    });


});

Route::get('/clear', function () {
    Artisan ::call('cache:clear');
    Artisan::call('config:cache');
});
Route::group(
    [
        'prefix'     => LaravelLocalization::setLocale(),
        'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath'],
    ],
    function () {


        Route::get('/dashboard/home','HomeController@index')->name('dashboard.home');
        Route::prefix('dashboard')->namespace('Dashboard')->middleware(['auth'])->name('dashboard.')->group(function () {
            Route::resource('roles', 'RoleController');
            Route::resource('users', 'UserController');
            //categories
            Route::delete('/categories/bulk_delete', 'CategoryController@bulkDelete')->name('categories.bulk_delete');
            Route::resource('categories', 'CategoryController')->except('show');
            Route::get('/categories/data','CategoryController@data')->name('categories.data');   
            //products
            Route::delete('/products/bulk_delete', 'ProductController@bulkDelete')->name('products.bulk_delete');
            Route::resource('products', 'ProductController')->except('show');
            Route::get('/products/data','ProductController@data')->name('products.data');
            Route::post('products/store_excel/','ProductController@store_excel')->name('products.store_excel');;  
            Route::get('products/export/','ProductController@export')->name('products.export');;  
            //clients
            Route::delete('/clients/bulk_delete', 'ClientController@bulkDelete')->name('clients.bulk_delete');
            Route::resource('clients', 'ClientController')->except('show');
            Route::get('/clients/data','ClientController@data')->name('clients.data');   
            //employees
            Route::delete('/employees/bulk_delete', 'EmployeeController@bulkDelete')->name('employees.bulk_delete');
            Route::resource('employees', 'EmployeeController')->except('show');
            Route::get('/employees/data','EmployeeController@data')->name('employees.data');   
            Route::resource('profiles','ProfileController');

           
        });

    });

Route::get('/home', 'HomeController@index')->name('home');
