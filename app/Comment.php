<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    //
    protected $table = 'comments';

    public function attachment(){
    	return $this->belongsTo('App\Attachment', 'attachment_id');
    }

    public function document(){
    	return $this->belongsTo('App\Document', 'document_ID');
    }
    public function commentor(){
    	return $this->belongsTo('App\EmployeeDetails', 'employee_details_id');
    }

    public function attachments(){
        return $this->hasMany('App\Attachment', 'comment_id');
    }
     public function scopeFormattedDateWithTimeCreated($query){
        $var = $this->created_at;
        $date = str_replace('/', '-', $var);
        date('Y-m-d', strtotime($date));

        return date('m/d/y h:i', strtotime($date));;
    }
}
