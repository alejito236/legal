<br>
<style>
    table{
        font-size: 16px;
    }
    .label{
        color: #4A4747!important;
    }
    select{
        height: 33px!important;
    }
</style>
<div class="col-lg-3" style="margin: 2% 0" >
    <div class="ibox">
        <div class="ibox-title">    
                <a href="{{url('SOATcoordinador/ciudadbogota')}}"><h5>Bogotá</h5></a>
            <div class="ibox-tools">
                    <a href="{{url('SOATcoordinador/ciudadbogota')}}">
                        <i class="fas fa-tasks"></i>
                    </a>
            </div>
        </div>
    </div>
</div>
<div class="col-lg-2" style="margin: 2% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <a href="{{url('SOATcoordinador/ciudadbucaramanga')}}"><h5>Bucaramanga</h5></a>
            <div class="ibox-tools">
                <a href="{{url('SOATcoordinador/ciudadbucaramanga')}}">
                    <i class="fas fa-tasks"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="col-lg-2" style="margin: 2% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <a href="{{url('SOATcoordinador/ciudadcali')}}"><h5>Cali</h5></a>
            <div class="ibox-tools">
                <a href="{{url('SOATcoordinador/ciudadcali')}}">
                    <i class="fas fa-tasks"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="col-lg-2" style="margin: 2% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <a href="{{url('SOATcoordinador/ciudadejecafetero')}}"><h5>Eje_Cafetero</h5></a>
            <div class="ibox-tools">
                <a href="{{url('SOATcoordinador/ciudadejecafetero')}}">
                    <i class="fas fa-tasks"></i>
                </a>
            </div>
        </div>
    </div>
</div>
<div class="col-lg-3" style="margin: 2% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <a href="{{url('SOATcoordinador/ciudadibague')}}"> <h5>Ibagúe</h5></a>
            <div class="ibox-tools">
                    <a  href="{{url('SOATcoordinador/ciudadibague')}}">
                        <i class="fas fa-tasks"></i>
                    </a>
            </div>
        </div>
    </div>
</div>
<div class="col-lg-3" style="margin: 0% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <a href="{{url('SOATcoordinador/ciudadmedellin')}}"> <h5>Medellín</h5></a>
            <div class="ibox-tools">
                    <a  href="{{url('SOATcoordinador/ciudadmedellin')}}">
                        <i class="fas fa-tasks"></i>
                    </a>
            </div>
        </div>
    </div>
</div>
<div class="col-lg-3" style="margin: 0% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <a href="{{url('SOATcoordinador/ciudadneiva')}}"> <h5>Neiva</h5></a>
            <div class="ibox-tools">
                    <a  href="{{url('SOATcoordinador/ciudadneiva')}}">
                        <i class="fas fa-tasks"></i>
                    </a>
            </div>
        </div>
    </div>
</div>
<div class="col-lg-3" style="margin: 0% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <a href="{{url('SOATcoordinador/ciudadtunja')}}"> <h5>Tunja</h5></a>
            <div class="ibox-tools">
                    <a  href="{{url('SOATcoordinador/ciudadtunja')}}">
                        <i class="fas fa-tasks"></i>
                    </a>
            </div>
        </div>
    </div>
</div>
<div class="col-lg-3" style="margin: 0% 0">
    <div class="ibox ">
        <div class="ibox-title">
            <a href="{{url('SOATcoordinador/ciudadvillavicencio')}}"> <h5>Villavicencio</h5></a>
            <div class="ibox-tools">
                    <a  href="{{url('SOATcoordinador/ciudadvillavicencio')}}">
                        <i class="fas fa-tasks"></i>
                    </a>
            </div>
        </div>
    </div>
</div>

<div style="margin: -2%;margin-bottom: 1%;">
    <div class="ibox">
    </div>
