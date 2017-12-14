<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Approver extends Model
{
	use SoftDeletes;

    protected $table = 'approvers';
	public $timestamps = false;
	
	protected $dates = ['deleted_at'];

	public function employee_details(){
    	return $this->belongsTo('App\User', 'employee_details_id');
    }

    public function scopeIsReviewer(){
    	return $this->type == 1;
    }

    public function scopeIsApprover(){
    	return $this->type == 2;
    }
}
