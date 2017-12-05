<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class DocumentDepartment extends Model
{
    //
    protected $table = "document_departments";
	public $timestamps = false;

	public function employee_dept(){
    	return $this->belongsTo('App\EmployeeDepartment', 'dept_id', 'dept_ID');
    }
}
