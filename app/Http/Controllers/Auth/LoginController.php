<?php

namespace App\Http\Controllers\Auth;

use Redirect;
use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use App\Http\Controllers\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/dashboard';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function show(LoginController $login)
    {
        dd("test");

         return view('auth.login');
    }

    public function login(Request $request){

    // // Creating Rules for Email and Password
    $rules = array(
        'email' => 'required|email', // make sure the email is an actual email
        'password' => 'required|alphaNum');

        $validator = Validator::make($request->all() , $rules);
        if($validator->fails()){
            return Redirect::to('login')->withErrors($validator)->withInput($request->except('password'));
        }else{  

            $user = ['emp_email' => $request->get('email'), 'password' => $request->get('password')];

            if (Auth::attempt($user)){

                Auth::login(Auth::user());
                if($request->_previous != null){
                    return redirect()->intended($request->_previous);
                }

                return redirect()->intended('home');
            }else{
               return Redirect::to('/login')->withErrors(['email', 'The Message']);;
            }
        }

    }

    public function logout(LoginController $login, Request $request){
        Auth::logout();
        return Redirect::to('/');
    }
}
