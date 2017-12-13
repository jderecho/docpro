<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    protected $table = "employee_details";

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'emp_email', 'emp_password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'emp_password', 'remember_token',
    ];


    public function getAuthPassword() {
        return $this->emp_password;
    }

    public function scopeIsSuperAdmin($query){
        // defined user admin
        $admins = array('1446', '808', '1360', '1021' );
        // $admins = array('1360');
        $id = $this->emp_ID;
        return in_array($id, $admins);
    }
    
    public function scopeFullName($query){
        return $this->emp_firstname . ' ' . $this->emp_lastname;
    }

    public function position(){
        return $this->belongsTo('App\EmployeePosition', 'emp_position_ID','position_ID');
    }
    public function scopeGender(){
        if($this->emp_gender == 2){
            return "Female";
        }else if($this->emp_gender == 1){
            return "Male";
        }else{
            return " ";
        }
    }
}
