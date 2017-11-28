<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
	public $timestamps = false;
    protected $table = 'documents';

    public function creator(){
    	return $this->belongsTo('App\User', 'employee_details_id');
    }

    public function approvers(){
    	return $this->hasMany('App\Approver','document_ID');
    }

    public function attachments(){
    	return $this->hasMany('App\Attachment','document_ID');
    }
}
