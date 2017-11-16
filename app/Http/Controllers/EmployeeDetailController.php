<?php

namespace App\Http\Controllers;

use Redirect;
use Auth;

use App\EmployeeDetails;
use Illuminate\Http\Request;
use App\Http\Controllers\Input;
use Illuminate\Support\Facades\Validator;
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

        echo "aw";
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
}
