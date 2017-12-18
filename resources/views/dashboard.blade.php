@extends('main')
@section('title')
Dashboard: Doc Pro
@endsection
@section('css')
<link href="{{ asset('public/css/chosen.min.css') }}" rel="stylesheet">
<link href="{{ asset('public/css/dropzone.css') }}" rel="stylesheet">
    <style type="text/css">
      h4.title{
        margin-bottom: 0px !important;
      }
      a.btn.btn-success.pull-right {
        margin-top: -6px !important;
      }
      .project-title{
        left: 206px;
        font-weight: 600;
        margin-left: 10px;
        margin-bottom: 2px;
        top: 7px;
      }
      .project-subtitle{
        left: 208px;
        top: 38px;
        margin-left: 10px;
        font-size: 12px;
      }
      .navbar-brand img{
        margin-top: -14px;
        margin-left: 20px;
      }
      ul.chosen-choices {
          border-radius: 5px;
          padding: 15px;
      }
      nav.navbar.navbar-inverse.navbar-fixed-top {
        padding-top: 10px !important;
        padding-bottom: 10px !important;
    }
    select#department_select {
      margin-right: 300px;
      margin-top: 2px;
      position: fixed;
      right: 100px;
      z-index: 100;
      padding:10px;

    }
    #viewDocumentDropzoneComment{
      margin-bottom: 20px;
    }
    </style>
