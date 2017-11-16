@extends('main')
@section('title')
Dashboard: Document Controller
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
          <a class="navbar-brand" href="#">DokMan</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right white">
              <li style="height: 50px; border-right: 1px solid #6145B6;margin-right: 20px;"><h4 class="mopro-time"><span class="glyphicon glyphicon-time violet">&nbsp;</span><span>12:30:00 AM</span></h4></li>
              <li><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCOiiq0h3n-kkjrkv-KIEjDOqYMm7TmWjhKYOrd5Q-cYe2zYgZ" height="50" class="img-circle"></li> 
              <li><h4 class="user-fullname">
              @if(Auth::check())
                  {{ Auth::user()->emp_firstname . " " . Auth::user()->emp_lastname  }}
              @endif
            </h4></li>
           </ul>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>

    <div class="container document-list-container" style="margin-top: 120px;">
          <div class="col-md-12">
              <div class="card">
                  <div class="card-header card-gradient">
                       <h4 class="title"><span class="glyphicon glyphicon-time "></span></span>&nbsp;&nbsp;Recent</h4>
                  </div>
                    <div class="card-content">
                        <div class="container-fluid table-container">
                           @json($documents) 
                            <table class="table" id="document-table">
                                <thead>
                                    <tr>
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
                                        <td>{{ $document->date_created }}</td>
                                        <td><span class="circle @if($document->status == 1 )  {{'status-approved'}} @else {{ 'status-pending' }} @endif">•</span><span class="status-label">@if($document->status == 1 )  {{'Approved'}} @else {{ 'Pending' }} @endif</span></td>
                                        <td>{{ $document->filename }}</td>
                                        <td><center><a href="#" data-toggle="tooltip" title="Hooray!">Hover over me</a></center></td>
                                        <td><center>1</center></td>
                                        <td><center>{{ $document->creator_emp_ID }}</center></td>
                                        <td><a data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-eye-open grey">&nbsp</span></a><span class="glyphicon glyphicon-option-horizontal grey">&nbsp;</span></td>
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
    <!-- Modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel"><img style="height: 20px; margin: 5px;" src="{{ asset('img/fav-white.png')}}"></span>View Attachment</h4>
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
                <br>
                <div class="col-lg-9">
                  <label>Attachment</label>
                  
                  <textarea class="form-control" rows="25" ></textarea>
                </div>
                <div class="col-md-3">
                  <label>Created By:</label>
                  <div id="attachment-list-container">
                     <input type="text" name="created_by" placeholder="Creator" class="form-control disabled" disabled>
                  </div>
                  <br>
                  <label>Approved by</label>
                  <div id="approver-list-container">
                     <h5>John Doe <span class="glyphicon glyphicon-ok-circle pull-right green">&nbsp;</span></h5>
                     <h5>John Doe</h5>
                     <h5>John Doe</h5>
                  </div>
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="col-md-12">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign">&nbsp;</span>Add Comment</button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <script>
        $(document).ready(function(){
            $('[data-toggle="tooltip"]').tooltip(); 
        });
      </script>
  @endsection