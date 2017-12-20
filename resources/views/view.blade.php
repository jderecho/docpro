@extends('main')
@section('title')
Dashboard: Doc Pro
@endsection
@section('css')
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
            <!-- <li> <a class="navbar-brand" ><img class="img-responsive pull-left" src="{{ asset('public/img/mopro_logo.png') }}"><div class="ripple-container"></div></a></li>
            <li>  --> 
              <img style="height: 50px; margin-left: 5px;" class="img-responsive pull-left" src="{{ asset('public/img/docpro_logo_final.png') }}">
            </li>
           </ul>
          
        
          <ul class="nav navbar-nav navbar-right white">
              <li style="height: 50px;margin-right: 10px;"><h4 class="mopro-time" style="    padding-top: 10px;"><span class="glyphicon glyphicon-time violet">&nbsp;</span><div id="time"></div></h4></li>
              <li><div><a class="btn btn-success" href="{{url('login')}}" style=" margin-right: 10px; margin-top: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;LOGIN&nbsp;&nbsp;&nbsp;</a> &nbsp; </div></li>
           </ul>
           
        </div><!--/.navbar-collapse -->
      </div>
    </nav>
    <div class="container document-list-container" style="margin-top: 120px;">
          <div class="col-md-12">
              <div class="card">
                  <div class="card-header card-gradient">
                       <h4 class="title"><span class="glyphicon glyphicon-time"></span></span>&nbsp;&nbsp;Approved Documents
                        <!-- <a class="btn btn-success pull-right" data-toggle="modal" data-target="#createDocumentModal"><span class="glyphicon glyphicon-plus"></span></a> -->
                       </h4>
                        
                  </div>
                    <div class="card-content">
                        <div class="container-fluid table-container">
                          @if($documents->count() == 0)
                          <div class="col-md-12">
                            <center><h4>No Approved Documents</h4></center>
                          </div>
                          <br>&nbsp;
                          <br>&nbsp;
                          @else
                            <table class="table" id="document-table">
                                <thead>
                                    <tr>
                                        <td class="text-left">Date Created</td>
                                        <td>Document Name</td>
                                        <td><center>Revision Number</center></td>
                                        <td><center>Department</center></td>
                                        <td>Status</td>
                                        <!-- <td><center>Total NO. OF Reviewer</center></td>
                                        <td><center>Already approved</center></td> -->
                                        <td><center>Originator</center></td>
                                        <td class="text-right">OPTIONS</td>
                                    </tr>
                                </thead>
                                <tbody>

                                  @foreach($documents as $document)
                                    <tr>
                                        <td>{{ $document->formattedDateCreated() }}</td>
                                        <td>{{ $document->document_name }}</td>
                                        <td><center>{{ $document->revision_number }}</center></td>
                                        <td>
                                          <?php
                                          $tooltip_departments = "";
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
                                            </a>
                                          </center>
                                        </td>
                                        <td><span class="circle {{ $document->statusClass() }}">•</span><span class="status-label">{{ $document->statusString() }}</span></td>
                                     
                                        
                                       <!--  <td><center>{{ $document->approvers->where('status','=', '1')->count() }}</center></td> -->
                                        <td><center>{{ $document->creator->emp_firstname . ' ' . $document->creator->emp_lastname }}</center></td>
                                        <td >
                                          <div class="pull-right">
                                          <a title="View" data-toggle="modal" data-target="#viewDocumentModal" class="btn_view_document" data-value="{{ $document->id }}"><span class="glyphicon glyphicon-eye-open grey">&nbsp</span></a>
                                          </div>
                                        </td>
                                    </tr>
                                    @endforeach
                                </tbody>
                            </table>
                            @endif
                        </div>
                    </div>
              </div>
          </div>
      </div>
  @endsection
  @section('modals')
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
                  <label>File Name </label>
                    <br>
                    <span id="span_document_name"></span>

                      {{ csrf_field() }}
                </div>
                <br>
                <br>
                <br>
                <br>
                <div class="col-lg-9">
                  <label>Final Attachment</label>
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
                  <label>Approved by</label>
                  <div id="approver-list-container">
                  </div>
                </div>
               <div class="col-md-12" id="comment_container">
                <hr style="height: 2px; border-color: #dadada;">
               <!-- <span class="label label-success">2 Comments</span> -->
                
               </div>
               <div class="col-md-12" id="commentbox_container">
                
               </div>
            </div>
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="col-md-12 button-container">
                <!-- <button type="button" class="btn btn-success" id="btn_toggle_commentbox"><span class="glyphicon glyphicon-comment">&nbsp;</span>Add Comment</button> -->
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  @endsection
  @section('scripts')
  <script>

  // VIEW MODAL
    $(".btn_view_document").click(function(){
       $("#viewDocumentModal #department-list-container").html('');
       $("#viewDocumentModal #comment_container").html('');
        $('.file_holder').html('');
        $('#approver-list-container').html('');

      // GET Document
       $.ajax({url:  "{!! url('document') !!}/" + $(this).attr('data-value'), 
        method: 'GET', 
        success: function(result){
          console.log(result);

          $("#viewDocumentModal #span_document_name").html(result.document_name);
          $("#viewDocumentModal input[name=created_by]").val(result.creator.emp_firstname + " " + result.creator.emp_lastname);

          // $("#viewDocumentModal input[name=document_id]").val(result.id);

          var checked = "";
          var comment = "";
          if(result.approvers != null){
            result.approvers.forEach(function(approver, index) {
                if( approver.status == 1){
                  checked = '<span class="status-ok pull-right green"><img src="' + root_URL + 'public/img/status/check.png"></span>';
                }else if(approver.status == 2){
                  checked = '<span class="status-ok pull-right green"><img src="' + root_URL + 'public/img/status/uncheck.png"></span>';
                }else{
                  checked = "";
                }

                $('#approver-list-container').append('<h5> ' + approver.employee_details.emp_firstname + ' ' + approver.employee_details.emp_lastname + checked + '</h5>')


            });
          }

          if(result.departments != null){
            result.departments.forEach(function(department, index){
              var department_str = '<span class="badge ">'+ department.employee_dept.dept_description+'</span>';
              $("#viewDocumentModal #department-list-container").append(department_str);
            });
          }

           if(result.attachments != null){
            result.attachments.forEach(function(file, index){
              if(result.attachments.length == index + 1){
              var attachment_view = '<a target="_blank" href=" {{asset('/')}}' +  file.file_location+'">';
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

                $('.file_holder').append(attachment_view);
              }
            });
          }
        }});
    });
</script>
  @endsection