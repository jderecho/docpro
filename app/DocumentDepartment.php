<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DocumentDepartment extends Model
{
	use SoftDeletes;
    //
    protected $table = "document_departments";
	public $timestamps = false;

	public function employee_dept(){
    	return $this->belongsTo('App\EmployeeDepartment', 'dept_id', 'dept_ID');
    }
}
