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
          <div class="col-md-4 col-md-offset-4">
              <div class="card">
                  <!-- <div class="card-header card-gradient">
                       <h4 class="title"><span class="glyphicon glyphicon-time"></span>&nbsp;&nbsp;Edit Profile 
                  </div> -->
                    <div class="card-content">
                       <div class="col-md-12">
                         <a href="profile/edit" class="btn btn-default pull-right">Edit Profile</a>
                       </div>
                        <div class="col-md-4 col-md-offset-4">
                            <center>
                              <br>
                              <br>
                              <img src="{{ Auth::user()->profile_url}}" class="img-responsive img-circle">
                              <br>
                            </center>
                        </div>
                        <div class="col-md-12">
                          <center> 
                            <h3 style="color: #656B6E;">{{Auth::user()->emp_firstname . ' ' . Auth::user()->emp_lastname}}</h3>
                            <h5 style="color: #B9BDBE">{{Auth::user()->position->position_description}}</h5>
                            <h5 style="color: #B9BDBE">{{Auth::user()->emp_email }}</h5>
                            <h5 style="color: #B9BDBE">{{Auth::user()->gender() }}</h5>
                            <hr>
                            <br>
                            <a href="profile/changepass" class="btn btn-success">Change Password</a> 
                            <br>
                            <br>
                            <br>
                            <br>
                            </center>
                        </div>

                    </div> 
              </div>
          </div>
      </div>
      <!-- <div class="col-md-12">
        <div id="custom-overlay" class="loading-shown" style="position: fixed; z-index: 2; top: 0px; left: 0px; width: 100%; height: 100%;">
      <div class="loading-spinner">
        Custom loading...
      </div>
    </div>
      </div> -->
@endsection
@section('scripts')
<script src="{{ asset('public/js/chosen.jquery.min.js') }}"></script>
<script src="{{ asset('public/js/dropzone.js') }}"></script>
<script type="text/javascript">

  $(document).on("click", "#btn_approve", function(){
       var id = $(this).attr('data-value');

         $.ajax({url:  '{{ url("document/status") }}' , 
          method: 'POST', 
          data: { 
            "_token" : $("input[name=_token]").val(),     
            "status" : "approve",     
            "old_status" : "for-approval",     
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
    
    $(document).on("click", "#btn_disapprove", function(){
       var id = $(this).attr('data-value');

         $.ajax({url:  '{{ url("document/status") }}' , 
          method: 'POST', 
          data: { 
            "_token" : $("input[name=_token]").val(),     
            "status" : "disapprove",     
            "old_status" : "for-approval",     
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
              location.reload();
            }else{
              console.log(result);
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
              location.reload();
            }else{
              console.log(result);
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
              $('#comment_container').append(comment);
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