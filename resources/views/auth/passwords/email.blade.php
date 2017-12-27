@extends('main')

@section('content')
<br>
<br>
<br>
<br>
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="panel panel-default">
                <div class="panel-heading">Reset Password</div>

                <div class="panel-body">
                    @if (session('status'))
                        <div class="alert alert-success">
                            {{ session('status') }}
                        </div>
                    @endif

                    <form class="form-horizontal" method="POST" action="{{ url('password/reset') }}" name="passwordreset">
                        {{ csrf_field() }}

                        <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
                            <label for="email" class="col-md-4 control-label">E-Mail Address</label>

                            <div class="col-md-6">
                                <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>

                                @if ($errors->has('email'))
                                    <span class="help-block">
                                        <strong>{{ $errors->first('email') }}</strong>
                                    </span>
                                @endif
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-md-6 col-md-offset-4">
                                <button type="submit" class="btn btn-primary" id="send_password_reset">
                                    Send Password Reset Link
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('scripts')
<script type="text/javascript">
    $("form[name='passwordreset']").on("submit", function(e){
        e.preventDefault();
      }); 

    $('#send_password_reset').click(function(){
        $.ajax({url:  "{{ url('password/reset')}}" , 
          method: 'POST', 
          data: { 
            "_token" : $("input[name=_token]").val(),
            "email"  : $('input[name=email]').val()
          }, 
          success: function(result){
            if(result.success){
              alert_message('Please check your email for a password reset link', true);
            }else{
              alert_message('Error sending password reset link');
            }
        }});
    });

</script>
@endsection
