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
    	$admins = array('1446', '808', '1360', '1021' );

    	return in_array($id, $admins);
    }

}
