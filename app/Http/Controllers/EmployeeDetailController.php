<?php

namespace App\Http\Controllers;

use Redirect;
use Auth;

use App\EmployeeDetails;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;

class EmployeeDetailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\EmployeeDetails  $employeeDetails
     * @return \Illuminate\Http\Response
     */
    public function show(EmployeeDetails $employeeDetails)
    {
        //

        echo $employeeDetails->all();
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\EmployeeDetails  $employeeDetails
     * @return \Illuminate\Http\Response
     */
    public function edit(EmployeeDetails $employeeDetails)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\EmployeeDetails  $employeeDetails
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EmployeeDetails $employeeDetails)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\EmployeeDetails  $employeeDetails
     * @return \Illuminate\Http\Response
     */
    public function destroy(EmployeeDetails $employeeDetails)
    {
        //
    }

    //custom methods


     public function test(Request $request)
    {
        echo $request;
    }
    public function changepassword(Request $request){

        $user = User::find($request->user_id);
        // return Hash::check($request->old_password, $user->emp_password)."";
        if(!(Hash::check($request->old_password, $user->emp_password))){
             return array("success" => false, "message" => "Old Password incorrect");
        }

        if($request->new_password != $request->confirm_password){
            return array("success" => false, "message" => "New Password and Confirm Password is not the same.");
        }else if($request->new_password == $request->old_password ){
             return array("success" => false, "message" => "New Password and Old Password should not be the same.");
        }

        $user->emp_password = Hash::make($request->new_password);

        if($user->save()){
            return array("success" => true, "message" => "Successfully changed the password");
        }else{
            return array("success" => false, "message" => "Error in changing the password");
        }

    }
    public function forgotpassword(){
        
        return "An email was sent to your email to reset your password.";
    }
}
