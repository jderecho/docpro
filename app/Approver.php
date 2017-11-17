<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Approver extends Model
{
    protected $table = 'approvers';

	public function employee_details(){
    	return $this->belongsTo('App\User', 'employee_details_id');
    }

}
