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
    .btn.action-btn.pull-right {
        margin-top: -28px !important;
        margin-left: 5px;
    }
    .loading-spinner {
    font-size: 12px;
    margin: 6.7em auto;
    width: 1em;
    height: 1em;
    border-radius: 50%;
    position: relative;
    text-indent: -9999em;
    -webkit-animation: load4 1.3s infinite linear;
    animation: load4 1.3s infinite linear;
}
    </style>
@endsection
@section('content')

  @include('nav')
	
     <div class="container document-list-container" style="margin-top: 120px;">
          <div class="col-md-8 col-md-offset-2">
              <div class="card">
                  <div class="card-header card-gradient">
                       <h4 class="title"><span class="glyphicon glyphicon-time"></span></span>&nbsp;&nbsp;View Document
                       </h4>
                       {{ csrf_field() }}
                       <input type="hidden" name="_code" value="{{ md5(time())}}">
                        @if(Auth::user()->isSuperAdmin())
                          @if($document->status == 1)
                              <!--  <button id="btn_disapprove" type="button" class="btn btn-danger pull-right action-btn" data-value="{{$document->id}}"><span class="glyphicon glyphicon-thumbs-down">&nbsp;</span>Disapprove</button>
                               <button id="btn_approve" type="button" class="btn btn-success pull-right action-btn" data-value="{{$document->id}}"><span class="glyphicon glyphicon-thumbs-up">&nbsp;</span>Approve</button> -->
                          @elseif($document->status == 2)
                            <button id="btn_final_approve" type="button" class="btn btn-success pull-right action-btn" data-value="{{$document->id}}"><span class="glyphicon glyphicon-thumbs-up">&nbsp;</span>Final Approve</button>
                          @endif
                        @endif

                        @if(Auth::user()->id == $document->creator->id)
                            @if($document->status == 0)
                                <button id="btn_send_for_approval" type="button" class="btn btn-success pull-right action-btn" data-value="{{$document->id}}"><span class="glyphicon glyphicon-send">&nbsp;</span>Send for Approval</button>
                            @elseif($document->status == 1)
                               @foreach($document->approvers as $approver)
                                  @if($approver->status == 2) <!-- Disapprove -->
                                      <button id="btn_resend_for_approval" type="button" class="btn btn-success pull-right action-btn" data-value="{{$document->id}}"><span class="glyphicon glyphicon-send">&nbsp;</span>Resend for Approval</button>
                                    @break
                                  @endif
                               @endforeach
                            @elseif($document->status == 4)
                               @foreach($document->approvers as $approver)
                                  @if($approver->status == 2) <!-- Disapprove -->
                                      <button id="btn_resend_for_approval" type="button" class="btn btn-success pull-right action-btn" data-value="{{$document->id}}"><span class="glyphicon glyphicon-send">&nbsp;</span>Resend for Approval</button>
                                    @break
                                  @endif
                               @endforeach
                            @endif

                        @else
                          @foreach($document->approvers as $approver)
                              @if($approver->employee_details_id == Auth::user()->id)
                                @if($document->status == 1)
                                  @if($document->isContributor)
                                    @if($approver->status == 0) <!-- not yet -->
                                      <button id="btn_disapprove" type="button" class="btn btn-danger pull-right action-btn" data-value="{{$document->id}}"><span class="glyphicon glyphicon-thumbs-down">&nbsp;</span>Disapprove</button>
                                      <button id="btn_approve" type="button" class="btn btn-success pull-right action-btn" data-value="{{$document->id}}"><span class="glyphicon glyphicon-thumbs-up">&nbsp;</span>Approve</button>
                                    @endif
                                  @endif
                                @elseif($document->status == 4)
                                     @if($approver->status == 0) <!-- not yet -->
                                      <button id="btn_disapprove" type="button" class="btn btn-danger pull-right action-btn" data-value="{{$document->id}}" data-old-status="reviewed"><span class="glyphicon glyphicon-thumbs-down">&nbsp;</span>Disapprove</button>
                                      <button id="btn_approve" type="button" class="btn btn-success pull-right action-btn" data-old-status="reviewed"data-value="{{$document->id}}"><span class="glyphicon glyphicon-thumbs-up">&nbsp;</span>Approve</button>
                                    @endif
                                @endif
                              @endif
                          @endforeach
                        @endif
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
                              <?php $counter = 0;?>
                            @if($document->status == 3)
                                @foreach($document->attachments as $attachment)
                                  <?php $counter++; ?>
                                  @if($document->attachments->count() == $counter)
                                  <label>Final Attachment</label>
                                    <div class="col-md-12">
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
                                </div>
                                  @endif
                                @endforeach
                                @endif
                           	<br>
                            @if($document->status < 3 || $document->status == 4)
                           	 <label>Attachment</label>
                             @endif
                           	<div>
                              @if($document->status < 3 || $document->status == 4)
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
                              @endif
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
                        @if($document->approvers->where('type',1)->count() != 0)
  			                  <label>Reviewers</label>
  			                  <div id="approver-list-container">
  			                  	@foreach($document->approvers->where('type',1) as $approver)
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
                        @endif
                        @if($document->approvers->where('type',2)->count() != 0)
                          <label>Approvers</label>
                          <div id="approver-list-container">
                            @foreach($document->approvers->where('type', 2) as $approver)
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
                        @endif
			                  <label>Status: </label>
			                  <span class="circle {{ $document->statusClass() }}">•</span><span class="status-label">{{ $document->statusString() }}</span>
                        </div>
                         <div class="col-md-12" id="commentbox_container">
                
               
                 <table style="width: 100%">
                   <tr>
                    <td></td>
                    <td id="attachment_holder"><br>
                  <label>Attachment</label>
                  <!-- <input type="file" name="" placeholder="File"> -->

                   <form style="margin-bottom: 20px" action="/comment/upload" id="viewDocumentDropzoneComment"
                    class="dropzone">
                      {{ csrf_field() }}

                      <input type="hidden" name="_code" value="{{ md5(time())}}">
                      <input type="hidden" name="emp_ID" value="{{ Auth::user()->emp_ID}}">
                      <input type="hidden" name="employee_details_id" value="{{ Auth::user()->id}}">
                  </form>
                  <!-- <textarea id="textarea"  rows="1" class="form-control"></textarea> -->
                  <!-- <textarea class="form-control" rows="25" ></textarea> --> 
                  <div id="comment_attachment_holder" class="hidden">
                    
                  </div></td>
                  <td>
                    
                  </td>
                  </tr>
                   <tr>
                    <td style='width: 10%; padding-left: 15px;'> <span><img class="comment_profile" style="width: 30px;" src="http://localhost/docpro/public/img/mopro_profile.png">
                </span></td>
                    <td style='width: 80%'>
                      <input type="hidden" name="document_id">
                      <textarea id="comment_area" style="width: 97%"></textarea>
                      <a id="btn_attachment"  ><span class="glyphicon glyphicon-paperclip"></span></a>
                    </td>
                    <td style='width: 10%'><button id="btn_send_comment" class="btn btn-success" style="margin-left: 10px" data-value="{{$document->id}}">Send</button></td>
                  </tr>
                 
                 </table>

              <br>
              <br>
               </div>
               <span class="label label-success">{{count( $document->comments) }} Comments</span>
                  <div class="col-md-12" id="comment_container">
    		                <!-- <hr style="height: 2px; border-color: #dadada;"> -->
    		               <!-- <span class="label label-success">{{count( $document->comments) }} Comments</span> -->
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
                  </div>
              </div>
          </div>
      </div>
