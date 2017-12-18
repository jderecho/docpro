<?php

namespace App\Http\Controllers;

use Redirect;
use Auth;

use App\EmployeeDetails;
use App\EmployeeDepartment;
use App\EmployeePosition;

use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\File;

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
        return view('auth.passwords.email');
    }

    public function passwordemail(Request $request){

        $validator = Validator::make($request->all(), [
            'email' => 'required|email'
        ]);

        if( ! $validator->fails() )
        {
            if( $user = User::where('emp_email', $request->input('email') )->first())
            {
                $token = str_random(64);

                DB::table(config('auth.passwords.users.table'))->insert([
                    'email' => $user->email, 
                    'token' => $token
                ]);

                return redirect()->back()->with('status', trans(Password::RESET_LINK_SENT));
            }
        } else{

        }

        return $request->all();
    }
    public function changeProfilePic(Request $request){
        $directory = 'public/img/profile/uploads/' . Auth::user()->id . '/picture';

        if( is_dir($directory) == false){
            File::makeDirectory($path=base_path($directory), $mode = 0777, $recursive = true, $force = false);
        }

        $filecount = 0;

        if (glob($directory . "/*") != false)
        {
         $filecount = count(glob($directory . "/*"));
        }

        $filename = preg_replace('/\s+/', '', $_FILES['file']['name']);

        $target = $directory . '/' .  $filename ;

        $save = move_uploaded_file($_FILES['file']['tmp_name'], $target);

        if($save){
            return array( "success" => true, "profile_url" => asset($target));
        }else{
            return  array( "success" => false);
        }

    }
    public function editprofile(Request $request){

        return view('changeprofile')->with('positions', EmployeePosition::all())->with('departments', EmployeeDepartment::all());
    }
    public function changeprofile(Request $request){
         $user = Auth::user();
         $user->emp_firstname = $request->emp_firstname; 
         $user->emp_middlename = $request->emp_middlename; 
         $user->emp_lastname = $request->emp_lastname; 
         $user->emp_dept_ID = $request->department; 
         $user->emp_position_ID = $request->position; 
         $user->profile_url = $request->profilepic;
         return array( "success" => $user->save());
    }

}
