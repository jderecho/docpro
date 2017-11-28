<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Approver extends Model
{
    protected $table = 'approvers';
	public $timestamps = false;

	public function employee_details(){
    	return $this->belongsTo('App\User', 'employee_details_id');
    }

}
