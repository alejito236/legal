<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<style>
    *{
        color: #1e1e1c !important;
    }
    .navbar-static-side {
        background: #706F6E !important;
        height: 100%;
        margin: 8px;
        border-radius: 20px;
        width :240px;

    }

    .navbar-minimalize {
        margin-left: 18%;
        border:none;
        background-color: #fff !important;
        padding: 6px;

    }
    .navbar-minimalize:hover{
       
        background-color: rgb(214, 207, 207) !important;
    }

    .navbar-header {
        width: 20%;

    }

    .menu {

        font-size: 16px !important;
    }

    .text-black {
        color: #ffffff !important;
    }

    .menu a {

        margin: 10px;
        padding: 0;
    }

    .menu a:hover>.text-black {
        color: #333 !important;
        margin-top: 0 !;
    }

    .menu a:hover,
    .menu a:focus {
        background-color: rgb(232, 229, 229) !important;
        border-radius: 30px;

        color: #333 !important;
    }

    .bg-gray {

    
        background: #c1c1c1 !important;

        margin: 20px;
    }

    .panel {
     
        border-radius: 20px !important;
        margin: 10px !important;
        padding: 5px!important;
       

    }

    body {
        background: #fff;
    }

    .fa {
        color: #f2f2f2 !important;
    }

    .btn-primary:hover {
        background-color: #447bb6 !important;
        color: #f2f2f2 !important;
    }

    .fa {
        color: #32659a !important;
    }

    .btn {
        padding: 2px 10px 2px 10px !important;
        border-radius: 30px;
        font-weight: bold;
    }

    .btn-primary {

        background-color: #32659a !important;
        color: #f2f2f2 !important;
        border-color: #32659a !important;

    }

    .btn-danger {
        background-color: #706f6e !important;
        color: #f2f2f2 !important;
        border-color: #706f6e !important;
    }

    .btn-danger:hover {
        background-color: #8c8b8a !important;
        color: #f2f2f2 !important;
    }

    .btn-warning:hover {
        background-color: #b5b4b0 !important;
    }

    .btn-warning {
        background-color: #a5a4a4 !important;
        color: #f2f2f2 !important;
        border-color: #a5a4a4 !important;
    }

    .btn-success {
        background-color: #288006 !important;
        color: #f2f2f2 !important;
        border-color: #288006 !important;
    }

    .form-control {
        border-radius: 10px !important;

    }

    .form-control-logistica {
        border-radius: 10px !important;
        border-color: #439025;

    }

    .page-item.active .page-link {
        background-color: #706f6e;
        border-color: #4F7F20;
    }

    img {

        margin-left: 20px;
    }

    .text-primary {
        color: #316598 !important;
    }

    .btn-group {
       display: flex;
       margin-left: 18px;
    }

    .btn-group .btn {
        width: 100%;
        margin: 15px;
        font-size: 16px!important ;
    }

    .bg-primary{
        background-color: #32659A !important;
        color: #f2f2f2 !important;
    }

  .a{ background-color: #fff !important;
        padding: 20px!important;
        border:none;
    }

   .a:hover{
    background-color: #fff !important;
  
        
   }  

    .row{
        margin-bottom:10px;
        margin-top:10px;
    }
 

</style>

