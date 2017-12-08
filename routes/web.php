<?php
use App\Mail\SendNotification;
use App\EmployeeDetails;
use App\Document;
use Illuminate\Support\Facades\Mail;
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
	if(Auth::check()){

		return Redirect::route('home');
	}

	return view('view')->with('documents', Document::all());
});
Route::get('home','DashboardController@index');
Route::get('test', 'DocumentController@test');

Auth::routes();


// hack for logout
Route::get('logout', 'Auth\LoginController@logout');

// document routes

Route::get('document/{id}', 'DocumentController@show');

// Route::get('document/{id}/display', 'DashboardController@display');

Route::get('document/{id}/display', 'DocumentController@display');

Route::post('document/upload', 'DocumentController@upload');

Route::post('document/comment', 'CommentController@comment');
Route::post('comment/upload', 'CommentController@upload');

Route::post('document/save', 'DocumentController@save'); 
Route::post('document/forapproval', 'DocumentController@approval');
Route::post('document/status', 'DocumentController@changeStatus');
Route::delete('document/{id}', 'DocumentController@destroy');

