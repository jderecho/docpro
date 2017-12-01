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
        $id = $this->emp_ID;
        return in_array($id, $admins);
    }
    
    
}
