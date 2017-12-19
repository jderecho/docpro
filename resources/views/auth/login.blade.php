@extends('main')
@section('title')
Login: Document Controller
@endsection
@section('content')
    <div class="content-fluid" style="background: #191919">
        <div class="spacer-top">
        </div>
        <div class="cw">
            <div class="text-center">
           <h1 class="white" style="font-size: 70px;padding: 10px;"><img src="{{asset('public/img/docpro_logo.gif')}}" style="width: 300px;"></h1>
            </div>
        </div>
        <div class="container">
          <div class="row">
            <div class="col-sm-offset-3 col-sm-6">
              <div class="login-form-cont">
                    @if ($errors->count())
                    <span class="help-block">
                        <strong style="color: red">{{ $errors->first() }}</strong>
                    </span>
                    @endif
                <form action="login" class="" method="post" accept-charset="utf-8">
                    <!-- <input type="hidden" name="csrf_moprod" value="b15a98d7570882c640f37ad9fc075938">  -->
                     {{ csrf_field() }}      
                        <input type="hidden" name="_previous" value="{{ Session::get('ref') }}">                                                       
                                <div class="form-group" style="margin-bottom:23px;">
                        <label class="text-desc">EMAIL ADDRESS</label>
                        <div id="inputgroupEmail" class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input type="text" class="form-control input-lg" placeholder="Enter email address here" value="{{ old('email') }}" required="" name="email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="text-desc">PASSWORD</label>
                        <div id="inputgroupPass" class="input-group">
                         <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <input type="password" class="form-control input-lg" placeholder="Enter your password here" required="" name="password">
                        </div>
                    </div>
                    <div class="form-group topPadding15">
                      <button type="submit" class="btn btn-green btn-lg btn-block">Login</button>
                    </div>
                    <div class="form-group topPadding15">
                      <p class="text-center">Forgot Password? <a href="forgot/password" style="cursor: pointer"> Click Here </a></p>
                    </div>
                    <div class="text-center">
                        <span class="text-signature">Developed by: Operational Excellence Team</span> <br>
                        <span class="text-signature">For any issues, please contact <a href="mailto:john.derecho@mopro.com">John Manuel Derecho</a></span>
                    </div>
                </form>      </div>  
            </div>
          </div>  
        </div>
    </div>
<style type="text/css">
    html, body{
        background: #191919;
        background-color: #191919;
    }
    .input-group-addon {
        background-color: #6148b3;
        border: 0px;
    }
    .text-desc {
    color: #fff;
    padding-bottom: 5px;
    }
    label {
        display: inline-block;
        max-width: 100%;
        margin-bottom: 5px;
        font-weight: 700;
    }
    .glyphicon{
        color: white ;
    }
    .login-form-cont {
        color: #fff !important;
    }
    .text-signature {
        color: #8d908f;
        font-size: 12px;
    }
    p, div, span, .btn, input, select, textarea, a {
        font-family: 'Raleway', sans-serif !important;
        font-weight: 500 !important;
    }
</style>
@endsection