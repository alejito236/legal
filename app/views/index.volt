<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        {{ get_title() }}
        {{ stylesheet_link('css/bootstrap.min.css') }}
        {{ stylesheet_link('css/plugins/toastr/toastr.min.css')}}
        {{ stylesheet_link('css/animate.css' )}}
        {{ stylesheet_link('css/style.css' )}}
        {{ stylesheet_link('js/plugins/gritter/jquery.gritter.css' )}}
        {{ stylesheet_link('font-awesome/css/font-awesome.css') }}
        {{ stylesheet_link('css/plugins/c3/c3.min.css') }}
        {{ stylesheet_link('css/plugins/dataTables/datatables.min.css') }}
        {{ stylesheet_link('css/font.css') }}
        {{ stylesheet_link('css/plugins/sweetalert/sweetalert.css') }}
        {{ stylesheet_link('css/plugins/chartist/chartist.min.css') }}
        {{ stylesheet_link('css/bootstrap-datetimepicker.min.css') }}
        {{ stylesheet_link('css/richtext.min.css') }}


        <link rel="shortcut icon" href="{{ url('img/favicon-logi.png') }}" />
        <link rel="stylesheet" href="{{ url('fontawesome/css/all.css') }}">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Your invoices">
        <meta name="author" content="Phalcon Team">
    </head>

    <body>
        {{ javascript_include('js/jquery.min.js') }}
        {{ javascript_include('js/bootstrap.min.js') }}
        {{ javascript_include('js/utils.js') }}
        {{ javascript_include('js/jquery-3.1.1.min.js') }}
        {{ javascript_include('js/jquery.richtext.js') }}
        {{ javascript_include('js/popper.min.js') }}
        {{ javascript_include('js/bootstrap.js') }}
        {{ javascript_include('js/plugins/metisMenu/jquery.metisMenu.js') }}
        {{ javascript_include('js/plugins/slimscroll/jquery.slimscroll.min.js') }}
        {{ javascript_include('js/plugins/flot/jquery.flot.js') }}
        {{ javascript_include('js/plugins/flot/jquery.flot.tooltip.min.js') }}
        {{ javascript_include('js/plugins/flot/jquery.flot.spline.js') }}
        {{ javascript_include('js/plugins/flot/jquery.flot.resize.js') }}
        {{ javascript_include('js/plugins/flot/jquery.flot.pie.js') }}
        {{ javascript_include('js/plugins/peity/jquery.peity.min.js') }}
        {{ javascript_include('js/demo/peity-demo.js') }}
        {{ javascript_include('js/plugins/d3/d3.min.js') }}
        {{ javascript_include('js/plugins/c3/c3.min.js') }}
        {{ javascript_include('js/plugins/pace/pace.min.js') }}
        {{ javascript_include('js/inspinia.js') }}
        {{ javascript_include('js/plugins/pace/pace.min.js') }}
        {{ javascript_include('js/plugins/jquery-ui/jquery-ui.min.js') }}
        {{ javascript_include('js/plugins/gritter/jquery.gritter.min.js') }}
        {{ javascript_include('js/plugins/sparkline/jquery.sparkline.min.js') }}
        {{ javascript_include('js/demo/sparkline-demo.js') }}
        {{ javascript_include('js/plugins/chartJs/Chart.min.js') }}
        {{ javascript_include('js/plugins/toastr/toastr.min.js') }}
        {{ javascript_include('js/plugins/flot/jquery.flot.time.js') }}
        {{ javascript_include('js/plugins/dataTables/datatables.min.js') }}
        {{ javascript_include('js/plugins/dataTables/dataTables.bootstrap4.min.js') }}
        {{ javascript_include('js/plugins/sweetalert/sweetalert.min.js') }}
        {{ javascript_include('js/plugins/chartist/chartist.min.js') }}
        {{ javascript_include('js/bootstrap-datetimepicker.min.js') }}
        {{ javascript_include('js/settings.js') }}
        {{ javascript_include('push.js/push.min.js') }}   
        {{ javascript_include('js/bootstrap-datepicker.js') }}
        {{ content() }}		

<script>
    setInterval(function(){
      var hoy = new Date();
      var hora = hoy.getHours() + ':' + hoy.getMinutes();
      // console.log(hora)
      switch (hora) {
        case '9:00':
        case '11:00':
        case '16:00':
        case '18:00':
              var primerFrase = "No olvides utilizar el tapabocas,";
              var segundaFrase = "Recuerda mantenerte a una distancia de 2 mts de tus compañeros!";
              swal("¿Te lavaste las manos?", primerFrase + "\n" + segundaFrase, "success");
        break;
        default:
        break;
      }
    },60000 );

</script>
