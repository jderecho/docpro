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

    // AJAX RETURN
    public function show($id)
    {
        $document = Document::with('creator')->with('approvers.employee_details')->with('attachments')->with('comments.attachments')->with('departments')->find($id);
        if(Auth::check()){
            $document->isContributor = $document->isContributor(Auth::user()->id);
            $document->contributorStatus = $document->isContributorStatus(Auth::user()->id);
        }
        $document->isDisapproved = $document->isDisapproved();
        $document->comments->load('commentor');
        $document->departments->load('employee_dept');

        return $document;
    }

    public function display($id){

        $document = Document::with('creator')->with('approvers.employee_details')->with('attachments')->with('comments')->with('departments')->find($id);
        $document->comments->load('commentor');
        $document->departments->load('employee_dept');

        if(Auth::check()){
            $document->isContributor = $document->isContributor(Auth::user()->id);
            $document->contributorStatus = $document->isContributorStatus(Auth::user()->id);
        }else{
            return redirect()->route('login')->with('ref', 'document/'. $id. '/display');
        }

        return view('document')->with('document', $document);
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
            // return $request->all();
        #-------------------------------------------------------------------------
        # Load document by id
        $document = Document::find($id);
        $document->document_name = $request->document_name;
        $document->revision_number = $request->revision_number;
        $document->load('approvers');
        $document->load('departments');

        #-------------------------------------------------------------------------
        ## Update Approvers / Reviewers
        foreach($request->reviewers as $reviewer){
            $array = $document->approvers->where('type','=',1)->where('employee_details_id', $reviewer);
            if($array->count() > 0){
               
            }else{
                $approver = new Approver;
                $approver->type = 1;
                $approver->employee_details_id = $reviewer;
                $approver->document_ID = $id;
                $approver->save(); 
            }
        }
        #---------------
        # save approver
        #---------------

         foreach($request->approvers as $approver){
            $array = $document->approvers->where('type','=',2)->where('employee_details_id', $approver);

            if($array->count() > 0){
               
            }else{
                $newapprover = new Approver;
                $newapprover->type = 2;
                $newapprover->employee_details_id = $approver;
                $newapprover->document_ID = $id;
                $newapprover->save(); 
            }
        }

        foreach($document->approvers as $approver){
            if($approver->type == 1){
                if($request->reviewers){
                    if(in_array($approver->employee_details_id, $request->reviewers)){
                        
                    }else{
                        $approver->delete();
                    }
                }else{
                    $approver->delete();
                }
            }else if($approver->type == 2){
                 if($request->approvers){
                    if(in_array($approver->employee_details_id, $request->approvers)){
                        
                    }else{
                        $approver->delete();
                    }
                }else{
                    $approver->delete();
                }
            }
           
        }
        #--------------------------------------------------------------------------
        ## Update departments 
        foreach($request->department_id as $department){
            $array = $document->departments->where("dept_id", $department);
            if($array->count() == 0){
                $d = new DocumentDepartment;
                $d->dept_id = $department; 
                $d->document_id = $id; 
                $d->save();
            }
        }
        foreach($document->departments as $department){
            if($request->department_id){

                if(in_array($department->dept_id, $request->department_id)){
                
                }else{
                    $department->delete();
                }
            }else{
                $department->delete();
            }
        }
        return array("success" => $document->save());
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
        return $_FILES['file'];
        return $_FILES['file']['tmp_name'] . 'wd';
        if($save){
            return "true";
        }else{
            return  "false";
        }
    }

    public function save(Request $request){
        
        $document = Document::where('document_name','=',$request->document_name)
                            ->where('revision_number', '=', $request->revision_number)
                            ->get();

        if($document->count() > 0){
            return array("success" => false, "message" => "Document Name and Revision Number already existed!");
        }

        $document = new Document;

        $document->employee_details_id = $request->creator;
        $document->document_name = $request->document_name;
        $document->revision_number = $request->revision_number;
        $success = $document->save();

        // catch if error saving document
        if(!$success) return array( "success" => false );

        // save reviewers
        if($request->reviewers != null){
            foreach($request->reviewers as $reviewers){
                $approver = new Approver;
                $approver->employee_details_id = $reviewers; 
                $approver->document_ID = $document->id; 
                $approver->type = 1; 
                $approver->save();
            }
        }
        // save approvers
        if($request->approvers != null){
            foreach($request->approvers as $approvers){
                $approver = new Approver;
                $approver->employee_details_id = $approvers; 
                $approver->document_ID = $document->id; 
                $approver->type = 2; 
                $approver->save();
            }
        }

         // save department
        if($request->department_id != null){
            foreach($request->department_id as $department){
                $d = new DocumentDepartment;
                $d->dept_id = $department; 
                $d->document_id = $document->id; 
                $d->save();
            }
        }
        // save attachments
        $newdirectory = 'public/docs/user/' . $request->creator . '/' . $request->_code;

        if( is_dir($newdirectory) == false){
            File::makeDirectory($path=base_path($newdirectory), $mode = 0777, $recursive = true, $force = false);
        }

        $directory = 'public/docs/uploads/' . $request->creator . '/'. $request->_code;

        // save files
        if($request->file_uploads != null){
            foreach ($request->file_uploads as $value) {
                $is_copied = copy( $directory .'/'. $value['filename']  , $newdirectory . '/' . $value['filename'] );
                if($is_copied){ 
                   $attachment = new Attachment;
                   $attachment->file_location = $newdirectory .'/'. $value['filename'];
                   $attachment->document_ID = $document->id;
                   $attachment->save();
                }
            }
        }

       return array( "success" => true );
    }

    public function approval(Request $request){
        // return $request->all();
        $document = new Document;

        $document->employee_details_id = $request->creator;
        $document->document_name = $request->document_name;
        $document->status = $request->status;
        $document->revision_number = $request->revision_number;
        $success = $document->save();

        // catch if error saving document
        if(!$success) return array( "success" => false );

         // save approvers
        if($request->reviewers != null){
            foreach($request->reviewers as $reviewers){
                $approver = new Approver;
                $approver->employee_details_id = $reviewers; 
                $approver->document_ID = $document->id; 
                $approver->save();

                $approver->load('employee_details');
                //send email for approvers
                $document->load('creator');

                $sendNotification = new SendNotification;
                $sendNotification->content = $document->creator->fullName() . " created a new document and added you as a reviewers/approvers.";
                $sendNotification->action = "Kindly check and do necessary actions if needed.";
                $sendNotification->link = url('document/'. $document->id .'/display') . '';
                $sendNotification->fullname = $approver->employee_details->fullName();
                Mail::to($approver->employee_details->emp_email)->queue($sendNotification);
            }
        }

        // save approvers
        if($request->approvers != null){
            foreach($request->approvers as $approvers){
                $approver = new Approver;
                $approver->employee_details_id = $reviewers; 
                $approver->document_ID = $document->id; 
                $approver->type = 2; 
                $approver->save();
            }
        }

         // save department
        if($request->department_id != null){
            foreach($request->department_id as $department){
                $d = new DocumentDepartment;
                $d->dept_id = $department; 
                $d->document_id = $document->id; 
                $d->save();
            }
        }

        // save attachments
        $newdirectory = 'public/docs/user/' . $request->creator . '/' . $request->_code;

        if( is_dir($newdirectory) == false){
            File::makeDirectory($path=base_path($newdirectory), $mode = 0777, $recursive = true, $force = false);
        }

        $directory = 'public/docs/uploads/' . $request->creator . '/'. $request->_code;

        // save files
        if($request->file_uploads != null){
            foreach ($request->file_uploads as $value) {
                $is_copied = copy( $directory .'/'. $value['filename']  , $newdirectory . '/' . $value['filename'] );
                if($is_copied){ 
                   $attachment = new Attachment;
                   $attachment->file_location = $newdirectory .'/'. $value['filename'];
                   $attachment->document_ID = $document->id;
                   $attachment->save();
                }
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
        
        $document->load('creator');
        $document->load('approvers');
        // return $document->isDisapproved();
        if($document->employee_details_id == $request->document_id){
            // pending - can a document creator approve the document created ?
        }
         
         switch ($request->status) {

             case "for-approval": // SENT FOR APPROVAL

                 if($request->old_status == "draft"){
                        $document->status = 1;
                        $success = $document->save();
                        if($success){
                            $message = "Document successfully sent for approval";

                            $comment = new Comment;
                            $comment->employee_details_id = $request->employee_details_id;
                            $comment->document_ID = $request->document_id;
                            $comment->message = "Sent the document for approval";
                            $comment->save();

                            $additional_receiver = [];
                            $sendNotification = new SendNotification();
                            $sendNotification->action = "Kindly check and do necessary actions if needed. ";
                            $sendNotification->link = url('document/'. $document->id .'/display') . '';

                            foreach($document->approvers as $approver){
                                $approver->load('employee_details');
                                $sendNotification->content = $document->creator->fullName() . " sent a document for approval and you are one of the reviewers/approvers.";
                                array_push($additional_receiver, $approver->employee_details->emp_email);
                            }

                            foreach(EmployeeDetails::getAdmins() as $admin){
                                array_push($additional_receiver, $admin->emp_email);
                            }

                            Mail::to($additional_receiver)->queue($sendNotification);
                        }else{
                            $message = "error while sending document for approval";
                        }
                    }

                 break;
            #--------------------------------------------------------------------------------
            #-------------------------- APPROVE DOCUMENT ------------------------------------
            #--------------------------------------------------------------------------------

             case "approve": 

                 if($request->old_status == "for-approval") {

                    $mail_recipient = [];

                    $approver = $document->approvers->where('employee_details_id', $request->employee_details_id )->first();
                    $approver->status = 1;
                    $success = $approver->save();

                    $comment = new Comment;
                    $comment->employee_details_id = $request->employee_details_id;
                    $comment->document_ID = $request->document_id;
                    $comment->message = "approved the document.";
                    $comment->save();
                    // notify all contributors of the document 
                    // don't send email to current user if the current user is the approver
                    $document->approvers->load('employee_details');
                    array_push( $mail_recipient, $document->approvers->where('employee_details.id', '!=', $request->employee_details_id)->pluck('employee_details.emp_email')->get(0));

                    // notify also the admin 
                    array_push($mail_recipient, EmployeeDetails::getAdmins()->pluck('emp_email')->get(0));

                    // add the creator as a recipient
                    if($request->employee_details_id != $document->creator->id){
                        array_push($mail_recipient, $document->creator->emp_email);
                    }


                    $approver->load('employee_details');

                    $sendNotification = new SendNotification;
                    $sendNotification->content = $approver->employee_details->fullName() . " approved the document " . $document->document_name . ".";
                    $sendNotification->action = "Kindly check and do necessary actions if needed.";
                    $sendNotification->link = url('document/'. $document->id .'/display') . '';
                    $sendNotification->fullName = "";
                    
                    Mail::to($mail_recipient)->queue($sendNotification);
                        

                    $approved_counter = $document->approvers->where('type',1)->where('status', '1')->count();
                    

                    if($document->approvers->where('type', 1)->count() == $approved_counter){
                        $mail_recipient = [];

                        $message = "Document is fully reviewed.";
                        $document->status = 4;
                        $success = $document->save();

                        $comment = new Comment;
                        $comment->employee_details_id = 999; // DocPro Admin
                        $comment->document_ID = $request->document_id;
                        $comment->message = "All Reviewers approved the document";
                        $comment->save();

                        foreach($document->approvers as $notify_approvers){
                            $notify_approvers->load('employee_details');
                            // don't send email to current user if the current user is the approver
                            if($notify_approvers->employee_details->id != $request->employee_details_id){
                              array_push($mail_recipient, $notify_approvers->employee_details->emp_email);
                            }
                        }
                        // notify also the admin 
                       foreach(EmployeeDetails::getAdmins() as $admins){
                          array_push($mail_recipient, $admins->emp_email);
                        }

                        // add the creator as a recipient
                        if($request->employee_details_id != $document->creator->id){
                            array_push($mail_recipient, $document->creator->emp_email);
                        }
                        

                        $sendNotification = new SendNotification;
                        $sendNotification->content = " All Reviewers approved the document " . $document->document_name . ".";
                        $sendNotification->action = "Kindly check and do necessary actions if needed.";
                        $sendNotification->link = url('document/'. $document->id .'/display') . '';
                        $sendNotification->fullName = "";
                        Mail::to($mail_recipient)->queue($sendNotification);
                    }

                }else if($request->old_status == "reviewed"){
                    $mail_recipient = [];

                    $approver = $document->approvers->where('employee_details_id', $request->employee_details_id )->first();
                    $approver->status = 1;
                    $success = $approver->save();

                    $comment = new Comment;
                    $comment->employee_details_id = $request->employee_details_id;
                    $comment->document_ID = $request->document_id;
                    $comment->message = "approved the document.";
                    $comment->save();
                    // notify all contributors of the document 
                    // don't send email to current user if the current user is the approver
                    $document->approvers->load('employee_details');
                    array_push( $mail_recipient, $document->approvers->where('employee_details.id', '!=', $request->employee_details_id)->pluck('employee_details.emp_email')->get(0));

                    // notify also the admin 
                    array_push($mail_recipient, EmployeeDetails::getAdmins()->pluck('emp_email')->get(0));

                    // add the creator as a recipient
                    if($request->employee_details_id != $document->creator->id){
                        array_push($mail_recipient, $document->creator->emp_email);
                    }


                    $approver->load('employee_details');

                    $sendNotification = new SendNotification;
                    $sendNotification->content = $approver->employee_details->fullName() . " approved the document " . $document->document_name . ".";
                    $sendNotification->action = "Kindly check and do necessary actions if needed.";
                    $sendNotification->link = url('document/'. $document->id .'/display') . '';
                    $sendNotification->fullName = "";
                    
                    Mail::to($mail_recipient)->queue($sendNotification);
                        

                    $approved_counter = $document->approvers->where('type', 2)->where('status', '1')->count();
                    

                    if($document->approvers->where('type', 2)->count() == $approved_counter){
                        $mail_recipient = [];

                        $message = "Document is partially approved.";
                        $document->status = 2;
                        $success = $document->save();

                        $comment = new Comment;
                        $comment->employee_details_id = 999; // DocPro Admin
                        $comment->document_ID = $request->document_id;
                        $comment->message = "All Approvers approved the document";
                        $comment->save();

                        foreach($document->approvers as $notify_approvers){
                            $notify_approvers->load('employee_details');
                            // don't send email to current user if the current user is the approver
                            if($notify_approvers->employee_details->id != $request->employee_details_id){
                              array_push($mail_recipient, $notify_approvers->employee_details->emp_email);
                            }
                        }
                        // notify also the admin 
                       foreach(EmployeeDetails::getAdmins() as $admins){
                          array_push($mail_recipient, $admins->emp_email);
                        }

                        // add the creator as a recipient
                        if($request->employee_details_id != $document->creator->id){
                            array_push($mail_recipient, $document->creator->emp_email);
                        }
                        

                        $sendNotification = new SendNotification;
                        $sendNotification->content = " All Approvers approved the document " . $document->document_name . ".";
                        $sendNotification->action = "Kindly check and do necessary actions if needed.";
                        $sendNotification->link = url('document/'. $document->id .'/display') . '';
                        $sendNotification->fullName = "";
                        Mail::to($mail_recipient)->queue($sendNotification);
                    }

                }else if($request->old_status == "pre-approved"){

                    $document->status = 3;
                    
                    if($document->save()){
                        $mail_recipient = [];

                        $comment = new Comment;
                        $comment->employee_details_id = $request->employee_details_id;
                        $comment->document_ID = $request->document_id;
                        $comment->message = "Document is ready!";
                        $comment->save();

                         // notify all contributors of the document 
                        foreach($document->approvers as $notify_approvers){
                          $notify_approvers->load('employee_details');
                          array_push($mail_recipient, $notify_approvers->employee_details->emp_email);
                        }
                         // notify also the admin 
                       foreach(EmployeeDetails::getAdmins() as $admins){
                          array_push($mail_recipient, $admins->emp_email);
                        }

                        // add the creator as a recipient
                        array_push($mail_recipient, $document->creator->emp_email);
                        $sendNotification = new SendNotification;
                        $sendNotification->fullName = "";
                        $sendNotification->content = $document->document_name . " document is ready!";
                        $sendNotification->action = "Kindly check and do necessary actions if needed.";
                        $sendNotification->link = url('document/'. $document->id .'/display') . '';
                        Mail::to($mail_recipient)->queue($sendNotification);

                        return array("success" => true);
                    }else{
                        return array("success" => false);
                    }
                }

                # END APPROVE DOCUMENT ----------------------------------------------------------------
                #--------------------------------------------------------------------------------------

                break;  
                case "disapprove":
                    if($request->old_status == "for-approval" || $request->old_status == "reviewed"){
                        // $disapproved = 0;
                        //  foreach($document->approvers as $approver){
                        //     if($approver->employee_details_id == $request->employee_details_id){
                        //         $mail_recipient = [];

                        //         $approver->status = 2;
                        //         $success = $approver->save();

                        //         $comment = new Comment;
                        //         $comment->employee_details_id = $request->employee_details_id;
                        //         $comment->document_ID = $request->document_id;
                        //         $comment->message = "disapproved the document.";
                        //         if($comment->save()){
                        //             $message = "Document successfully disapproved!";
                        //         }
                        //         $approver->load('employee_details');


                        //         foreach($document->approvers as $approver_others){
                        //             $approver_others->load('employee_details');
                        //             if($approver_others->employee_details_id != $request->employee_details_id){
                        //                 array_push($mail_recipient, $approver_others->employee_details->emp_email);
                        //             }
                        //         }

                        //          // notify also the admin 
                        //         foreach(EmployeeDetails::getAdmins() as $admins){
                        //             array_push($mail_recipient, $admins->emp_email);
                        //         }

                        //         // add the creator as a recipient
                        //         array_push($mail_recipient, $document->creator->emp_email);
                                
                        //         $sendNotification = new SendNotification;
                        //         $sendNotification->content = $approver->employee_details->emp_firstname . ' ' . $approver->employee_details->emp_lastname . " disapproved the document " . $document->document_name . ".";
                        //         $sendNotification->action = "Kindly check and do necessary actions if needed.";
                        //         $sendNotification->link = url('document/'. $document->id .'/display') . '';
                        //         $sendNotification->fullName = "";
                        //         Mail::to($mail_recipient)->queue($sendNotification);
                        //     }
                        // }

                        $mail_recipient = [];

                        $approver = $document->approvers->where('employee_details_id', $request->employee_details_id )->first();
                        $approver->status = 2;
                        $success = $approver->save();

                        $comment = new Comment;
                        $comment->employee_details_id = $request->employee_details_id;
                        $comment->document_ID = $request->document_id;
                        $comment->message = "disapproved the document.";
                        $comment->save();
                        // notify all contributors of the document 
                        // don't send email to current user if the current user is the approver
                        $document->approvers->load('employee_details');
                        array_push( $mail_recipient, $document->approvers->where('employee_details.id', '!=', $request->employee_details_id)->pluck('employee_details.emp_email')->get(0));

                        // notify also the admin 
                        array_push($mail_recipient, EmployeeDetails::getAdmins()->pluck('emp_email')->get(0));

                        // add the creator as a recipient
                        if($request->employee_details_id != $document->creator->id){
                            array_push($mail_recipient, $document->creator->emp_email);
                        }

                        $approver->load('employee_details');

                        $sendNotification = new SendNotification;
                        $sendNotification->content = $approver->employee_details->fullName() . " disapproved the document " . $document->document_name . ".";
                        $sendNotification->action = "Kindly check and do necessary actions if needed.";
                        $sendNotification->link = url('document/'. $document->id .'/display') . '';
                        $sendNotification->fullName = "";
                        
                        Mail::to($mail_recipient)->queue($sendNotification);

                    }else if($request->old_status == "pre-approved"){
                        // Super admin disapprove
                         $success = true;
                    }
                break;  
                case "resend-for-approval":
                    if($request->old_status == "for-approval"){
                        $document->load('approvers');

                        if($document->approvers != null){
                            foreach($document->approvers as $approver){
                                if($approver->status == 2){
                                    $approver->status = 0;
                                    $approver->save();

                                    $approver->load('employee_details');

                                    $sendNotification = new SendNotification;
                                    $sendNotification->content = "The originator of the document " . $document->document_name . " resent it for approval.";
                                    $sendNotification->action = "Kindly check and do necessary actions if needed.";
                                    $sendNotification->link = url('document/'. $document->id .'/display') . '';
                                    $sendNotification->fullName = "";
                                    Mail::to($approver->employee_details->emp_email)->queue($sendNotification);
                                }
                            }

                            $comment = new Comment;
                            $comment->employee_details_id = $request->employee_details_id;
                            $comment->document_ID = $request->document_id;
                            $comment->message = "resent the document for approval.";
                            $success = $comment->save();
                            if($success){
                                $message = "Document successfully resent for approval!";
                            } 
                        }
                    }else if ($request->old_status == "reviewed" && $document->isDisapproved()){
                         $document->load('approvers');

                        if($document->approvers != null){
                            foreach($document->approvers as $approver){
                                if($approver->status == 2){
                                    $approver->status = 0;
                                    $approver->save();

                                    $approver->load('employee_details');

                                    $sendNotification = new SendNotification;
                                    $sendNotification->content = "The originator of the document " . $document->document_name . " resent it for approval.";
                                    $sendNotification->action = "Kindly check and do necessary actions if needed.";
                                    $sendNotification->link = url('document/'. $document->id .'/display') . '';
                                    $sendNotification->fullName = "";
                                    Mail::to($approver->employee_details->emp_email)->queue($sendNotification);
                                }
                            }

                            $comment = new Comment;
                            $comment->employee_details_id = $request->employee_details_id;
                            $comment->document_ID = $request->document_id;
                            $comment->message = "resent the document for approval.";
                            $success = $comment->save();
                            if($success){
                                $message = "Document successfully resent for approval!";
                            } 
                        }
                    }
                break;
             default:
                 break;
         }
        return array("success" => $success, "message" => $message);
     }
     public function test(Request $request){
        return phpinfo();
        $sendNotification = new SendNotification;
        $sendNotification->content = "TEST" ;
        $sendNotification->action = "";
        $sendNotification->link = url('');
        $sendNotification->fullName = "";
        Mail::to("john.derecho@mopro.com")->queue($sendNotification);
     }

     public function downloadFile(Request $request){
          // phpinfo();
        // header("Content-Disposition: attachment; filename=\"" . basename($request->file_url) . "\"");
        // header("Content-Type: application/force-download");
        // header("Content-Length: " . filesize($request->file_url));
        // header("Connection: close");

        $string = '<img src="http://localhost/docpro/public/img/profile/uploads/62/picture/download.png" alt="123">';

    preg_match_all('#\bhttps?://[^,\s()<>]+(?:\([\w\d]+\)|([^,[:punct:]\s]|/))#', $string, $match);

    echo "<pre>";
    print_r($match[0]); 
    echo "</pre>";

    $acceptedFileFormats = ["docx", "pdf", "doc", "png"];

            foreach($match[0] as $links){
                $ext = explode(".", $links);
                if(in_array(end($ext), $acceptedFileFormats)) {
                    echo $links;
                 }
                }   
     }
}