@endsection
@section('content')
    
   @include('nav')

    <div class="container document-list-container" style="margin-top: 120px;">
      <div class="col-md-12">
          <div class="card">
              <div class="card-header card-gradient">
                <h4 class="title"><span class="glyphicon glyphicon-time"></span>&nbsp;&nbsp;Recent
                  <a class="btn btn-success pull-right" data-toggle="modal" data-target="#createDocumentModal"><span class="glyphicon glyphicon-plus"></span> Add Document</a>
                </h4>
              </div>
              <div class="card-content">
                <div class="container-fluid table-container">
                  <table class="table" id="document-table">
                    <thead>
                      <tr>
                        <td></td>
                        <td class="text-left">Date Created</td>
                        <td>Document Name</td>
                        <td><center>Revision Number</center></td>
                        <td><center>Department</center></td>
                        <td>Status</td>
                        <td><center>Originator</center></td>
                        <td class="text-right">OPTIONS</td>
                      </tr>
                    </thead>
                    <tbody>
                      @if(!(empty($documents)))
                        @foreach($documents as $document)
                          <tr>
                            <td></td>
                            <td>{{ $document->formattedDateCreated() }}</td>
                            <td>{{ $document->document_name }}</td>
                            <td><center>{{ $document->revision_number }}</center></td>
                            <td>
                              <?php $tooltip_departments = "";
                                  foreach($document->departments as $department){
                                    $tooltip_departments .= ''. $department->employee_dept->dept_description .'</br>' ;
                                  }
                              ?>
                              <center>
                                <?php if(count($document->departments) == 1 ){
                                    echo '<span class="badge">' .$document->departments[0]->employee_dept->dept_description . '</span>';
                                  }else if(count($document->departments) > 1){
                                    echo ' <a href="#" data-toggle="tooltip" title="' . $tooltip_departments . '">';
                                    echo '<span class="badge">' .$document->departments[0]->employee_dept->dept_description . '..</span>';
                                    echo '</a>';
                                  }else{
                                    echo '<span class="badge">N/A</span>';
                                  }
                              ?>
                              <br/>
                              </center>
                            </td>
                            <td><span class="circle {{ $document->statusClass() }}">•</span><span class="status-label">{{ $document->statusString() }}</span></td>
                            <td><center>{{ $document->creator->emp_firstname . ' ' . $document->creator->emp_lastname }}</center></td>
                            <td >
                              <div class="pull-right">
                                <a title="View" data-toggle="modal" data-target="#viewDocumentModal" class="btn_view_document" data-value="{{ $document->id }}"><span class="glyphicon glyphicon-eye-open grey">&nbsp</span></a>
                              @if($document->employee_details_id == Auth::user()->id || Auth::user()->isSuperAdmin())
                                <a title="Edit" data-toggle="modal" data-target="#EditDocumentModal" class="btn_edit_document" data-value="{{ $document->id }}"><span class="glyphicon glyphicon-pencil grey">&nbsp;</span></a>
                              @endif

                              @if(Auth::user()->isSuperAdmin() || Auth::user()->id == $document->employee_details_id)
                                <a title="Delete" data-toggle="modal" data-target="#deleteDocumentModal" class="btn_delete_document" data-value="{{ $document->id }}"><span class="glyphicon glyphicon-trash grey">&nbsp;</span></a>
                              @endif   
                              </div>
                            </td>
                          </tr>
                        @endforeach
                      @endif
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
      </div>
  @endsection
  @section('modals')
  
    <!--########################################## Create Document Modal ##################################################-->

    <div class="modal fade" id="createDocumentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel"><img style="height: 20px; margin: 5px;" src="{{ asset('public/img/fav-white.png')}}">Create Attachment</h4>
          </div>
          <div class="modal-body">
            <div class="container-fluid">
                <div class="col-md-12">
                  <label>FileName</label>
                  <input type="text" name="document_name" placeholder="Document Name" class="form-control">
                </div>
                <br>
                <br>
                <br>
                <br> <div class="col-md-12">
                  <label>Revision Number</label>
                  <input type="text" name="revision_number" placeholder="Revision Number" class="form-control">
                </div>
                <br>
                <br>
                <br>
                <br>
                <div class="col-lg-12 col-md-12">
                  <label>Reviewers</label>
                  <select data-placeholder="Add Reviewer" class="chosen-select form-control" id="select_reviewers" multiple="" tabindex="-1">
                      <option value=""></option>
                      @foreach($approvers as $employee)
                      <option value="{{ $employee->id }}">{{ $employee->emp_firstname . ' ' . $employee->emp_lastname }}</option>
                      @endforeach
                  </select>
                  <br>
                  <br>
                  <label>Approvers</label>
                  <select data-placeholder="Add Reviewer" class="chosen-select form-control" id="select_approvers" multiple="" tabindex="-1">
                      <option value=""></option>
                      @foreach($approvers as $employee)
                      <option value="{{ $employee->id }}">{{ $employee->emp_firstname . ' ' . $employee->emp_lastname }}</option>
                      @endforeach
                  </select>
                  <br>
                  <br>
                  <label>Department</label>
                  <select data-placeholder="Select Department" class="chosen-select form-control" id="select_departments" multiple="" tabindex="-1">
                      <option value=""></option>
                      @foreach($departments as $department)
                      <option value="{{ $department->dept_ID }}">{{ $department->dept_description}}</option>
                      @endforeach
                    </select>
                  <br>
                  <br>
                  <label>Attachment</label>
                   <form action="{!! url('document/upload') !!}" id="createDocumentDropzone"
                    class="dropzone">
                      {{ csrf_field() }}

                      <input type="hidden" name="_code" value="{{ md5(time())}}">
                      <input type="hidden" name="emp_ID" value="{{ Auth::user()->emp_ID}}">
                      <input type="hidden" name="employee_details_id" value="{{ Auth::user()->id}}">
                  </form>
                  <div id="file_uploads_container" class="hidden">
                    
                  </div>
                </div>
                
            </div>
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="col-md-12">
                <button type="button"  id="btn_save" class="btn btn-success" data-dismiss="modal"><span class="glyphicon glyphicon-plus-sign">&nbsp;</span>Save</button>
                <button type="button"  id="btn_for_approve" class="btn btn-success" data-dismiss="modal"><span class="glyphicon glyphicon-plus-sign">&nbsp;</span>For Approval</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<!-- ################################################################################################################################################# -->

      <!-- #######################################################  Edit Document Modal ##############################################################-->
    <div class="modal fade" id="EditDocumentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel"><img style="height: 20px; margin: 5px;" src="{{ asset('public/img/fav-white.png')}}">Update Document</h4>
          </div>
          <div class="modal-body">
            <div class="container-fluid">
                <div class="col-md-12">
                  <label>FileName</label>
                  <input type="text" name="document_name" placeholder="Document Name" class="form-control">
                </div>
                <br>
                <br>
                <br>
                <br> <div class="col-md-12">
                  <label>Revision Number</label>
                  <input type="text" name="revision_number" placeholder="Revision Number" class="form-control">
                </div>
                <br>
                <br>
                <br>
                <br>
                <div class="col-lg-12 col-md-12">
  
                  <label>Add Reviewer</label>
                  <select data-placeholder="Add Reviewer" class="chosen-select form-control" id="select_reviewers" multiple="" tabindex="-1">
                      <option value=""></option>
                      @foreach($approvers as $employee)
                      <option value="{{ $employee->id }}">{{ $employee->emp_firstname . ' ' . $employee->emp_lastname }}</option>
                      @endforeach
              
                    </select>
                    <br>
                    <br>
                  <label>Department</label>
                  <select data-placeholder="Select Department" class="chosen-select form-control" id="select_departments" multiple="" tabindex="-1">
                      <option value=""></option>
                      @foreach($departments as $department)
                      <option value="{{ $department->dept_ID }}">{{ $department->dept_description}}</option>
                      @endforeach
              
                    </select>
                  
                    <br>
                    <br>
                      {{ csrf_field() }}
                      <input type="hidden" name="employee_details_id" value="{{ Auth::user()->id}}">
                      <input type="hidden" name="emp_ID" value="{{ Auth::user()->emp_ID}}">
                  <div id="file_uploads_container" class="hidden">
                  </div>
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="col-md-12">
                <button type="button"  id="btn_update" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign">&nbsp;</span>Update</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