</div>
<div class="col-lg-12">
<form action="{{url('SOATcoordinador/ciudadmedellin')}}" method="POST">
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
<br><br><br><br><br><br>
<div class="wrapper ">
<div class="row">
    <div class="col-lg-3">
        <div class="ibox">
            <div class="ibox-content">
                <h5 class="m-b-md">Ventas Efectivas</h5>
                <h2 class="text-navy">
                    <i class="fas fa-dollar-sign"></i> {{cantidadMedellin.ventasMedellin}}
                </h2>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="ibox">
            <div class="ibox-content ">
                <h5 class="m-b-md">Total Renovaciones</h5>
                <h2 class="text-success">
                    <i class="fas fa-sync-alt"></i> {{cantidadMedellin.renovacionesMedellin}}
                    
                </h2>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="ibox">
            <div class="ibox-content ">
                <h5 class="m-b-md">Total Contactados</h5>
                <h2 class="text-warning">
                    <i class="fas fa-phone"></i> {{cantidadMedellin.contactadosMedellin}}
                </h2>
            </div>
        </div>
    </div>
    <div class="col-lg-3">
        <div class="ibox">
            <div class="ibox-content ">
                <h5 class="m-b-md">Total Base</h5>
                <h2 class="text-danger">
                    <i class="fas fa-chart-line"></i> {{cantidadMedellin.total}}
                </h2>
            </div>
        </div>
    </div>
</div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>Ventas en Medellin</h5>
                    <div class="ibox-tools">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><form action="{{url('SOATcoordinador/ReporteVentasAsesorMedellin')}}" target="_blank" method="POST">
                                <input type="hidden" name="fechaInicio" value="{{fechaInicial}}" class="form-control">
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
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>Renovaciones en Medellin</h5>
                    <div class="ibox-tools">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><form action="{{url('SOATcoordinador/ReporteRenovacionesMedellin')}}" target="_blank" method="POST">
                                <input type="hidden" name="fechaInicio" value="{{fechaInicial}}" class="form-control">
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
                        <canvas id="barChart3" height="140"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="wrapper wrapper-content animated fadeInRight" style="margin: -5% 0;">
    <div class="row">
        <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>Nivel de Asesores</h5>
                
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">

                <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover dataTables-example" >
            <thead>
            <tr>
                <th>#</th>
                <th>Asesor</th>
                <th>Cantidad</th>
            </tr>
            </thead>
            <tbody>
            {% if data is empty %}
                No hay datos
            {% else %}
                {% for item in data %}
                    
                    <tr class="gradeX">
                        <td>{{item.num}}</td>
                        <td>{{item.nombres}}  {{item.apellidos}}</td>
                        <td>{{item.cantidad}}</td>
                    </tr>
                {% endfor %}
            {% endif %}
            
            </tbody>
            </table>
                </div>

            </div>
        </div>
    </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script>
    
       
    $(document).ready(function(){

$('.dataTables-example').DataTable({
    pageLength: 10,
    responsive: true,
    dom: '<"html5buttons"B>lTfgitp',
    buttons: [
        {extend: 'excel', title: 'Usuarios'},
        {extend: 'pdf', title: 'Usuarios'},

        {extend: 'print',
         customize: function (win){
                $(win.document.body).addClass('white-bg');
                $(win.document.body).css('font-size', '10px');

                $(win.document.body).find('table')
                        .addClass('compact')
                        .css('font-size', 'inherit');
        }
        }
    ],
    language: {
        "decimal": "",
        "emptyTable": "No hay información",
        "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
        "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
        "infoFiltered": "(Filtrado de _MAX_ total entradas)",
        "infoPostFix": "",
        "thousands": ",",
        "lengthMenu": "Mostrar _MENU_ Entradas",
        "loadingRecords": "Cargando...",
        "processing": "Procesando...",
        "search": "Buscar:",
        "zeroRecords": "Sin resultados encontrados",
        "paginate": {
            "first": "Primero",
            "last": "Ultimo",
            "next": "Siguiente",
            "previous": "Anterior"
        }
    },

});
});

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

        // Grafico para renovaciones por asesor

        var lineOptions = {
            responsive: true
        };
        var barData = {
            labels: [{% for item in RenovacionesAsesores %} "{{item.renovacionesAsesor}}" , {% endfor %}],
            datasets: [

                {
                    label: "Cantidad",
                    backgroundColor: '#e48c2b',
                    borderColor: "#e48c8b",
                    pointBackgroundColor: "rgba(26,179,148,1)",
                    pointBorderColor: "#fff",
                    data: [{% for item in RenovacionesAsesores %} {{item.cantidad}}, {% endfor %}]
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


        var ctx2 = document.getElementById("barChart3");
        new Chart(ctx2, {type: 'bar', data: barData, options:barOptions}); 

    });
</script>