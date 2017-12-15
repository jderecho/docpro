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
              <img style="height: 50px; margin-left: 5px;" class="img-responsive pull-left" src="{{ asset('public/img/docpro_logo.gif') }}">
            </li>
           </ul>
          
        
          <ul class="nav navbar-nav navbar-right white">
              <li style="height: 50px; border-right: 1px solid #6145B6;margin-right: 20px;"><h4 class="mopro-time" style="margin-top: 15px;"><span class="glyphicon glyphicon-time violet">&nbsp;</span><div id="time"></div></h4></li>
              <li><img src="{{ Auth::user()->profile_url}}" height="50" class="img-circle"></li> 
              <li>
                <div class="dropdown" id="current_user">
                  <button style="margin-top: 7px;" class="btn dropdown-toggle btn-user" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                     @if(Auth::check())
                            {{ Auth::user()->emp_firstname . " " . Auth::user()->emp_lastname  }}
                        @endif
                    <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                    <li><a href="{{ url('profile') }}">Profile</a></li>
                    <li><a href="{{ url('profile/changepass') }}">Change My Password</a></li>
                    <li><a href="{{ url('logout') }}">Logout</a></li>
                  </ul>
                </div>
              </li>
           </ul>
        </div><!--/.navbar-collapse -->
      </div>
    </nav>
    