<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    protected $table = 'documents';

    // public function approvers()
    // {
    //     return $this->hasMany('App\Approver','document_ID', 'document_ID');
    // }

    public function creator(){
    	
    	return $this->belongsTo('App\User', 'creator', 'creator_emp_ID', 'emp_ID');
    }
   
}