<!-- #################################################################################################################################################### -->

  <!-- ############################################# View Document Modal ################################################################################ -->
    <div class="modal fade" id="viewDocumentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel"><img style="height: 20px; margin: 5px;" src="{{ asset('public/img/fav-white.png')}}">View Attachment</h4>
          </div>
          <div class="modal-body">
            <div class="container-fluid">
                <div class="col-md-12">
                  <label>File Name </label>
                  <input type="text" name="document_name" placeholder="Document Name" disabled class="form-control">
                      {{ csrf_field() }}
                </div>
                <br>
                <br>
                <br>
                <br>
                <div class="col-lg-9">
                  <div class="col-md-12" id="final_document_holder" style="width: 100%;">
                    <label>Latest Document</label>
                    <br>
                  </div>
                  <label>Attachment</label>
                  <div class="file_holder col-md-12" style="width: 100%;">
                  <div style="float: left;">
                     <div class="card" style="width:100px">
                      <img class="card-img-top" src="{{asset('public/img/doctype/word.jpg')}}" alt="Card image" style="width:100%">
                      <div class="card-body">
                      <center>
                        <span class="card-text">{{ "filename.docx"}}</span>
                      </center>
                      </div>
                    </div>
                  </div>
                  </div>
                </div>
                <div class="col-md-3">
                  <label>Created By:</label>
                  <div id="attachment-list-container">
                     <input type="text" name="created_by" placeholder="Originator" class="form-control disabled" disabled>
                  </div>
                  <br>
                  <label>Department:</label>
                  <div id="department-list-container">
                  </div>
                  <br>
                  <label>Reviewers</label>
                  <div id="reviewer-list-container">
                  </div>
                  <br>
                  <label>Approvers</label>
                  <div id="approver-list-container">
                  </div>
                  <br>
                  <label>Status: </label>
                  <span id="document_status" class="">•</span><span id="document_status_label"></span>
                </div>
               <div class="col-md-12" id="commentbox_container">
                 <table style="width: 100%">
                   <tr id="attachment_holder" style="display: none !important;">
                    <td></td>
                    <td ><br>
                  <label>Attachment</label>
                   <form action="{{ url('document/upload') }}" id="viewDocumentDropzoneComment"
                    class="dropzone">
                      {{ csrf_field() }}
                      <input type="hidden" name="_code" value="{{ md5(time())}}">
                      <input type="hidden" name="emp_ID" value="{{ Auth::user()->emp_ID}}">
                      <input type="hidden" name="employee_details_id" value="{{ Auth::user()->id}}">
                  </form>
                  <div id="comment_attachment_holder" class="hidden">
                  </div></td>
                  <td>
                  </td>
                  </tr>
                   <tr>
                    <td style='width: 10%; padding-left: 15px;'> <span><img class="comment_profile" height="30" src="http://localhost/docpro/public/img/mopro_profile.png">
                </span></td>
                    <td style='width: 80%'>
                      <input type="hidden" name="document_id">
                      <textarea id="comment_area" style="    padding-top: 10px;
    padding-left: 10px;width: 97% ;" placeholder="Leave a comment.."></textarea>
                      <a id="btn_attachment"  ><span class="glyphicon glyphicon-paperclip"></span></a>
                    </td>
                    <td style='width: 10%'><button id="btn_send_comment" class="btn btn-success" style="margin-left: 10px">Send</button></td>
                  </tr>
                 
                 </table>
               </div>
               <div class="col-md-12" id="comment_container">
                <hr style="height: 2px; border-color: #dadada;">
               </div>
            </div>
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="col-md-12 button-container">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- ###################################################################################################################################################### -->

 <!-- ###########################################################  Delete Modal ###############################################################################-->
  <div class="modal fade" id="deleteDocumentModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Delete Document</h4>
        </div>
        <div class="modal-body">
          <p>Are you sure you want to delete <span> Document</span>.</p>
          <form id="" action="{!! url('document/upload') !!}" method="POST">
              {{ csrf_field() }}
              <input type="hidden" name="_method" value="DELETE">
              <input type="hidden" name="_code" value="{{ md5(time())}}">
              <input type="hidden" name="emp_ID" value="{{ Auth::user()->emp_ID}}">
              <input type="hidden" name="employee_details_id" value="{{ Auth::user()->id}}">
              <input type="hidden" name="document_id" value="">
          </form>
        </div>
        <div class="modal-footer">
          <button type="button" id="btn_delete_document" class="btn btn-danger" data-dismiss="modal">Delete</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <div class="modal fade" id="messageDocumentModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Delete Document</h4>
        </div>
        <div class="modal-body">
          <p id="messagebody"></p>
        </div>
        <div class="modal-footer">
          <button type="button" id="btn_delete_document" class="btn btn-danger" data-dismiss="modal">Delete</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
  <!-- ###########################################################################################################################################################  -->
  @endsection

  @section('scripts')
  <script src="{{ asset('public/js/chosen.jquery.min.js') }}"></script>
  <script src="{{ asset('public/js/dropzone.js') }}"></script>
  <script src="{{ asset('public/js/comment.js') }}"></script>
  <script type="text/javascript">
    var imagecounter = 0;

    $(".chosen-select ").chosen({
        disable_search_threshold: 10,
        no_results_text: "No Result(s) Found!",
        width: "100%"
    });

    Dropzone.options.createDocumentDropzone = {
      url: '{{url("document/upload")}}',
      paramName: "file", // The name that will be used to transfer the file
      maxFilesize: 10, // MB
      accept: function(file, done) {
        console.log(file[0]);
        console.log("add");

        var file_name = file.name;
        console.log(file_name);

        $('#createDocumentModal #file_uploads_container').append('<input class="upload-input" type="hidden" name="file_uploads[]" value="' + file_name.replace(/\s/g,'') +'">');

        done(); 
      },
      acceptedFiles: ".pdf,.doc,.docx,.odt",
      addRemoveLinks: true,
      removedfile: function(file) {
          console.log([file, "delete"]);
           var filenames = [];
           var found = false;
            var file_name = file.name;

           $("#createDocumentModal #file_uploads_container input.upload-input").each(function(){
              if(file_name.replace(/\s/g,'') == $(this).val() && (!found) ){
                $(this).remove();
                found = true;
              }
          });

          var _ref;
          return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
      }
    };

  

    $(document).ready(function(){
    });

    $("#btn_for_approve").click(function(){

      var filenames = [];
       $("#createDocumentModal input.upload-input").each(function(){
          filenames.push({filename : $(this).val()});
      });

      $.ajax({url: "document/forapproval", 
        method: 'POST', 
        data: { 
          "_token" : $("#createDocumentModal input[name=_token]").val(),
          "_code" : $("#createDocumentModal input[name=_code]").val(),
          "status" : 1,
          "document_name" : $("#createDocumentModal input[name=document_name]").val(),
          "revision_number" : $('#createDocumentModal input[name=revision_number]').val(),
          "department_id" : $('#createDocumentModal #select_departments').val(),
          "file_uploads" : filenames,
          "reviewers" :  $("#createDocumentModal #select_reviewers").val(),
          "approvers" :  $("#createDocumentModal #select_approvers").val(),
          "creator" : $("#createDocumentModal input[name=employee_details_id]").val()       
        }, 
        success: function(result){
          console.log(result);
          if(result.success){
            location.reload();
          }else{
            alert("error");
          }
        },
        error :function(){
            showMessage('error', 'Error');
        }
      });
    });

    $("#btn_save").click(function(){

      var filenames = [];
       $("input.upload-input").each(function(){
          filenames.push({filename : $(this).val()});
      });

      $.ajax({url: "document/save", 
        method: 'POST', 
        data: { 
          "_token" : $("input[name=_token]").val(),
          "_code" : $("input[name=_code]").val(),
          "document_name" : $("#createDocumentModal input[name=document_name]").val(),
          "revision_number" : $('#createDocumentModal input[name=revision_number]').val(),
          "file_uploads" : filenames,
          "reviewers" :  $("#createDocumentModal #select_reviewers").val(),
          "approvers" :  $("#createDocumentModal #select_approvers").val(),
          "department_id" : $('#createDocumentModal #select_departments').val(),
          "" :  $("#createDocumentModal #select_approvers").val(),
          "creator" : $("input[name=employee_details_id]").val()       
        }, 
        success: function(result){
          console.log(result);
          if(result.success){
            alert_message("Successfully created the document!", result.success);
          }else{
            alert_message("Error in saving the document", result.success);
          }
        },
        error: function($result){
          showMessage('error','Error');
        }
      });
    });
    // VIEW MODAL
    $(".btn_view_document").click(function(){

       $("#viewDocumentModal .button-container").find("#btn_approve").remove();
       $("#viewDocumentModal .button-container").find("#btn_disapprove").remove();
       $("#viewDocumentModal .button-container").find("#btn_send_for_approval").remove();
       $("#viewDocumentModal .button-container").find("#btn_resend_for_approval").remove();
       $("#viewDocumentModal .button-container").find("#btn_final_approve").remove();

       $("#viewDocumentModal #department-list-container").html('');
       $('#final_document_holder').html('');
       $("#viewDocumentModal #comment_container").html('');
        $('.file_holder').html('');
        $('#reviewer-list-container').html('');
        $('#approver-list-container').html('');

      // GET Document
       $.ajax({url:  "document/" + $(this).attr('data-value'), 
        method: 'GET', 
        success: function(result){
          console.log(result);
          $("#viewDocumentModal input[name=document_name]").val(result.document_name);
          $("#viewDocumentModal input[name=created_by]").val(result.creator.emp_firstname + " " + result.creator.emp_lastname);

          $("#viewDocumentModal input[name=document_id]").val(result.id);

          $('#document_status').removeClass();
          $('#document_status').addClass("circle " + statusClass(result.status));
          $('#document_status_label').html(statusString(result.status));


          var checked = "";
          var comment = "";
          if(result.approvers != null){
            var numOfReviewers = 0;
            var numOfApprovers = 0;

            result.approvers.forEach(function(approver, index) {

                if( approver.status == 1){
                  checked = '<span class="status-ok pull-right green"><img src="' + root_URL + 'public/img/status/check.png"></span>';
                }else if(approver.status == 2){
                  checked = '<span class="status-ok pull-right green"><img src="' + root_URL + 'public/img/status/uncheck.png"></span>';
                }else{
                  checked = "";
                }
                if(approver.type == 1){
                  numOfReviewers ++;
                  $('#reviewer-list-container').append('<h5> ' + approver.employee_details.emp_firstname + ' ' + approver.employee_details.emp_lastname + checked + '</h5>')
                }else{
                  numOfApprovers ++;
                  $('#approver-list-container').append('<h5> ' + approver.employee_details.emp_firstname + ' ' + approver.employee_details.emp_lastname + checked + '</h5>')
                }
            });

            // hide reviewer/aprover holder when it contains nothing
            if(numOfReviewers == 0){
              $('#reviewer-list-container').hide();
              $('#reviewer-list-container').prev('label').hide();
            }
            if(numOfApprovers == 0){
              $('#approver-list-container').hide();
              $('#approver-list-container').prev('label').hide();
            }

            //------------------------------------- 

          }

          if(result.departments != null){
            result.departments.forEach(function(department, index){
              var department_str = '<span class="badge ">'+ department.employee_dept.dept_description+'</span>';
              $("#viewDocumentModal #department-list-container").append(department_str);
            });
          }
           if(result.attachments != null){
            var latest_file = result.attachments.slice(-1).pop();
            if(result.status == 3){
               var attachment_view = "<label>Final Document</label><br>";
                  attachment_view += '<a target="_blank" href=" {{asset('/')}}' +  latest_file.file_location+'">';
                  attachment_view += '<div style="float: left; margin-left: 10px;">';
                  attachment_view += '<div class="card" style="width:100px">';
                  attachment_view += '<img class="card-img-top" src="{{asset('public/img/doctype/word.jpg')}}" alt="Card image" style="width:100%">';
                  attachment_view += '<div class="card-body">';
                  attachment_view += '<center>';
                  attachment_view += '<span class="card-text">'+ getFileName(latest_file.file_location) +'</span>';
                  attachment_view += '</center>';
                  attachment_view += '</div>';
                  attachment_view += '</div>';
                  attachment_view += '</div>';
                  attachment_view += '</a>';

                $('#final_document_holder').append(attachment_view);

            }else{
              console.log('nisud');
              var attachment_view = "<label>Latest Document</label><br>";
              $('#final_document_holder').append(attachment_view);

            result.attachments.forEach(function(file, index){
              console.log('nisud');

                  attachment_view = '<a target="_blank" href=" {{asset('/')}}' +  file.file_location+'">';
                  attachment_view += '<div style="float: left; margin-left: 10px;">';
                  attachment_view += '<div class="card" style="width:100px">';
                  attachment_view += '<img class="card-img-top" src="{{asset('public/img/doctype/word.jpg')}}" alt="Card image" style="width:100%">';
                  attachment_view += '<div class="card-body">';
                  attachment_view += '<center>';
                  attachment_view += '<span class="card-text">'+ getFileName(file.file_location) +'</span>';
                  attachment_view += '</center>';
                  attachment_view += '</div>';
                  attachment_view += '</div>';
                  attachment_view += '</div>';
                  attachment_view += '</a>';



                  if(result.attachments.length == (index+1) && result.status > 0){
                    $('#final_document_holder').append(attachment_view);
                  }else{
                     $('.file_holder').append(attachment_view);
                  }
            });
          }
          }else{
            $('#final_document_holder').hide();
             $('.file_holder').hide();
             console.log("test");
          }
          if(result.status > 0){
            $('#final_document_holder').show();
          }else{
            $('#final_document_holder').hide();
          }

          // Document State

          // if document status is equal to 
          // 0 it means it is draft
          // it needs wait for the creator to change the status for approval
          
          if(result.status == 0){
            if(result.creator.id == {!! Auth::user()->id !!}){
                $("#viewDocumentModal .button-container").prepend('<button id="btn_send_for_approval" type="button" class="btn btn-success" data-value="'+ result.id+'" data-dismiss="modal"><span class="glyphicon glyphicon-send">&nbsp;</span>Send for Approval</button>');
            }
          } // 1 means for approval
          else if(result.status == 1){
            if(result.creator.id == {!! Auth::user()->id !!}){

               result.approvers.forEach(function(approver, index){
                // check if any approver disapprove the doc
                console.log('aw');
                if(approver.status == 2){
                   $("#viewDocumentModal .button-container").prepend('<button id="btn_resend_for_approval" type="button" class="btn btn-success" data-value="'+ result.id+'" data-dismiss="modal"><span class="glyphicon glyphicon-send">&nbsp;</span>Resend for Approval</button>');
                   return;
                }else if(approver.status == 0 && approver.employee_details_id ==  {!! Auth::user()->id !!}){
                   $("#viewDocumentModal .button-container").prepend('<button id="btn_disapprove" type="button" class="btn btn-danger" data-value="'+ result.id+'" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-down">&nbsp;</span>Disapprove</button>');

                $("#viewDocumentModal .button-container").prepend('<button id="btn_approve" type="button" class="btn btn-success" data-value="'+ result.id+'" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-up">&nbsp;</span>Approve</button>');
                }
              });
            }
            else if(result.isContributor){
              // Display Approve button

              if(result.contributorStatus == 0){

                $("#viewDocumentModal .button-container").prepend('<button id="btn_disapprove" type="button" class="btn btn-danger" data-value="'+ result.id+'" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-down">&nbsp;</span>Disapprove</button>');

                $("#viewDocumentModal .button-container").prepend('<button id="btn_approve" type="button" class="btn btn-success" data-value="'+ result.id+'" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-up">&nbsp;</span>Approve</button>');
              }
            }
          } // 2 means 
          else if(result.status == 2){  
            if({!! Auth::user()->isSuperAdmin() == true ? "true" : "false" !!}){
                  $("#viewDocumentModal .button-container").prepend('<button id="btn_final_approve" type="button" class="btn btn-success" data-value="'+ result.id+'" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-up">&nbsp;</span>Final Approve</button>');
            }
          } // 3 means 
          else if(result.status == 3){

          }else if(result.status == 4){
            if(result.isContributor && result.contributorStatus == 0){
              $("#viewDocumentModal .button-container").prepend('<button id="btn_disapprove" type="button" class="btn btn-danger" data-old-status="reviewed" data-value="'+ result.id+'" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-down">&nbsp;</span>Disapprove</button>');

             $("#viewDocumentModal .button-container").prepend('<button id="btn_approve" type="button" class="btn btn-success" data-old-status="reviewed" data-value="'+ result.id+'" data-dismiss="modal"><span class="glyphicon glyphicon-thumbs-up">&nbsp;</span>Approve</button>');
            }else if(result.creator.id == {!! Auth::user()->id !!} && result.isDisapproved){

              $("#viewDocumentModal .button-container").prepend('<button id="btn_resend_for_approval" type="button" class="btn btn-success" data-value="'+ result.id+'" data-dismiss="modal"><span class="glyphicon glyphicon-send">&nbsp;</span>Resend for Approval</button>');
            }
          }

          // Comment 
          if(result.comments != null){
            result.comments.forEach(function(obj, index){
                comment = '<p class="comment_holder">';
                comment += '<span>';
                comment += '<br>';
                comment += '<img height="30" src="{{asset('public/img/mopro_profile.png')}}">&nbsp;&nbsp;<b>'+ obj.commentor.emp_firstname + ' ' + obj.commentor.emp_lastname +'</b>';
                comment += '<span>&nbsp;</span>';
                comment += '<span> commented at </span>';
                comment += '<span>  </span>';
                comment += '<span> ' + obj.created_at + '</span>';
                comment += '<br>';
                comment += '<br>';
                comment += '<span class="comment_text_holder">';
                // comment += '<img src="{{asset('/public/img/status/check.png')}}">&nbsp;';
                comment +=  obj.message;
                comment += '</span>';
                comment += '<span class="comment_attachments_holder">';
                comment += '<br>';
                if(obj.attachments.length > 0){
                  comment += "<span class='label label-success comment_text_holder'>"+ obj.attachments.length+" attachments</span>";
                }
                // obj.attachments.forEach(function(file, index){

                //   comment += '<div class="card" style="width:100px"><img class="card-img-top" src="' + file.file_location +'" alt="Card image" style="width:100%"><div class="card-body">';
                //   comment += '<center><span class="card-text">'+getFileName(file.file_location)+'</span></center></div></div>';
                //   comment += '</span>';
                // });
                
                comment += '</span>';
                comment += ' </p>';

                $('#comment_container').append(comment);
            });
          console.log(result);
            }
        }});
    });

    $(".btn_delete_document").click(function(){
        var id = $(this).attr('data-value');

        $("#deleteDocumentModal input[name=document_id]").val(id);
    });
    $('#btn_delete_document').click(function(){
       $.ajax({url:  "document/" + $("#deleteDocumentModal input[name=document_id]").val(), 
        method: 'DELETE', 
        data: { 
          "_token" : $("#deleteDocumentModal input[name=_token]").val()     
        }, 
        success: function(result){
          if(result.success){
            alert_message('Successfully deleted the document', true);
          }else{
            alert_message('Error in deleting the document');
          }
        }});

    });

    $(document).on("click", "#btn_approve", function(){
       var id = $(this).attr('data-value');
       var old_status = "for-approval";
       if($(this).attr('data-old-status')){
          old_status = $(this).attr('data-old-status');
       }
         $.ajax({url:  "document/status" , 
          method: 'POST', 
          data: { 
            "_token" : $("#viewDocumentModal input[name=_token]").val(),     
            "status" : "approve",     
            "old_status" : old_status,     
            "document_id" : id,     
            "employee_details_id" : {!! Auth::user()->id !!} ,     
          }, 
          success: function(result){
            console.log(result);
            if(result.success){
              alert_message('Successfully approved the document', true);
            }else{
              alert_message('Error in approving the document');
            }
        }});
    });

    $(document).on("click", "#btn_disapprove", function(){
      var old_status = "for-approval";
       if($(this).attr('data-old-status')){
          old_status = $(this).attr('data-old-status');
       }
       var id = $(this).attr('data-value');
         $.ajax({url:  "document/status" , 
          method: 'POST', 
          data: { 
            "_token" : $("#viewDocumentModal input[name=_token]").val(),     
            "status" : "disapprove",     
            "old_status" : old_status,     
            "document_id" : id,     
            "employee_details_id" : {!! Auth::user()->id !!} ,     
          }, 
          success: function(result){
            console.log(result);
            if(result.success){
              alert_message('Successfully disapproved the document', true);
            }else{
              alert_message('Error in disapproving the document');
            }
        }});
    });

    $(document).on("click", "#btn_send_for_approval", function(){
       var id = $(this).attr('data-value');

         $.ajax({url:  "document/status" , 
          method: 'POST', 
          data: { 
            "_token" : $("#viewDocumentModal input[name=_token]").val(),     
            "status" : "for-approval",     
            "old_status" : "draft",     
            "document_id" : id,     
            "employee_details_id" : {!! Auth::user()->id !!} ,     
          }, 
          success: function(result){
            if(result.success){
              alert_message('Successfully sent the document for approval!', true);
            }else{
              alert_message('Error in sending for approval!', false);
            }
        }});
    });

    $(document).on("click", "#btn_resend_for_approval", function(){
       var id = $(this).attr('data-value');

         $.ajax({url:  "document/status" , 
          method: 'POST', 
          data: { 
            "_token" : $("#viewDocumentModal input[name=_token]").val(),     
            "status" : "resend-for-approval",     
            "old_status" : "for-approval",     
            "document_id" : id,     
            "employee_details_id" : {!! Auth::user()->id !!} ,     
          }, 
          success: function(result){
            if(result.success){
              alert_message('Document is sent for approval!', true);
            }else{
              alert_message('Error resending document for approval');
            }
        }});
    });
    
    $('#btn_toggle_commentbox').click(function(){
          $('#commentbox_container').fadeToggle(500);
    });

    $(document).on('click','#btn_final_approve', function(){
      var id = $(this).attr('data-value');

         $.ajax({url:  "document/status" , 
          method: 'POST', 
          data: { 
            "_token" : $("#viewDocumentModal input[name=_token]").val(),     
            "status" : "approve",     
            "old_status" : "pre-approved",     
            "document_id" : id,     
            "employee_details_id" : {!! Auth::user()->id !!} ,     
          }, 
          success: function(result){
            if(result.success){
              alert_message('Document is ready!', true);
            }else{
              alert_message('Error approving document!');
            }
        }});
    });

    $("#btn_attachment").click(function(){
      $("#viewDocumentModal #attachment_holder").fadeToggle(500);
    });
  

    $(".btn_edit_document").click(function(){
      $("#EditDocumentModal select").val('').trigger('chosen:updated');
      $("#btn_update").attr("data-value",$(this).attr('data-value'));
      // GET Document
       $.ajax({url:  "document/" + $(this).attr('data-value'), 
        method: 'GET', 
        success: function(result){
          $("#EditDocumentModal input[name=document_name]").val(result.document_name);
          $("#EditDocumentModal input[name=revision_number]").val(result.revision_number);
          console.log(result);
          var list_approvers = [];
          var list_departments = [];
          result.approvers.forEach(function(approver, index){
            list_approvers.push(approver.employee_details.id);
          });

          result.departments.forEach(function(department, index){
            list_departments.push(department.employee_dept.dept_ID);
          });

          $("#EditDocumentModal #select_reviewers").val(list_approvers).trigger('chosen:updated');
          $("#EditDocumentModal #select_departments").val(list_departments).trigger('chosen:updated');
        
          console.log(result);

        }});
    });

    $("#btn_update").click(function(){

        $.ajax({url:  "document/" + $(this).attr('data-value'), 
        method: 'PUT', 
        data:{
          "_token" : $("#EditDocumentModal input[name=_token]").val(),
          "document_name" : $("#EditDocumentModal input[name=document_name]").val(),
          "revision_number" : $('#EditDocumentModal input[name=revision_number]').val(),
          "reviewers" :  $("#EditDocumentModal #select_reviewers").val(),
          "department_id" : $('#EditDocumentModal #select_departments').val(),
          "creator" : $("#EditDocumentModal input[name=employee_details_id]").val()  
        },
        success: function(result){
          console.log(result);
          if(result.success){
            location.reload();
          }
        }});

    });

Dropzone.options.editDocumentDropzone = {
      url: "document/upload",
      paramName: "file", // The name that will be used to transfer the file
      maxFilesize: 10, // MB
      accept: function(file, done) {
        console.log(file[0]);
        console.log("add");

        var file_name = file.name;
        // console.log(file_name);

        $('#createDocumentModal #file_uploads_container').append('<input class="upload-input" type="hidden" name="file_uploads[]" value="' + file_name.replace(/\s/g,'') +'">');

        done(); 
      },
      addRemoveLinks: true,
      removedfile: function(file) {
          console.log([file, "delete"]);
           var filenames = [];
           var found = false;
            var file_name = file.name;

           $("#createDocumentModal #file_uploads_container input.upload-input").each(function(){
              if(file_name.replace(/\s/g,'') == $(this).val() && (!found) ){
                $(this).remove();
                found = true;
              }
          });

          var _ref;
          return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
      }
    };

    $(document).keyup(function(e) {
     if (e.keyCode == 27) { // escape key maps to keycode `27`
            // <DO YOUR WORK HERE>
            if($('#createDocumentModal').is(':visible')){
            console.log('esc');
          }
        }
    });



  </script>
  @endsection