@endsection
@section('scripts')
<script src="{{ asset('public/js/chosen.jquery.min.js') }}"></script>
<script src="{{ asset('public/js/dropzone.js') }}"></script>
<script type="text/javascript">

  $(document).on("click", "#btn_approve", function(){
       var id = $(this).attr('data-value');
       var old_status = "for-approval";
       if($(this).attr('data-old-status')){
          old_status = $(this).attr('data-old-status');
       }

       $.ajax({url:  '{{ url("document/status") }}' , 
        method: 'POST', 
        data: { 
          "_token" : $("input[name=_token]").val(),     
          "status" : "approve",     
          "old_status" : old_status,  
          "document_id" : id,     
          "employee_details_id" : {!! Auth::user()->id !!} ,     
        }, 
        success: function(result){
          if(result.success){
            alert_message('Successfully approved the document', true);
          }else{
            alert_message('Error in approving the document');
          }
      }});
    });
    
    $(document).on("click", "#btn_disapprove", function(){
       var id = $(this).attr('data-value');
        var old_status = "for-approval";
       if($(this).attr('data-old-status')){
          old_status = $(this).attr('data-old-status');
       }
         $.ajax({url:  '{{ url("document/status") }}' , 
          method: 'POST', 
          data: { 
            "_token" : $("input[name=_token]").val(),     
            "status" : "disapprove",     
            "old_status" : old_status,      
            "document_id" : id,     
            "employee_details_id" : {!! Auth::user()->id !!} ,     
          }, 
          success: function(result){
            if(result.success){
              alert_message('Successfully disapproved the document', true);
            }else{
              alert_message('Error in disapproving the document');
            }
        }});
    });

    $(document).on("click", "#btn_send_for_approval", function(){
       var id = $(this).attr('data-value');

         $.ajax({url:  '{{ url("document/status") }}' , 
          method: 'POST', 
          data: { 
            "_token" : $("input[name=_token]").val(),     
            "status" : "for-approval",     
            "old_status" : "draft",     
            "document_id" : id,     
            "employee_details_id" : {!! Auth::user()->id !!} ,     
          }, 
          success: function(result){
            if(result.success){
              alert_message('Successfully sent the document for approval', true);
            }else{
              alert_message('Error in sending document for approval');
            }
        }});
    });

    $(document).on("click", "#btn_resend_for_approval", function(){
       var id = $(this).attr('data-value');

         $.ajax({url:  '{{ url("document/status") }}' , 
          method: 'POST', 
          data: { 
            "_token" : $("input[name=_token]").val(),     
            "status" : "resend-for-approval",     
            "old_status" : "for-approval",     
            "document_id" : id,     
            "employee_details_id" : {!! Auth::user()->id !!} ,     
          }, 
          success: function(result){
            if(result.success){
              alert_message('Successfully resent the document for approval', true);
            }else{
              alert_message('Error in resending document for approval');
            }
        }});
    });
    
    $('#btn_toggle_commentbox').click(function(){
          $('#commentbox_container').fadeToggle(500);
    });

    $(document).on('click','#btn_final_approve', function(){
      var id = $(this).attr('data-value');

         $.ajax({url:  '{{ url("document/status") }}' , 
          method: 'POST', 
          data: { 
            "_token" : $("input[name=_token]").val(),     
            "status" : "approve",     
            "old_status" : "pre-approved",     
            "document_id" : id,     
            "employee_details_id" : {!! Auth::user()->id !!} ,     
          }, 
          success: function(result){
            if(result.success){
              location.reload();
            }else{
              console.log(result);
            }
        }});
    });

  $("#btn_attachment").click(function(){
    $("#attachment_holder").fadeToggle(500);
  });

  $('#btn_send_comment').click(function(){
    alert("awd");
    
    var filenames = [];

     $("input.comment-upload-input").each(function(){
        filenames.push({filename : $(this).val()});
    });

    var message = $('#comment_area').val();
    var document_id = $(this).attr('data-value');
    var comment_attachment = filenames;
    var employee_details_id = $('input[name=employee_details_id]').val();

    // $("body").loading();
   

    $.ajax({url:  '{{ url("document/comment") }}' , 
        method: 'POST', 
        data: { 
          "_token" : $("input[name=_token]").val(),     
          "_code" : $("input[name=_code]").val(),     
          "document_id" : document_id,   
          "comment_attachments" : comment_attachment,  
          "message" : message,     
          "employee_details_id" : employee_details_id,     
        }, 
        success: function(result){
          console.log(result);
          
          if(result.success){

              var comment = "";
              comment = '<p class="comment_holder">';
              comment += '<span>';
              comment += '<br>';
              comment += '<img style="width: 30px;" src="' + root_URL + 'public/img/mopro_profile.png">&nbsp;&nbsp;<b>'+ result.comment.commentor.emp_firstname + ' ' + result.comment.commentor.emp_lastname +'</b>';
              comment += '<span>&nbsp;</span>';
              comment += '<span>commented at </span>';
              comment += '<span>'+ result.comment.created +'</span>';
              comment += '<br>';
              comment += '<br>';
              comment += '<span class="comment_text_holder">';
              // comment += '<img src="{{asset('/public/img/status/check.png')}}">&nbsp;';
              comment +=  message;
              comment += '</span>';
              comment += '</span>';
              comment += ' </p>';
              $('#comment_container').prepend(comment);
              $('#comment_area').val("");
          }else{
            console.log(result);
          }
      },error : function(result){
          
      }});

  });

  Dropzone.options.viewDocumentDropzoneComment  = {
      url: '{{ url("comment/upload") }}',
      paramName: "file", // The name that will be used to transfer the file
      maxFilesize: 10, // MB
      accept: function(file, done) {
        console.log(file[0]);
        console.log("add");

        var file_name = file.name;
        // console.log(file_name);

        $('#comment_attachment_holder').append('<input class="comment-upload-input" type="hidden" name="comment_file_uploads[]" value="' + file_name.replace(/\s/g,'') +'">');

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
</script>

@endsection