@extends('main')
<?php //echo($document); return; ?>
@section('title')
View Document : DocPro
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
               @if(Auth::check())
              <li><img src="{{ asset('public/img/mopro_profile_1.png') }}" height="50" class="img-circle"></li> 
              
              <li>
                <div class="dropdown" id="current_user">
                  <button class="btn dropdown-toggle btn-user" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    
                            {{ Auth::user()->emp_firstname . " " . Auth::user()->emp_lastname  }}
                        
                    <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="{{ url('logout') }}">Logout</a></li>
                  </ul>
                </div>
              </li>
              @endif
           </ul>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>
     <div class="container document-list-container" style="margin-top: 120px;">
          <div class="col-md-8 col-md-offset-2">
              <div class="card">
                  <div class="card-header card-gradient">
                       <h4 class="title"><span class="glyphicon glyphicon-time"></span></span>&nbsp;&nbsp;View Document
                       </h4>
                  </div>
                    <div class="card-content">
                        <div class="container-fluid table-container">
                           <div class="col-md-12">
                           	<label>Document Name</label>
                           	<input text="text" disabled="" value="{{ $document->document_name}}" class="form-control" >
                           </div>
                           <div class="col-md-12">
                           	<br>
                           	<label>Revision Number</label>
                           	<input text="text" disabled="" value="{{ $document->revision_number}}" class="form-control" >
                           </div>
                           <div class="col-md-9">
                           	<br>
                           	<label>Attachment</label>
                           	<div>
                           		@foreach($document->attachments as $attachment)
                           			<a target="_blank" href="{{url($attachment->file_location)}}">
					                 <div style="float: left; margin-left: 10px;">
					                 <div class="card" style="width:100px">
					                 <img class="card-img-top" src="{{url('public/img/doctype/word.jpg')}}" alt="Card image" style="width:100%">
					                  <div class="card-body">
					                 <center>
					                  <span class="card-text">{{ basename($attachment->file_location)}}</span>
					                  </center>
					                  </div>
					                  </div>
					                  </div>
					                  </a>
                           		@endforeach
                           	</div>

                           </div>
                           <div class="col-md-3">
                           	<br>
                           	 <label>Created By:</label>
			                  <div id="attachment-list-container">
			                     <input type="text" name="created_by" value="{{$document->creator->emp_firstname . ' ' . $document->creator->emp_lastname}}" placeholder="Creator" class="form-control disabled" disabled>
			                  </div>
			                  <br>
			                  <label>Department:</label>
			                  <div id="department-list-container">
			                  	@foreach($document->departments as $department)
			                     <span class="badge ">{{ $department->employee_dept->dept_description }}</span>
			                     @endforeach
			                  </div>
			                  <br>
			                  <label>Approved by</label>
			                  <div id="approver-list-container">
			                  	@foreach($document->approvers as $approver)
			                      @if( $approver->status == 1)
					                  <h5>{{ $approver->employee_details->emp_firstname . ' ' . $approver->employee_details->emp_lastname}} <span class="status-ok pull-right green"><img src="{{ url('public/img/status/check.png') }}"></span></h5> 
					              @elseif($approver->status == 2)
					                <h5>{{ $approver->employee_details->emp_firstname . ' ' . $approver->employee_details->emp_lastname}} <span class="status-ok pull-right green"><img src="{{ url('public/img/status/uncheck.png') }}"></span></h5> 
					              @else
					              	<h5>{{ $approver->employee_details->emp_firstname . ' ' . $approver->employee_details->emp_lastname}} </h5>
					              @endif
			                     @endforeach
			                  </div>
			                  <br>
			                  <label>Status: </label>
			                  <span class="circle {{ $document->statusClass() }}">•</span><span class="status-label">{{ $document->statusString() }}</span>
                        </div>

                        <div class="col-md-12" id="comment_container">
		                <hr style="height: 2px; border-color: #dadada;">
		               <span class="label label-success">{{count( $document->comments) }} Comments</span>

		               		@foreach( $document->comments as $comment)
		                	<p class="comment_holder">
			                <span>
			                <br>
			                <img style="width: 30px;" src="{{asset('public/img/mopro_profile.png')}}">&nbsp;&nbsp;<b>{{ $comment->commentor->emp_firstname . ' ' . $comment->commentor->emp_lastname}}</b>
			                <span>&nbsp;</span>
			                <span>{{ $comment->action}}</span>
			                <span></span>
			               <span></span>
			                <br>
			                <br>
			                <span class="comment_text_holder">
			                	{{$comment->message}}
			                </span>
			                </span>
			                 </p>
			                 @endforeach()
		               </div>
		               <div class="col-md-12" id="commentbox_container">
		                
		               
		                 <table style="width: 100%">
		                   <tr>
		                    <td></td>
		                    <td id="attachment_holder"><br>
		                  <label>Attachment</label>
		                  <!-- <input type="file" name="" placeholder="File"> -->

		                   <form action="/file-upload" id="view_document_dropzone_comment"
		                    class="dropzone">
		                      {{ csrf_field() }}
		                      @if(Auth::check())
		                      <input type="hidden" name="_code" value="{{ md5(time())}}">
		                      <input type="hidden" name="emp_ID" value="{{ Auth::user()->emp_ID}}">
		                      <input type="hidden" name="employee_details_id" value="{{ Auth::user()->id}}">
		                      @endif
		                  </form>
		                  <!-- <textarea id="textarea"  rows="1" class="form-control"></textarea> -->
		                  <!-- <textarea class="form-control" rows="25" ></textarea> --> 
		                  <div id="file_uploads_container" class="hidden">
		                    
		                  </div></td>
		                  <td>
		                    
		                  </td>
		                  </tr>
		                   <tr>
		                    <td style='width: 10%; padding-left: 15px;'> <span><img class="comment_profile" style="width: 30px" src="http://localhost/docpro/public/img/mopro_profile.png">
		                </span></td>
		                    <td style='width: 80%'>
		                      <input type="hidden" name="document_id">
		                      <textarea id="comment_area" style="width: 97%"></textarea>
		                      <a id="btn_attachment"  ><span class="glyphicon glyphicon-paperclip"></span></a>
		                    </td>
		                    <td style='width: 10%'><button id="btn_send_comment" class="btn btn-success" style="margin-left: 10px">Send</button></td>
		                  </tr>
		                 
		                 </table>
		               </div>
                    </div>
              </div>
          </div>
      </div>

@endsection
@section('scripts')
<script src="{{ asset('public/js/chosen.jquery.min.js') }}"></script>
<script src="{{ asset('public/js/dropzone.js') }}"></script>
<script type="text/javascript">

</script>
@endsection