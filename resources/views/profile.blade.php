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
                         <a href="{{ url('profile/editprofile') }}" class="btn btn-default pull-right">Edit Profile</a>
                       </div>
                        <div class="col-md-4 col-md-offset-4 hover-trigger">
                            <center>
                              <br>
                              <br>
                              <img src="{{ Auth::user()->profile_url}}" class="img-responsive img-circle">
                            </center>
                           
                        </div>
                        <div class="col-md-12">
                          <center> 
                            <h3 style="color: #656B6E;">{{Auth::user()->emp_firstname . ' ' . Auth::user()->emp_lastname}}</h3>
                            <h5 style="color: #B9BDBE">@if(Auth::user()->position) {{ Auth::user()->position->position_description  }} @endif</h5>
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
<script src="{{ asset('public/js/profile.js') }}"></script>
<script type="text/javascript">

</script>

@endsection