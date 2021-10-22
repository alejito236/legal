<br>
<style>
    table{
        font-size: 16px;
    }
    .label{
        color: #4A4747!important;
    }
    
</style>
<div class="col-lg-12">
    <form action="{{url('GOPASScoordinador/reagendamiento')}}" method="POST">
        <div class="col-lg-2"></div>
        <div class="col-lg-3">
            <label for="">Fecha inicio:</label>
            <input type="date" name="fechaInicio" value="{{fechaInicial}}" class="form-control">
        </div>
        <div class="col-lg-3">
            <label for="">Fecha final:</label>
            <input type="date" name="fechaFinal" value="{{fechaFinal}}" class="form-control">
        </div>
        <div class="col-lg-2">
            <label for=""> <br></label>
            <button class="btn btn-primary form-control">Filtrar</button>
        </div>
    </form>
</div>
<br><br><br><br>
<div class="wrapper">
<div class="col-lg-2" style="margin: 2% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <h5>Barranquilla</h5>
        </div>
        <div class="ibox-content table-responsive" style="padding:0!important;">
            <table class="table table-hover no-margins">
                <thead>
                </thead>
                <tbody>
                <tr>
                    <td><span class="label label-info"><b>Reagendamientos</b></span></td>
                    <td>{{reagendados.barranquilla}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="col-lg-2" style="margin: 2% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <h5>Bogotá</h5>
        </div>
        <div class="ibox-content table-responsive" style="padding:0!important;">
            <table class="table table-hover no-margins">
                <thead>
                </thead>
                <tbody>
                <tr>
                    <td><span class="label label-info"><b>Reagendamientos</b></span></td>
                    <td>{{reagendados.bogota}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="col-lg-2" style="margin: 2% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <h5>Bucaramanga</h5>
        </div>
        <div class="ibox-content table-responsive" style="padding:0!important;">
            <table class="table table-hover no-margins">
                <thead>
                </thead>
                <tbody>
                <tr>
                    <td><span class="label label-info"><b>Reagendamientos</b></span></td>
                    <td>{{reagendados.bucaramanga}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="col-lg-2" style="margin: 2% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <h5>Cali</h5>
        </div>
        <div class="ibox-content table-responsive" style="padding:0!important;">
            <table class="table table-hover no-margins">
                <thead>
                </thead>
                <tbody>
                <tr>
                    <td><span class="label label-info"><b>Reagendamientos</b></span></td>
                    <td>{{reagendados.cali}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="col-lg-2" style="margin: 2% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <h5>Medellín</h5>
        </div>
        <div class="ibox-content table-responsive" style="padding:0!important;">
            <table class="table table-hover no-margins">
                <thead>
                </thead>
                <tbody>
                <tr>
                    <td><span class="label label-info"><b>Reagendamientos</b></span></td>
                    <td>{{reagendados.medellin}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<div class="col-lg-2" style="margin: 2% 0;">
    <div class="ibox ">
        <div class="ibox-title">
            <h5>Total</h5>
        </div>
        <div class="ibox-content table-responsive" style="padding:0!important;">
            <table class="table table-hover no-margins">
                <thead>
                </thead>
                <tbody>
                <tr>
                    <td><span class="label label-info"><b>Reagendamientos</b></span></td>
                    <td>{{reagendados.medellin}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
<div class="row">
    <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>Reagendamientos por SAC</h5>
                <div class="ibox-tools">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-wrench"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><form action="{{url('GOPASScoordinador/reporteReagendamientoVentasAsesor')}}" target="_blank" method="POST">
                            <input type="hidden" name="fechaInicio" value="{{fechaInicial}}">
                            <input type="hidden" name="fechaFinal" value="{{fechaFinal}}">
                            <button class="btn btn-primary form-control">Exportar</button>
                        </form>
                        </li>
                    </ul>
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <div>
                    <canvas id="barChart2" height="140"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script>
    
    $(function () {

        // Grafico para las ventas por asesor
        var lineOptions = {
            responsive: true
        };
        
        var barData = {
            labels: [{% for item in ventasAsesor %} "{{item.asesor}}" , {% endfor %}],
            datasets: [

                {
                    label: "Cantidad",
                    backgroundColor: '#1ab394',
                    borderColor: "#1ab380",
                    pointBackgroundColor: "rgba(26,179,148,1)",
                    pointBorderColor: "#fff",
                    data: [{% for item in ventasAsesor %} {{item.cantidad}} , {% endfor %}]
                }
            ]
        };

        var barOptions = {
            responsive: true,
            scales: {
                yAxes: [
                    {
                        stacked: true
                    }
                ]
            },
        };

        var ctx2 = document.getElementById("barChart2");
        new Chart(ctx2, {type: 'bar', data: barData, options:barOptions}); 
    });
</script>