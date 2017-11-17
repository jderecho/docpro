<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    protected $table = 'documents';

    public function creator(){
    	return $this->belongsTo('App\User', 'employee_details_id');
    }

    public function approvers(){
    	return $this->hasMany('App\Approver');
    }
}
