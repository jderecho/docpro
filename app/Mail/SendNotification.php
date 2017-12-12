<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class SendNotification extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    public $fullname;
    public $content;
    public $action;
    public $link;

    
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct(){

    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('mail.notification');
    }
}