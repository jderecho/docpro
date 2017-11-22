@extends('main')
@section('title')
Dashboard: Document Controller
@endsection

@section('css')
    <link href="{{ asset('css/chosen.min.css') }}" rel="stylesheet">
    <link href="{{ asset('css/dropzone.css') }}" rel="stylesheet">

    <style type="text/css">
      h4.title{
        margin-bottom: 0px !important;
      }
      a.btn.btn-success.pull-right {
        margin-top: -6px !important;
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
          <a class="navbar-brand" href="#">DokMan</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
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
                                        <td><a data-toggle="modal" data-target="#viewDocumentModal"><span class="glyphicon glyphicon-eye-open grey">&nbsp</span></a><span class="glyphicon glyphicon-option-horizontal grey">&nbsp;</span></td>
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
    <!-- View Document Modal -->
    <div class="modal fade" id="viewDocumentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
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
                     <h5>John Doe <span class="status-ok pull-right green"><img src="{{ asset('img/status/check.png') }}"></span></h5>
                     <h5>John Doe</h5>
                     <h5>John Doe</h5>
                  </div>
                </div>
            </div>
          </div>
          <div class="modal-footer">
            <div class="container-fluid">

               <div class="col-md-12">
               <span class="label label-success">2 Comments</span>
                <p class="">
                  <span>
                    <b>John Manuel Derecho</b>
                    <span>&nbsp;</span>
                    <span>alryty !</span>
                  </span>
                </p>
               </div>
              <div class="col-md-12">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign">&nbsp;</span>Add Comment</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

      <!-- Create Document Modal -->
    <div class="modal fade" id="createDocumentModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel"><img style="height: 20px; margin: 5px;" src="{{ asset('img/fav-white.png')}}"></span>Create Attachment</h4>
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
                <div class="col-lg-12 col-md-12">
                  <label>Attachment</label>
                  <!-- <input type="file" name="" placeholder="File"> -->

                   <form action="/file-upload" id="myAwesomeDropzone"
                    class="dropzone">
                      {{ csrf_field() }}
                      <input type="hidden" name="emp_ID" value="{{ Auth::user()->emp_ID}}">
                  </form>
                  <!-- <textarea id="textarea"  rows="1" class="form-control"></textarea> -->
                  <!-- <textarea class="form-control" rows="25" ></textarea> --> 
                  <br>
                  <label>Add Reviewer</label>
                  <!-- <textarea id="textarea"  rows="1" class="form-control"></textarea> -->
                  <!-- <input type="text" data-provide="typeahead" class="typehead" autocomplete="off"> -->
                  <select data-placeholder="Add Reviewer" class="chosen-select form-control" multiple="" tabindex="-1">
                      <option value=""></option>
                      @foreach($approvers as $employee)
                      <option value="{{ $employee->emp_firstname . ' ' . $employee->emp_lastname }}">{{ $employee->emp_firstname . ' ' . $employee->emp_lastname }}</option>
                      @endforeach
              
                    </select>
                </div>
                
            </div>
          </div>
          <div class="modal-footer">
            <div class="container-fluid">
              <div class="col-md-12">
                <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-plus-sign">&nbsp;</span>Save</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  @endsection

  @section('scripts')
  <script src="{{ asset('js/chosen.jquery.min.js') }}"></script>
  <script src="{{ asset('js/dropzone.js') }}"></script>

  <script type="text/javascript">

    $(".chosen-select ").chosen({
        disable_search_threshold: 10,
        no_results_text: "No Result(s) Found!",
        width: "100%"
    });

    Dropzone.options.myAwesomeDropzone = {
      paramName: "file", // The name that will be used to transfer the file
      maxFilesize: 2, // MB
      accept: function(file, done) {
        console.log("add");
        if (file.name == "justinbieber.jpg") {
          done("Naha, you don't.");
        }
        else { done(); }
      },
      addRemoveLinks: true,
      removedfile: function(file) {
          console.log("delete");
          
          var _ref;
          return (_ref = file.previewElement) != null ? _ref.parentNode.removeChild(file.previewElement) : void 0;
        }
    };

  </script>
  @endsection