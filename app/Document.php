<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

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

    public function departments(){
        return $this->hasMany('App\DocumentDepartment','document_id');
    }

    public function attachments(){
    	return $this->hasMany('App\Attachment','document_ID');
    }
      public function comments(){
        return $this->hasMany('App\Comment','document_ID');
    }

    public function scopeApproved($query){
        return $query->with('approvers')->where('approvers.status', '=', '0');
    }
    public function scopeIsContributor($query, $id){
        
        // if($this->employee_details_id == $id){
        //     return false;
        // }

        foreach($this->approvers as $approver){
            if($approver->employee_details_id == $id){
                return true;
            }
        }
        return false;
    }
     public function scopeIsContributorStatus($query, $id){

        if($this->employee_details_id == $id){
            return true;
        }

        foreach($this->approvers as $approver){
            if($approver->employee_details_id == $id){
                return $approver->status;
            }
        }
        return false;
    }
    public  function scopeStatusString($query){
        $str = "";
        switch ($this->status) {
            case 0:
                $str = "Draft";
                break;
            case 1:
                $str = "For Approval";
                break;
            case 2:
                $str = "Pre-Approved";
                break;
            case 3:
                $str = "Approved";
                break;
            default:
                # code...
                break;
        }
        return $str;
    }
    public  function scopeStatusClass($query){
        $str = "";
        switch ($this->status) {
            case 0:
                $str = "status-draft";
                break;
            case 1:
                $str = "status-for-approval";
                break;
            case 2:
                $str = "status-pre-approved";
                break;
            case 3:
                $str = "status-approved";
                break;
            default:
                # code...
                break;
        }
        return $str;
    }

    public function scopeFormattedDateCreated($query){
        $var = $this->date_created;
        $date = str_replace('/', '-', $var);
        date('Y-m-d', strtotime($date));

        return date('m/d/y', strtotime($date));;
    }
    public function scopeFormattedDateWithTimeCreated($query){
        $var = $this->date_created;
        $date = str_replace('/', '-', $var);
        date('Y-m-d', strtotime($date));

        return date('m/d/y h:i', strtotime($date));;
    }

    // Or, better, make public, and inject instance to controller.
    public static function contributor($value)
    {
      return static::select("documents.*")->with('creator','approvers', 'attachments')->leftJoin(
        'approvers',
        'documents.id', '=', 'approvers.document_ID'
      )->where("documents.employee_details_id", "=",  $value)->orWhere("approvers.employee_details_id", "=", $value)->groupBy('documents.id')->get();
    }
}
