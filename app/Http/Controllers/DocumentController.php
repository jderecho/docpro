<?php

namespace App\Http\Controllers;

use Symfony\Component\HttpFoundation\File\UploadedFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Auth;

use App\Document;
use App\Approver;
use App\Attachment;
use App\Comment;

class DocumentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $document = Document::with('creator')->with('approvers.employee_details')->with('attachments')->with('comments')->find($id);
        $document->isContributor = $document->isContributor(Auth::user()->id);
        $document->contributorStatus = $document->isContributorStatus(Auth::user()->id);
        $document->comments->load('commentor');
        return $document;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $document = Document::find($id);

        return array("success" => $document->delete());
    }


     public function upload(Request $request){


        $directory = 'public/docs/uploads/' . $request->employee_details_id . '/'. $request->_code;

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

    public function save(Request $request){
        $document = new Document;

        $document->employee_details_id = $request->creator;
        $document->document_name = $request->document_name;
        $document->revision_number = $request->revision_number;
        $success = $document->save();

        // catch if error saving document
        if(!$success) return array( "success" => false );

        // save approvers
        foreach($request->reviewers as $reviewers){
            $approver = new Approver;
            $approver->employee_details_id = $reviewers; 
            $approver->document_ID = $document->id; 
            $approver->save();
        }

        // save attachments
        $newdirectory = 'public/docs/user/' . $request->creator . '/' . $request->_code;

        if( is_dir($newdirectory) == false){
            File::makeDirectory($path=base_path($newdirectory), $mode = 0777, $recursive = true, $force = false);
        }

        $directory = 'public/docs/uploads/' . $request->creator . '/'. $request->_code;

        // save files
        foreach ($request->file_uploads as $value) {
            $is_copied = copy( $directory .'/'. $value['filename']  , $newdirectory . '/' . $value['filename'] );
            if($is_copied){ 
               $attachment = new Attachment;
               $attachment->file_location = $newdirectory .'/'. $value['filename'];
               $attachment->document_ID = $document->id;
               $attachment->save();
            }
        }

       return array( "success" => true );
    }

    public function approval(Request $request){
        $document = new Document;

        $document->employee_details_id = $request->creator;
        $document->document_name = $request->document_name;
        $document->status = $request->status;
        $document->revision_number = $request->revision_number;
        $success = $document->save();

        // catch if error saving document
        if(!$success) return array( "success" => false );

        // save approvers
        foreach($request->reviewers as $reviewers){
            $approver = new Approver;
            $approver->employee_details_id = $reviewers; 
            $approver->document_ID = $document->id; 
            $approver->save();
        }

        // save attachments
        $newdirectory = 'public/docs/user/' . $request->creator . '/' . $request->_code;

        if( is_dir($newdirectory) == false){
            File::makeDirectory($path=base_path($newdirectory), $mode = 0777, $recursive = true, $force = false);
        }

        $directory = 'public/docs/uploads/' . $request->creator . '/'. $request->_code;

        // save files
        foreach ($request->file_uploads as $value) {
            $is_copied = copy( $directory .'/'. $value['filename']  , $newdirectory . '/' . $value['filename'] );
            if($is_copied){ 
               $attachment = new Attachment;
               $attachment->file_location = $newdirectory .'/'. $value['filename'];
               $attachment->document_ID = $document->id;
               $attachment->save();
            }
        }

       return array( "success" => true );
    }
    // Approve Document
     public function changeStatus(Request $request){
        // return $request->all();

        $success = 0;
        $message = "";
        $changetostatus = 0;
        $document = Document::find($request->document_id);
        
        if($document->employee_details_id == $request->document_id){
            // pending - can a document creator approve the document created ?
        }
        
        if($request->status == "for-approval"){

            if($request->old_status == "draft"){
                $document->status = 1;
                $success = $document->save();
                if($success){
                    $message = "Document successfully sent for approval";
                }else{
                    $message = "error while sending document for approval";
                }
            }

        }else if($request->status == "approve"){
            if($request->old_status == "for-approval"){
                $approved_counter = 0;
                 foreach($document->approvers as $approver){
                    if($approver->employee_details_id == $request->employee_details_id){
                        $approver->status = 1;
                        $success = $approver->save();
                    }
                    if($approver->status == 1){
                        $approved_counter++;
                    }
                }

                if(count($document->approvers) == $approved_counter){

                    $message = "Document is partially approved.";
                    $document->status = 2;
                    $success = $document->save();
                }
            }else if($request->old_status == "pre-approved"){

                $document->status = 3;
                
                if($document->save()){
                    return array("success" => true);
                }else{
                    return array("success" => false);
                }
            }
        }
       
        return array("success" => $success, "message" => $message);
     }

     public function comment(Request $request){
        // return $request->all();

        $comment = new Comment;
        $comment->employee_details_id = $request->employee_details_id;
        $comment->document_ID = $request->document_id;
        $comment->message = $request->message;

        if($comment->save()){
            return array("success" => true);
        }else{
            return array("success" => false);
        }
     }
}
