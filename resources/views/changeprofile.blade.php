@extends('main')
<?php //echo($document); return; ?>
@section('title')
View Document : DocPro
@endsection

@section('css')
<link href="{{ asset('public/css/chosen.min.css') }}" rel="stylesheet">
<link href="{{ asset('public/css/dropzone.css') }}" rel="stylesheet">
<link href="{{ asset('public/css/profile.css') }}" rel="stylesheet">

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
                         <a href="{{ url('profile') }}" class="btn btn-default pull-left">Back</a>
                       </div>
                        <div class="col-md-4 col-md-offset-4 hover-trigger">
                            <center>
                              <br>
                              <br>
                              <img src="{{ Auth::user()->profile_url}}" class="img-circle" id="profile_pic">
                              <span class="change-profile-text">Change Profile Picture</span> <span class="glyphicon glyphicon glyphicon-cog gear-profile"></span>
                            </center>
                            <div class="profile-overlay">
                              
                            </div>
                        </div>
                        <div class="col-md-12">
                          <form id="form-profile">
                            <label>First Name</label>
                            <input type="text" name="emp_firstname" placeholder="First Name" class="form-control" value="{{ Auth::user()->emp_firstname }}">
                            <br>
                            <label>Middle Name</label>
                            <input type="text" name="emp_middlename" placeholder="Middle Name" class="form-control" value="{{ Auth::user()->emp_middlename }}">
                            <br>
                             <label>Last Name</label>
                            <input type="text" name="emp_lastname" placeholder="Last Name" class="form-control" value="{{ Auth::user()->emp_lastname }}">
                            <br>
                            <label>Department</label>
                            <select class="form-control department-list" name="department" id="department-list">
                              @foreach($departments as $department)
                              <option value="{{ $department->dept_ID }}" @if(Auth::user()->emp_dept_ID == $department->dept_ID) {{ 'selected' }} @endif >{{ $department->dept_description }}</option>
                              @endforeach
                            </select>
                            <br>
                            <label>Position</label>
                            <select class="form-control position-list" name="position" id="position-list">
                              @foreach($positions as $position)
                              <option value="{{ $position->position_ID }}" @if(Auth::user()->emp_position_ID == $position->position_ID) {{ 'selected' }} @endif >{{ $position->position_description }}</option>
                              @endforeach
                            </select>
                             {{ csrf_field() }}
                            <input type="text" class="hidden" id="profilepic" name="profilepic">
                          </form>
                        <center>
                           
                            <hr>
                            <a class="btn btn-success" id="btn_save">Save</a> 
                            <br>
                            <br>
                            <br>
                            <br>
                          </center>
                           <form action="{{ url('profile/upload') }}" id="dropzoneChangeProfile"
                            class="dropzone hidden">
                             {{ csrf_field() }}
                          </form>
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
<script src="{{ asset('public/js/profile.js') }}"></script>
<script type="text/javascript">

  $('#btn_save').click(function(){
     $.ajax({url:  '{{ url("profile/change") }}' , 
          method: 'POST', 
          // data: { 
          //   "_token" : $("input[name=_token]").val(),     
          //   "emp_firstname" : $('input[name=emp_firstname]').val(),     
          //   "emp_middlename" : $('input[name=emp_middlename]').val(),     
          //   "emp_lastname" : $('input[name=emp_lastname]').val(),     
          //   "department" : $('#department-list').val(),     
          //   "position" : $('#position-list').val()   
          // }, 
          data: $('#form-profile').serialize(),
          success: function(result){
            console.log(result);
            if(result.success){
              alert_message('Successfully changed profile', true);
            }else{
              alert_message('Error');
            }
        }});
  });

</script>

@endsection