<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Attachment extends Model
{
    //
    public $timestamps = false;
    protected $table = 'attachments';

      public function attachments(){
    	return $this->hasMany('App\Comment','attachment_id');
    }
}
