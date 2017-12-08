<?php

namespace App\Http\Controllers;

use Symfony\Component\HttpFoundation\File\UploadedFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;

use App\Document;
use App\Mail\SendNotification;
use App\Approver;
use App\Attachment;
use App\Comment;
use App\DocumentDepartment;
use App\EmployeeDetails;

class CommentController extends Controller
{
    //
		public function upload(Request $request){


        $directory = 'public/comment/uploads/' . $request->employee_details_id . '/'. $request->_code;

        if( is_dir($directory) == false){
            File::makeDirectory($path=base_path($directory), $mode = 0777, $recursive = true, $force = false);
        }

        $filecount = 0;

        if (glob($directory . "/*") != false)
        {
         $filecount = count(glob($directory . "/*"));
        }

        $filename = preg_replace('/\s+/', '', $_FILES['file']['name']);;

        $target = $directory . '/' .  $filename ;
        $save = move_uploaded_file($_FILES['file']['tmp_name'], $target);


        if($save){
            return "true";
        }else{
            return  "false";
        }
    }
    public function comment(Request $request){
    		// return $request->all();
        $comment = new Comment;
        $comment->employee_details_id = $request->employee_details_id;
        $comment->document_ID = $request->document_id;
        $comment->message = $request->message;
        if($comment->save()){
            $document = Document::find($request->document_id);
            $document->load('approvers');

            foreach($document->approvers as $approver){
                if($comment->employee_details_id != $approver->employee_details_id){
                    $comment->load('commentor');
                    $content = $comment->commentor->fullName() . " added a comment in a document.";
                    $action = "Kindly check and do necessary actions if needed.";
                    $link = url('document/'. $document->id .'/display') . '';
                    Mail::to($approver->employee_details->emp_email)->queue(new SendNotification($approver->employee_details->fullName(), $content, $action, $link));
                }
            }  
            $comment->load('commentor');
            $comment->created = $comment->formattedDateWithTimeCreated();

             	// save attachments
		        $newdirectory = 'public/comment/user/' . $request->employee_details_id . '/' . $request->_code;

		        if( is_dir($newdirectory) == false){
		            File::makeDirectory($path=base_path($newdirectory), $mode = 0777, $recursive = true, $force = false);
		        }

		        $directory = 'public/comment/uploads/' . $request->employee_details_id . '/'. $request->_code;

		        // save files
		        if($request->comment_attachments != null){
		            foreach ($request->comment_attachments as $value) {
		                $is_copied = copy( $directory .'/'. $value['filename']  , $newdirectory . '/' . $value['filename'] );
		                if($is_copied){ 
		                   $attachment = new Attachment;
		                   $attachment->file_location = $newdirectory .'/'. $value['filename'];
		                   $attachment->document_ID = $document->id;
		                   $attachment->comment_id = $comment->id;
		                   $attachment->save();
		                }
		            }
		        }

            return array("success" => true, "comment" => $comment);
        }else{
            return array("success" => false);
        }
     }

}
