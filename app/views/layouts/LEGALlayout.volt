<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<style>
    h3 {
     
        color: #1e1e1c !important;
    }

    .navbar-static-side {
        background: #706F6E !important;
        height: 100%;
        margin: 8px;
        border-radius: 20px;
        width: 240px;



    }

    .navbar-minimalize {
        margin-left: 18%;
        border: none;
        background-color: #fff !important;
        padding: 6px;



    }

    .navbar-minimalize:hover {
        background-color: rgb(214, 207, 207) !important;
    }

    .navbar-header {
        width: 20%;

    }

    .active {
        margin: 10px;
        padding: 0;
        font-size: 16px !important;
        background: #706F6E !important;
        border: none !important;

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

    .menu a:hover>.text-black,
    .menu a:focus>.text-black,
    .menu a:active>.text-black {
        color: #333 !important;
        margin-top: 0 !;
    }

    .active a {

        margin: 10px;
        padding: 0;
       
    }

    .active a>.text-black {
        color: #fff !important;
        margin-top: 0 !;
    }

    .active a:hover>.text-black,
    .active a:active>.text-black {
        color: #333 !important;
        margin-top: 0 !;
        border-radius: 30px;
    }

   
   
    .menu a:hover,
    .menu a:focus,
    .menu a:active {
        background: rgb(248, 248, 248) !important ;
        border-radius: 30px;

        color: #333 !important;
    }

   
    li.active a:focus
    {
        background: rgb(248, 248, 248) !important ;
      
        border-radius: 30px;

        color: #333 !important;
    }

   

    .bg-gray {


        background: #c1c1c1 !important;


    }

    .panel {
        display: flex;
        flex-direction: column;
        border-radius: 20px !important;
        margin: 10px !important;
        padding: 5px !important;


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
        font-size: 16px !important;
    }

    .bg-primary {
        background-color: #32659A !important;
        color: #f2f2f2 !important;
    }

    .a {
        background-color: #fff !important;
        padding: 20px !important;
        border: none;
    }

    .a:hover {
        background-color: #fff !important;


    }

    .row {
        margin-bottom: 10px;
        margin-top: 10px;
    }

    input[type=search] {
        background-image: url("{{url('/public/img/buscar.png')}}") !important;
        background-size: 25px !important;
        background-position: 8px 5px !important;
        background-repeat: no-repeat !important;
        padding-left: 35px !important;
        border-radius: 60px !important;
        margin-bottom: 10px !important;

    }

    .breadcrumb {

        position: fixed;

    }
</style>

<body style="">
    <div id="content">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid" style="padding: 10px">
                <div class="navbar-header">
                    <img src="{{url('public/img/Logo-nav.png')}}" height="70px" style="margin-top: 20px;">

                </div>

                <ul class="nav navbar-nav ">
                    <li>
                        <button class="navbar-minimalize " style=""><i class="fa fa-home text-primary  "
                                style="font-size:30px;margin-top: 20px;"></i> </button>
                    </li>


                </ul>
                <div class="" style="background:#fff;position:fixed;bottom:20px;left:250px">

                    {% if bread is defined%}

                    <ol class="breadcrumb text-primary">
                        <?php $i=0;
                       ?>
                        {% for breadcrumb in bread %}
                        <?php $i=$i+1 ;
                         
                         if ($i == 1 || count($bread)=== $i) {?>
                        <li class="text-primary">{{breadcrumb[0]}}</li>
                        <?php }else{ ?>
                        <li class="text-primary"><a href=" {{url(breadcrumb[1])}}"
                                class="text-primary">{{breadcrumb[0]}}</a></li>
                        <?php }?>
                        {%endfor%}
                    </ol>


                    {% endif%}
                </div>
                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown" style="margin-top: 20px;">
                        <button class="a dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                            aria-expanded="false"><span class="fa fa-user  text-primary"></span> {{usuario}} <span
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


        <nav class="navbar-default navbar-static-side" role="navigation" style="position: fixed;top: 110px;">
            <ul class="nav" id="side-menu"  style="background: #706F6E !important;">
                <li class="menu"><a href="{{url('distribucion')}}"> <span class="nav-label text-black">Gestión
                            legal </span></a>
                    <ul class="nav" id="side-menu"  style="background: #706F6E !important;">
                        <li class="menu"><a href="{{url('distribucion')}}"> <span class="nav-label text-black">Estudio
                                    TTl</span></a>
                            <ul class="nav menu" style="background: #706F6E !important;">

                                <li class="menu"><a href="{{url('distribucion')}}"> <span
                                            class="nav-label text-black">Distribucion</span></a></li>
                                <li class="menu ">
                                    <a href="{{url('asignacion/index')}}">

                                        <span class="nav-label text-black ">Asignacion</span>
                                    </a>
                                </li>
                                <li class="menu">
                                    <a href="{{url('expedidor')}}">
            
                                        <span class="nav-label text-black">Gestionar</span>
                                    </a>
                                </li>
                                <li class="menu">
                                    <a href="{{url('expedidor')}}">
            
                                        <span class="nav-label text-black">ver</span>
                                    </a>
                                </li>
                                <li class="menu">
                                    <a href="{{url('expedidor')}}">
            
                                        <span class="nav-label text-black">Auditar</span>
                                    </a>
                                </li>
                                <li class="menu">
                                    <a href="{{url('expedidor')}}">
            
                                        <span class="nav-label text-black">Requerimiento</span>
                                    </a>
                                </li>
                            </ul>

                        </li>
                    </ul>
                </li>
            </ul>

    </div>
    </nav>

    <div id="page-wrapper" class=" ">
        <div class="container" style="margin-top: 100px;margin-left: 20px;width: 100%;">

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