<body style="">
    <div id="content">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container-fluid" style="padding: 10px">
                <div class="navbar-header">
                  <img src="../public/img/Logo-nav.png" height="70px" style="margin-top: 20px;">

                    </a>
                </div>

                <ul class="nav navbar-nav ">
                    <li>
                        <button class="navbar-minimalize " style="" ><i class="fa fa-home text-primary  "
                                style="font-size:30px;margin-top: 20px;"></i> </button>
                    </li>

                </ul>
                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown" style="margin-top: 20px;">
                        <button class="a dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                            aria-expanded="false" ><span class="fa fa-user  text-primary"></span> {{usuario}} <span
                                class="caret"></span></button>
                        <ul class="dropdown-menu">
                            <li> <a href="{{url('session/end')}}">
                                    <i class="fas fa-sign-out-alt"></i> Salir
                                </a></li>

                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav " id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element text-center">

                            <div class="menu">
                                {% if campanas_roles is defined %}
                                {% for item in campanas_roles %}
                                <!--Si la campanña es 4 (Logistica)-->
                                {% if item['campana'] is 4 %}
                                <!--Si el rol es 1 Backoffice se muestra opcion del index de backoffice-->
                                {% if item['rol'] is 1 %}
                    <li class="menu">
                        <a href="{{url('backoffice/index')}}">

                            <span class="nav-label text-black">Gestion</span>
                        </a>
                    </li>
                    <li class="menu">
                        <a href="{{url('backoffice/anulados')}}">

                            <span class="nav-label text-black">Anulados</span>
                        </a>
                    </li>
                    {% endif %}
                    <!--Si el rol es 2 Asignacion se muestra opcion del index de Asignacion-->
                    {% if item['rol'] is 2 %}
                    <li class="menu">
                        <a href="{{url('asignacion/index')}}">

                            <span class="nav-label text-black">Asignacion</span>
                        </a>
                    </li>
                    {% endif %}
                    <!--Si el rol es 3 Expedidor se muestra opcion del index de Expedidor-->
                    {% if item['rol'] is 3 %}
                    <li class="menu">
                        <a href="{{url('expedidor/generar')}}">

                            <span class="nav-label text-black">Expedidor</span>
                        </a>
                    </li>
                    {% endif %}
                    <!--Si el rol es 5 administrador se muestra opcion de usuarios-->
                    {% if item['rol'] is 5 %}
                    <li class="menu">
                        <a href="{{url('administrador/usuarios')}}">

                            <span class="nav-label text-black">Usuarios</span>
                        </a>
                    </li>
                    <li class="menu">
                        <a href="{{url('administrador/liberarRegistroBack')}}">

                            <span class="nav-label text-black">Liberar Registros</span>
                        </a>
                    </li>
                    {% endif %}

                    {% endif %}

                    {% endfor %}
                    {% endif %}
            </div>
    </div>

    </li>
    </ul>
    </div>
    </nav>

    <div id="page-wrapper" class=" ">
        <div class="container" style="margin: 20px;width: 100%;">

            {{content()}}



        </div>
    </div>



    <script>
        $(document).ready(function () {

            var data1 = [
                [10], [1, 8], [2, 5], [3, 10], [4, 4], [5, 16], [6, 5], [7, 11], [8, 6], [9, 11], [10, 30], [11, 10], [12, 13], [13, 4], [14, 3], [15, 3], [16, 6]
            ];
            var data2 = [
                [10], [1, 0], [2, 2], [3, 0], [4, 1], [5, 3], [6, 1], [7, 5], [8, 2], [9, 3], [10, 2], [11, 1], [12, 0], [13, 2], [14, 8], [15, 0], [16, 0]
            ];
            $("#flot-dashboard-chart").length && $.plot($("#flot-dashboard-chart"), [
                data1, data2
            ],
                {
                    series: {
                        lines: {
                            show: false,
                            fill: true
                        },
                        splines: {
                            show: true,
                            tension: 0.4,
                            lineWidth: 1,
                            fill: 0.4
                        },
                        points: {
                            radius: 0,
                            show: true
                        },
                        shadowSize: 2
                    },
                    grid: {
                        hoverable: true,
                        clickable: true,
                        tickColor: "#d5d5d5",
                        borderWidth: 1,
                        color: '#d5d5d5'
                    },
                    colors: ["#1ab394", "#1C84C6"],
                    xaxis: {
                    },
                    yaxis: {
                        ticks: 4
                    },
                    tooltip: false
                }
            );

            var doughnutData = {
                labels: ["App", "Software", "Laptop"],
                datasets: [{
                    data: [300, 50, 100],
                    backgroundColor: ["#a3e1d4", "#dedede", "#9CC3DA"]
                }]
            };


            var doughnutOptions = {
                responsive: false,
                legend: {
                    display: false
                }
            };


            var ctx4 = document.getElementById("doughnutChart").getContext("2d");
            new Chart(ctx4, { type: 'doughnut', data: doughnutData, options: doughnutOptions });

            var doughnutData = {
                labels: ["App", "Software", "Laptop"],
                datasets: [{
                    data: [70, 27, 85],
                    backgroundColor: ["#a3e1d4", "#dedede", "#9CC3DA"]
                }]
            };


            var doughnutOptions = {
                responsive: false,
                legend: {
                    display: false
                }
            };


            var ctx4 = document.getElementById("doughnutChart2").getContext("2d");
            new Chart(ctx4, { type: 'doughnut', data: doughnutData, options: doughnutOptions });

        });
    </script>
</body>

</html>