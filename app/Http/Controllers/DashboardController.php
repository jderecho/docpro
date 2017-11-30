<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Document;
use App\EmployeeDetails;
use Illuminate\Support\Facades\DB;

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
       if(Auth::user()->isSuperAdmin()){
        return view('dashboard')->with('documents', Document::with('approvers.employee_details', 'creator', 'attachments')->get())->with('approvers', EmployeeDetails::all());
       }else{
         return view('dashboard')->with('documents', Document::contributor(Auth::user()->id))->with('approvers', EmployeeDetails::all());
       }
    }
}
