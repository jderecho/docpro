<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\SendsPasswordResetEmails;
use App\Http\Requests;
use Illuminate\Http\Request;

class ForgotPasswordController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Password Reset Controller
    |--------------------------------------------------------------------------
    |
    | This controller is responsible for handling password reset emails and
    | includes a trait which assists in sending these notifications from
    | your application to your users. Feel free to explore this trait.
    |
    */

    use SendsPasswordResetEmails;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    //  public function sendResetLinkEmail(Request $request)
    // {
    //     $this->validate($request, ['email' => 'required|email']);

    //     $broker = $this->getBroker();

    //     $response = Password::broker($broker)->sendResetLink($request->only('email'), function (Message $message) {
    //         $message->subject($this->getEmailSubject());
    //     });

    //     switch ($response) {
    //         case Password::RESET_LINK_SENT:
    //             return $this->getSendResetLinkEmailSuccessResponse($response);

    //         case Password::INVALID_USER:
    //         default:
    //             return $this->getSendResetLinkEmailFailureResponse($response);
    //     }
    // }
    // protected function getBroker()
    // {
    //     return Password::broker('name');
    // }
}
