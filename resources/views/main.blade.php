 <!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>@yield('title')</title>

    <!-- Bootstrap -->
    <link href="{{ asset('public/css/bootstrap.css') }}" rel="stylesheet">
    <link href="{{ asset('public/css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('public/css/colors.css') }}" rel="stylesheet">
    <link href="{{ asset('public/css/jquery.dataTables.css') }}" rel="stylesheet">
    <link href="{{ asset('public/css/jquery.loading.css') }}" rel="stylesheet">
    <link href="{{ asset('public/css/animate.css') }}" rel="stylesheet">
    <style>

        table.dataTable thead .sorting { background: url('public/images/sort_both.png') no-repeat center right !important; }
        table.dataTable thead .sorting_asc { background: url('public/images/sort_asc.png') no-repeat center right !important; }
        table.dataTable thead .sorting_desc { background: url('public/images/sort_desc.png') no-repeat center right !important; }

        table.dataTable thead .sorting_asc_disabled { background: url('public/images/sort_asc_disabled.png') no-repeat center right !important; }
        table.dataTable thead .sorting_desc_disabled { background: url('public/images/sort_desc_disabled.png') no-repeat center right !important; }

    </style>
    @yield('css')
  </head>
  <body>

    @yield('content')

    @yield('modals')

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
     <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://unpkg.com/popper.js@1.12.6/dist/umd/popper.js" integrity="sha384-fA23ZRQ3G/J53mElWqVJEGJzU0sTs+SvzG8fXVWP+kJQ1lwFAOkcUOysnlKJC33U" crossorigin="anonymous"></script> -->

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="{{ asset('public/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('public/js/jquery.dataTables.js') }}"></script>
    <script src="{{ asset('public/js/jquery.validate.min.js') }}"></script>
    <script src="{{ asset('public/js/bootstrap-notify.min.js') }}"></script>
    <script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@1.5.4/src/loadingoverlay.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/gasparesganga-jquery-loading-overlay@1.5.4/extras/loadingoverlay_progress/loadingoverlay_progress.min.js"></script>
    @yield('scripts')
    <script src="{{ asset('public/js/app.js') }}"></script>
    <input type="hidden" name="root_url" value="{{asset('/')}}">
  </body>
   <div class="col-md-12">
    <br>
    <br>
    <!-- <center><h6 style="color: #aaa;">Developed by: Operational Excellence Team </h6></center> -->
   </footer>
</html>