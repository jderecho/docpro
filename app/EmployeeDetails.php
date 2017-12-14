<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Auth;

class EmployeeDetails extends Model
{
    //
     protected $table = 'employee_details';


    public function scopeIsSuperAdmin($query, $id){
    	// defined user admin
        // $admins = array('1446', '808', '1360', '1021' );
        $admins = array('1446', '1360' );
    	// $admins = array( '1360');

    	return in_array($id, $admins);
    }
    public function scopeFullName($query){
    	return $this->emp_firstname . ' ' . $this->emp_lastname;
    }

    public function scopeGetAdmins($query){
        // return $this->where('emp_ID','=','1360')->get();
        // return $this->where('emp_ID','=', '1446')->orWhere('emp_ID', '=', '808')->orWhere('emp_ID','=','1360')->orWhere('emp_ID','=','1021')->get();
        return $this->where('emp_ID','=','1360')->get();
    }
}
