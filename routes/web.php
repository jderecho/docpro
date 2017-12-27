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

	return view('view')->with('documents', Document::where('status','=', '3')->orderBy('id','DESC')->get());
});
Route::get('home','DashboardController@index');


Route::get('forgot/password', 'EmployeeDetailController@forgotpassword');

Route::post('password/email', 'EmployeeDetailController@passwordemail')->name('password.email');

Route::get('test', 'DocumentController@test');

// hack for logout
Route::get('login', 'Auth\LoginController@show');
Route::post('login', 'Auth\LoginController@login');
Route::get('logout', 'Auth\LoginController@logout');

// document routes

Route::get('document/{id}', 'DocumentController@show');
Route::put('document/{id}', 'DocumentController@update');

// Route::get('document/{id}/display', 'DashboardController@display');

Route::get('document/{id}/display', 'DocumentController@display');

Route::post('document/upload', 'DocumentController@upload');

Route::post('document/comment', 'CommentController@comment');
Route::post('comment/upload', 'CommentController@upload');

Route::post('document/save', 'DocumentController@save'); 
Route::post('document/forapproval', 'DocumentController@approval');
Route::post('document/status', 'DocumentController@changeStatus');
Route::delete('document/{id}', 'DocumentController@destroy');


Route::get('profile/editprofile', 'EmployeeDetailController@editprofile');
Route::post('profile/change', 'EmployeeDetailController@changeprofile');
Route::post('profile/upload', 'EmployeeDetailController@changeProfilePic');


Route::get('profile', 'DashboardController@profile');
Route::get('profile/changepass', 'DashboardController@changepass');
Route::post('profile/changepass', 'EmployeeDetailController@changepassword');

Route::post('password/reset', 'EmployeeDetailController@passwordemail');
Route::get('password/reset/{token}', 'EmployeeDetailController@resetLink');
