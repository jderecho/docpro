<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use App\Document;
use App\EmployeeDetails;
use App\EmployeeDepartment;
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
        return view('dashboard')->with('documents', Document::with('approvers.employee_details', 'creator', 'attachments')->get())->with('approvers', EmployeeDetails::all())->with('departments', EmployeeDepartment::all());
       }else{
            $documents = Document::contributor(Auth::user()->id);
         return view('dashboard')->with('documents', $documents)->with('approvers', EmployeeDetails::all())->with('departments', EmployeeDepartment::all());
        }

       }
    }

    //  public function display($id){
        
    //     $document = Document::with('creator')->with('approvers.employee_details')->with('attachments')->with('comments')->with('departments')->find($id);
    //     $document->comments->load('commentor');
    //     $document->departments->load('employee_dept');

    //     if(Auth::check()){
    //         $document->isContributor = $document->isContributor(Auth::user()->id);
    //         $document->contributorStatus = $document->isContributorStatus(Auth::user()->id);
    //     }
        
    //     return view('document')->with('document', $document);
    // }
