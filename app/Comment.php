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
}
