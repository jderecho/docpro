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
            <li> <a class="navbar-brand" href="{{url('home')}}"><img class="img-responsive pull-left" src="{{ asset('public/img/mopro_logo.png') }}"><div class="ripple-container"></div></a></li>
            <li>  
              <img style="height: 50px; margin-left: 5px;" class="img-responsive pull-left" src="{{ asset('public/img/docpro_logo_final.png') }}">
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