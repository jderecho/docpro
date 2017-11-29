<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Document;
use App\EmployeeDetails;

class DashboardController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {   
        // echo Document::with('approvers.employee_details', 'creator')->get();
        // return;
       if(Auth::user()->isSuperAdmin()){

        return view('dashboard')->with('documents', Document::with('approvers.employee_details', 'creator', 'attachments')->get())->with('approvers', EmployeeDetails::all());
       }else{

        return view('dashboard')->with('documents', Document::contributor(Auth::user()->id)->with('approvers.employee_details', 'creator', 'attachments')->orWhere('documents.employee_details_id', '=', Auth::user()->id )->get())->with('approvers', EmployeeDetails::all());
       }
    }
}
