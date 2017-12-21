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
    public function scopeFileIcon(){

    	 $ext = explode(".", $this->file_location);
    	if($this->type == 2){
    		return "http://localhost/docpro/public/img/doctype/link.png";
    	}

        if(end($ext) == "doc" || end($ext) == "docx") {
            return "http://localhost/docpro/public/img/doctype/word.jpg";
        }else if(end($ext) == "pdf"){
         	return "http://localhost/docpro/public/img/doctype/pdf.png";
        }
    }

}
