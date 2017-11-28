@extends('main')
@section('title')
Dashboard: Document Controller
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
    </style>
@endsection
@section('content')
<?php echo json_encode($documents); return; ?>
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
           
        </div>
        <div id="navbar" class="navbar-collapse collapse">
           <ul class="nav navbar-nav navbar-left white">
            <li> <a class="navbar-brand" ><img class="img-responsive pull-left" src="{{ asset('public/img/mopro_logo.png') }}"><div class="ripple-container"></div></a></li>
            <li>  
              <img style="height: 50px; margin-left: 5px;" class="img-responsive pull-left" src="{{ asset('public/img/dms_logo.png') }}">
              <!-- <h4 class="project-title">
                DocPro <span style="font-size: 12px !important; font-weight: 300">(Document Management System for Mopro)</span>
              </h4>
              <p class="project-subtitle">
                Operational Excellence
              </p> -->
            </li>
           </ul>
          
        
          <ul class="nav navbar-nav navbar-right white">
              <li style="height: 50px; border-right: 1px solid #6145B6;margin-right: 20px;"><h4 class="mopro-time"><span class="glyphicon glyphicon-time violet">&nbsp;</span><div id="time"></div></h4></li>
              <li><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCOiiq0h3n-kkjrkv-KIEjDOqYMm7TmWjhKYOrd5Q-cYe2zYgZ" height="50" class="img-circle"></li> 
              <li>
                <div class="dropdown" id="current_user">
                  <button class="btn dropdown-toggle btn-user" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                     @if(Auth::check())
                            {{ Auth::user()->emp_firstname . " " . Auth::user()->emp_lastname  }}
                        @endif
                    <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="logout">Logout</a></li>
                  </ul>
                </div>
              </li>
           </ul>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>
    <div class="container document-list-container" style="margin-top: 120px;">
          <div class="col-md-12">
              <div class="card">
                  <div class="card-header card-gradient">
                       <h4 class="title"><span class="glyphicon glyphicon-time"></span></span>&nbsp;&nbsp;Recent
                        <a class="btn btn-success pull-right" data-toggle="modal" data-target="#createDocumentModal"><span class="glyphicon glyphicon-plus"></span></a>
                       </h4>
                        
                  </div>
                    <div class="card-content">
                        <div class="container-fluid table-container">
                            <table class="table" id="document-table">
                                <thead>
                                    <tr>
                                        <td></td>
                                        <td>Date Created</td>
                                        <td>Status</td>
                                        <td>File Name</td>
                                        <td><center>Total NO. OF Reviewer</center></td>
                                        <td><center>Already approved</center></td>
                                        <td><center>Creator</center></td>
                                        <td></td>
                                    </tr>
                                </thead>
                                <tbody>

                                  @foreach($documents as $document)
                                    <tr>
                                      <td><input type="checkbox" name="checked" ></td>
                                        <td>{{ $document->date_created }}</td>
                                        <td><span class="circle @if($document->status == 1 )  {{'status-approved'}} @else {{ 'status-pending' }} @endif">•</span><span class="status-label">@if($document->status == 1 )  {{'Approved'}} @else {{ 'Pending' }} @endif</span></td>
                                        <td>{{ $document->document_name }}</td>
                                        <td>
                                          <?php
                                          $tooltip_approvers = "";

                                            foreach($document->approvers as $approver){
                                              $tooltip_approvers .= ''. $approver->employee_details->emp_firstname . ' ' . $approver->employee_details->emp_lastname .'</br>' ;
                                            }
                                          ?>
                                          <center>
                                            <a href="#" data-toggle="tooltip" title='{{ $tooltip_approvers }}'>
                                               {{ $document->approvers->count() }}
                                              <br/>
                                            </a>
                                          </center>
                                        </td>
                                        <td><center>1</center></td>
                                        <td><center>{{ $document->creator->emp_firstname . ' ' . $document->creator->emp_lastname }}</center></td>
                                        <td>
                                          <a data-toggle="modal" data-target="#viewDocumentModal" class="btn_view_document" data-value="{{ $document->id }}"><span class="glyphicon glyphicon-eye-open grey">&nbsp</span></a>
                                          <a><span class="glyphicon glyphicon-option-horizontal grey">&nbsp;</span></a>
                                          <a data-toggle="modal" data-target="#deleteDocumentModal" class="btn_delete_document" data-value="{{ $document->id }}"><span class="glyphicon glyphicon-trash grey">&nbsp;</span></a>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>
                    </div>
              </div>
          </div>
      </div>
  @endsection
  @section('modals')
  

      <!-- Create Document Modal -->
    <div class="modal fade" id="createDocumentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel"><img style="height: 20px; margin: 5px;" src="{{ asset('public/img/fav-white.png')}}"></span>Create Attachment</h4>
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
                  <!-- <textarea id="textarea"  rows="1" class="form-control"></textarea> -->
                  <!-- <input type="text" data-provide="typeahead" class="typehead" autocomplete="off"> -->
                  <select data-placeholder="Add Reviewer" class="chosen-select form-control" multiple="" tabindex="-1">
                      <option value=""></option>
                      @foreach($approvers as $employee)
                      <option value="{{ $employee->id }}">{{ $employee->emp_firstname . ' ' . $employee->emp_lastname }}</option>
                      @endforeach
              
                    </select>

                  
                  <br>
                  <br>
                  <label>Attachment</label>
                  <!-- <input type="file" name="" placeholder="File"> -->

                   <form action="/file-upload" id="myAwesomeDropzone"
                    class="dropzone">
                      {{ csrf_field() }}

                      <input type="hidden" name="_code" value="{{ md5(time())}}">
                      <input type="hidden" name="emp_ID" value="{{ Auth::user()->emp_ID}}">
                      <input type="hidden" name="employee_details_id" value="{{ Auth::user()->id}}">
                  </form>
                  <!-- <textarea id="textarea"  rows="1" class="form-control"></textarea> -->
                  <!-- <textarea class="form-control" rows="25" ></textarea> --> 
                  <div id="file_uploads_container" class="hidden">
                    
                  </div>
                </div>
                
            </div>
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="col-md-12">
                <button type="button"  id="btn_save" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign">&nbsp;</span>Save</button>
                <button type="button"  id="btn_for_approve" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign">&nbsp;</span>For Approval</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  <!-- View Document Modal -->
    <div class="modal fade" id="viewDocumentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel"><img style="height: 20px; margin: 5px;" src="{{ asset('public/img/fav-white.png')}}"></span>View Attachment</h4>
          </div>
          <div class="modal-body">
            <div class="container-fluid">
                <div class="col-md-12">
                  <label>File Name</label>
                  <input type="text" name="document_name" placeholder="Document Name" class="form-control">
                </div>
                <br>
                <br>
                <br>
                <br>
                <div class="col-lg-9">
                  <label>Attachment</label>
                  <div class="file_holder" style="width: 100%;">
                    
                  
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
                  <!-- <iframe src="https://docs.google.com/gview?url=https://docs.google.com/document/d/1llhbwQ3i9VkX4JrxkS1KHbmfC4tSam_9iOf8_Hc0Rkw&embedded=true"></iframe> -->
                  <!-- <textarea class="form-control" rows="25" ></textarea> -->
                </div>
                <div class="col-md-3">
                  <label>Created By:</label>
                  <div id="attachment-list-container">
                     <input type="text" name="created_by" placeholder="Creator" class="form-control disabled" disabled>
                  </div>
                  <br>
                  <label>Approved by</label>
                  <div id="approver-list-container">

                     <!-- <h5>John Doe <span class="status-ok pull-right green"><img src="{{ asset('public/img/status/check.png') }}"></span></h5>
                     <h5>John Doe</h5>
                     <h5>John Doe</h5> -->
                  </div>
                </div>
               <!-- <div class="col-md-12">
                <hr>
               <span class="label label-success">2 Comments</span>
                <p class="">
                  <span>
                    <b>John Manuel Derecho</b>
                    <span>&nbsp;</span>
                    <span>alryty !</span>
                  </span>
                </p>
               </div> -->
            </div>
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="col-md-12">
                <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign">&nbsp;</span>Add Comment</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
 <!-- Delete Modal -->
  <div class="modal fade" id="deleteDocumentModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Delete Document</h4>
        </div>
        <div class="modal-body">
          <p>Are you sure you want to delete <span> Document</span>.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Delete</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
  @endsection

  @section('scripts')
  <script src="{{ asset('public/js/chosen.jquery.min.js') }}"></script>
  <script src="{{ asset('public/js/dropzone.js') }}"></script>
  <!-- <span class="status-ok pull-right green"><img src="{{ asset('public/img/status/check.png') }}"></span>
 -->
  <script type="text/javascript">
    var imagecounter = 0;

    $(".chosen-select ").chosen({
        disable_search_threshold: 10,
        no_results_text: "No Result(s) Found!",
        width: "100%"
    });


    Dropzone.options.myAwesomeDropzone = {
      url: "document/upload",
      paramName: "file", // The name that will be used to transfer the file
      maxFilesize: 10, // MB
      accept: function(file, done) {
        console.log(file[0]);
        console.log("add");

        var file_name = "document_" + (++imagecounter) + "." + getExtension(file.name);
        console.log(file_name);
        $('#file_uploads_container').append('<input class="upload-input" type="hidden" name="file_uploads[]" value="' + file_name +'">');

        done(); 
      },
      addRemoveLinks: true,
      removedfile: function(file) {
          console.log([file, "delete"]);
           var filenames = [];
           var found = false;

           $("#file_uploads_container input.upload-input").each(function(){
              if(file.name == $(this).val() && (!found) ){
                $(this).remove();
                found = true;
              }
          });

          var _ref;
          return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
      },
      renameFilename: function (filename) {
          return "document_" + (imagecounter) + "." + getExtension(filename);
      }
    };

    $(document).ready(function(){
      
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
          "document_name" : $("#createDocumentModal input[name=document_name]").val(),
          "revision_number" : $('#createDocumentModal input[name=revision_number]').val(),
          "file_uploads" : filenames,
          "reviewers" :  $("#createDocumentModal .chosen-select").val(),
          "creator" : $("input[name=employee_details_id]").val()       
        }, 
        success: function(result){
          console.log(result);
          if(result.success){
            location.reload();
          }else{
            alert("error");
          }

          // location.reload();
        }});
    });

    $(".btn_view_document").click(function(){

      // GET Document
       $.ajax({url:  "document/" + $(this).attr('data-value'), 
        method: 'GET', 
        success: function(result){
          $('#approver-list-container').html('');
          $("#viewDocumentModal input[name=document_name]").val(result.document_name);
          $("#viewDocumentModal input[name=created_by]").val(result.creator.emp_firstname + " " + result.creator.emp_lastname);
          var checked = "";

          if(result.approvers != null){
            result.approvers.forEach(function(approver, index) {
                if( approver.status == 1){
                  checked = '<span class="status-ok pull-right green"><img src="' + root_URL + 'public/img/status/check.png"></span>';
                }else{
                  checked = "";
                }
                $('#approver-list-container').append('<h5> ' + approver.employee_details.emp_firstname + ' ' + approver.employee_details.emp_lastname + checked + '</h5>')
            });
          }
          console.log(result);
        }});

       // GET Document attachment
       $.ajax({url:  "document/" + $(this).attr('data-value') + "/attachment", 
        method: 'GET', 
        success: function(result){
          $('#approver-list-container').html('');
          $("#viewDocumentModal input[name=document_name]").val(result.document_name);
          $("#viewDocumentModal input[name=created_by]").val(result.creator.emp_firstname + " " + result.creator.emp_lastname);
          var checked = "";

          if(result.approvers != null){
            result.approvers.forEach(function(approver, index) {
                if( approver.status == 1){
                  checked = '<span class="status-ok pull-right green"><img src="' + root_URL + 'public/img/status/check.png"></span>';
                }else{
                  checked = "";
                }
                $('#approver-list-container').append('<h5> ' + approver.employee_details.emp_firstname + ' ' + approver.employee_details.emp_lastname + checked + '</h5>')
            });
          }
          console.log(result);
        }});


    });


  </script>
  @endsection