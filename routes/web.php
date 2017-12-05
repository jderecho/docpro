<?php
use App\Mail\SendNotification;

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
	$test = "Test";
	$data = array('email' => '','name'=>"Sam Jose", "body" => "Test mail");

	Mail::to($data)
    // ->cc($moreUsers)
    // ->bcc($evenMoreUsers)
    ->send(new SendNotification($test));

// 	Mail::send('mail.notification', $data, function($message) {
//     $message->to('john.derecho@mopro.com', 'John Manuel Derecho')
//             ->subject('test');
//     // $message->from('jmanuel.derecho@','Sajid Sayyad');
// });
	return;
    return Redirect::to('login');
});

Route::get('test', 'DocumentController@test');

Auth::routes();

Route::get('home','DashboardController@index');

// hack for logout
Route::get('logout', 'Auth\LoginController@logout');

// document routes
Route::get('document/{id}', 'DocumentController@show');

Route::post('document/upload', 'DocumentController@upload');
Route::post('document/comment', 'DocumentController@comment');

Route::post('document/save', 'DocumentController@save'); 
Route::post('document/forapproval', 'DocumentController@approval');
Route::post('document/status', 'DocumentController@changeStatus');
Route::delete('document/{id}', 'DocumentController@destroy');

