<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return Redirect::to('login');;
});

Route::get('test', 'DocumentController@test');

Auth::routes();

Route::group(['middleware' => ['web']], function () {
    Route::get('home','DashboardController@index');
});

// hack for logout

Route::get('logout', 'Auth\LoginController@logout');

Route::post('document/upload', 'DocumentController@upload');
Route::post('document/save', 'DocumentController@save');
Route::post('document/forapproval', 'DocumentController@approval');
Route::get('document/{id}', 'DocumentController@show');
Route::delete('document/{id}', 'DocumentController@destroy');

