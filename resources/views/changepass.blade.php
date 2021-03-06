@extends('main')
<?php //echo($document); return; ?>
@section('title')
Change Password : DocPro
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
    form .error {
      color: #ff0000;
    }
    form label.error {
      color: #ff0000;
      padding-bottom: 10px;
      padding-top: 2px;
    }
    </style>

@endsection
@section('content')

    @include('nav')
	
     <div class="container document-list-container" style="margin-top: 120px;">
          <div class="col-md-4 col-md-offset-4">
              <div class="card">
                    <div class="card-content">
                       <div class="col-md-12">
                          <a href="{{url('profile')}}" class="btn btn-default pull-left">Back to Profile</a>
                          <br>
                          <br>
                          <form action="" name="changepass">
                            <label>Change Password</label>
                            <br>
                            {{ csrf_field() }}
                            <input type="hidden" name="user_id" value="{{ Auth::user()->id }}">
                            <br>
                            <input type="password" class="form-control" name="old_password" placeholder="Old Password">
                            <br>
                            <input type="password" class="form-control" name="new_password" placeholder="New Password">
                            <br>
                            <input type="password" class="form-control" name="confirm_password" placeholder="Confirm Password">
                            <br>
                            <button type="submit" class="btn btn-success" id="btn_change_password">Change Password</button>
                            <br>
                            <br>
                          </form>
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
  // Wait for the DOM to be ready
$(function() {
  // Initialize form validation on the registration form.
  // It has the name attribute "registration"
  $("form[name='changepass']").on("submit", function(e){
    e.preventDefault();
  });
  $("form[name='changepass']").validate({
    // Specify validation rules
    rules: {
      // The key name on the left side is the name attribute
      // of an input field. Validation rules are defined
      // on the right side
      old_password: {
        required: true,
        minlength: 4
      },
      new_password: {
        required: true,
        minlength: 4
      },
      confirm_password: {
        required: true,
        minlength: 4
      }
    },
    // Specify validation error messages
    messages: {
      password: {
        required: "Please provide a password",
        minlength: "Your password must be at least 5 characters long"
      }
    },
    // Make sure the form is submitted to the destination defined
    // in the "action" attribute of the form when valid
    submitHandler: function(form) {
      $.ajax({url:  "{{url('profile/changepass')}}" , 
          method: 'POST', 
          data: $("form[name='changepass']").serialize(), 
          success: function(result){
              console.log(result);
              if(result.success){
                alert_message(result.message, result.success);
              }else{
                alert_message(result.message, result.success);
              }
        },error : function(){
          console.log("error");
        }});
      return true;
    }
  });
});
</script>

@endsection