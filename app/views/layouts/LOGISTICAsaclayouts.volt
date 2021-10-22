<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>

<style>
    .menu-soat{
        font-size: 16px!important;
    }
    .text-black{
        color: #242F19!important;
    }
    a:hover, a:focus{
        background-color: #386da7!important;        
    }
    body{
        background-color: #32659a!important;      
    }
    .btn-primary:hover{
		background-color: #447bb6!important;
        color: #f2f2f2!important;
	}
    .fa{
        color: #32659a!important;
    }
    .btn-primary{
        background-color: #32659a !important;
        color: #f2f2f2!important;
        border-color: #32659a !important;
    }
    .btn-danger{
        background-color: #706f6e!important;
        color: #f2f2f2!important;
        border-color: #706f6e!important;
    }
    .btn-danger:hover{
        background-color: #8c8b8a!important;
        color: #f2f2f2!important;
    }
    .btn-warning:hover{
        background-color: #D1BB50!important; 
    }
    .btn-warning{        
        background-color: #a5a4a4!important;
        color: #f2f2f2!important;
        border-color: #a5a4a4!important;
    }
    .btn-success{
        background-color: #288006!important;
        color: #f2f2f2!important;
        border-color: #288006!important;
    }
   
    
</style>

<body style = "background-color: #4F7F20!important;">
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element text-center">
                            <img src="../public/logo-logi.png" style="width: 40%; margin: auto 25%;" alt="Logo Gopass">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="block m-t-xs font-bold text-uppercase text-black">{{usuario}}</span>
                            </a>
                        </div>
                        <div class="logo-element">
                            LOGÍSTICA
                        </div>
                    </li>      
                    {% for item in campana %}
                        {% if item['campana'] is 1 %}
                            <li>
                                <a href="{{url('GOPASSsac/index')}}">
                                    <i class="fas fa-tasks text-black"></i> 
                                    <span class="nav-label text-black">Agendamiento</span> 
                                </a>
                            </li>
                        {% elseif item['campana'] is 2 %}
                            <li>
                                <a href="{{url('GOPASSsac/postventa')}}">
                                    <i class="fas fa-tasks text-black"></i> 
                                    <span class="nav-label text-black">Postventa</span> 
                                </a>
                            </li>
                        {% elseif item['campana'] is 3 %}                    
                            <li>
                                <a href="{{url('GOPASSsac/fidelizacion')}}">
                                    <i class="fas fa-tasks text-black"></i> 
                                    <span class="nav-label text-black">Fidelización</span> 
                                </a>
                            </li>                    
                        {% endif %}
                    {% endfor %}             
                    <li>
                        <a href="{{url('session/end')}}"><i class="fas fa-sign-out-alt text-black"></i> <span class="nav-label text-black">Salir</span> </a>

                    </li>
                </ul>
            </div>
            
        </nav>
        </div>
        <div id="page-wrapper" class="dashbard-1">
        <div class="row ">
          
        {{content()}}

    </div>
    </div>
    <br><br><br><br>
    
    
    <script>
        $(document).ready(function() {

            var data1 = [
                [10],[1,8],[2,5],[3,10],[4,4],[5,16],[6,5],[7,11],[8,6],[9,11],[10,30],[11,10],[12,13],[13,4],[14,3],[15,3],[16,6]
            ];
            var data2 = [
                [10],[1,0],[2,2],[3,0],[4,1],[5,3],[6,1],[7,5],[8,2],[9,3],[10,2],[11,1],[12,0],[13,2],[14,8],[15,0],[16,0]
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
                        xaxis:{
                        },
                        yaxis: {
                            ticks: 4
                        },
                        tooltip: false
                    }
            );

            var doughnutData = {
                labels: ["App","Software","Laptop" ],
                datasets: [{
                    data: [300,50,100],
                    backgroundColor: ["#a3e1d4","#dedede","#9CC3DA"]
                }]
            } ;


            var doughnutOptions = {
                responsive: false,
                legend: {
                    display: false
                }
            };


            var ctx4 = document.getElementById("doughnutChart").getContext("2d");
            new Chart(ctx4, {type: 'doughnut', data: doughnutData, options:doughnutOptions});

            var doughnutData = {
                labels: ["App","Software","Laptop" ],
                datasets: [{
                    data: [70,27,85],
                    backgroundColor: ["#a3e1d4","#dedede","#9CC3DA"]
                }]
            } ;


            var doughnutOptions = {
                responsive: false,
                legend: {
                    display: false
                }
            };


            var ctx4 = document.getElementById("doughnutChart2").getContext("2d");
            new Chart(ctx4, {type: 'doughnut', data: doughnutData, options:doughnutOptions});

        });
    </script>
</body>
</html>