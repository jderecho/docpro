<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EmployeeDetails extends Model
{
    //
     protected $table = 'employee_details';


    public function scopeFullName(){

    	return $this->emp_firstname . ' ' . $this->emp_lastname;
    }

}
