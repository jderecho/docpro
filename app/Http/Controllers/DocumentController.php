<?php

namespace App\Http\Controllers;

use Symfony\Component\HttpFoundation\File\UploadedFile;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;

use App\Document;
use App\Approver;
use App\Attachment;

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
        return Document::with('creator')->with('approvers.employee_details')->with('attachments')->find($id);
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


     public function upload(Request $request)
    {


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



//     public function test(Request $request){
//         error_reporting(E_ALL);
//         ini_set('error_reporting', E_ALL);
//         $newdirectory = 'public/docs/user/808/test';

//         if( is_dir($newdirectory) == false){
//             File::makeDirectory($path=base_path($newdirectory), $mode = 0777, $recursive = true, $force = false);
//         }
//          $directory = 'public/docs/uploads/808/de4yfbdfMtg9twEKsbg4uyQ8CA7AvPfEMn5A9tOC';
//         // save files
//          // if(! @move_uploaded_file ( $directory . '/document_1.docx'  , $newdirectory )){
//          // file_put_contents(  "a", "ERROR[ ".date('Y-m-d H:i:s')." ] Could not move[ $source ] to[ $dest ]\n", FILE_APPEND);
//          // exit();
// // }
//         // return json_encode(move_uploaded_file ( $directory . '/document_1.docx'  , $newdirectory ));

//         $file = $directory . '/document_1.docx';
//         return json_encode(copy($file, $newdirectory . '/document_1.docx'));
//         // if (file_exists($file)) {
//         //     header('Content-Description: File Transfer');
//         //     header('Content-Type: application/octet-stream');
//         //     header('Content-Disposition: attachment; filename="'.basename($file).'"');
//         //     header('Expires: 0');
//         //     header('Cache-Control: must-revalidate');
//         //     header('Pragma: public');
//         //     header('Content-Length: ' . filesize($file));
//         //     readfile($file);
//         //     exit;
//         // }
//     }
}
