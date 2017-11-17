<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class EmployeeDetails extends Model
{
    //
     protected $table = 'employee_details';

    public function scopeApprovers()
    {
        return $this->all();
    }

    public function fullname(){

    	return $this->emp_firstname . ' ' . $this->emp_lastname;
    }

}
