<br>
<style>
    table{
        font-size: 16px;
    }    
    .label-default{

        background-color: #8EDE62 !important;
    }
    select{
        height: 3.5rem!important;
    }    
</style>

<div class="col-lg-12">
    <form action="{{url('GOPASScoordinador/index')}}" method="POST">
        <div class="col-lg-3">
            <label for="">Fecha inicio:</label>
            <input type="date" name="fechaInicio" value="{{fechaInicial}}" class="form-control">
        </div>
        <div class="col-lg-3">
            <label for="">Fecha final:</label>
            <input type="date" name="fechaFinal" value="{{fechaFinal}}" class="form-control">
        </div>
        <div class="col-lg-3" style="display:none">
            <label for="">Convenio:</label>
            <select name="filtroConvenio" id="" class = "form-control">
                <option value="">Todos los convenios</option>
                {% for item in convenios %}
                <option value="{{ item.convenioId }}">{{ item.nombre }}</option>
                {% endfor %}
            </select>
        </div>
        
        <div class="col-lg-2">
            <label for=""> <br></label>
            <button class="btn btn-primary form-control" id="btnFiltrar" name="btnFiltrar" >Filtrar</button>
        </div>
    </form>
</div>
<br><br><br><br><br>
<div class="wrapper ">
<div class="row">
    <div class="col-lg-6" style="margin: 2% 0" >
        <div class="ibox">
            <div class="ibox-title">    
                   <h5>Informe Contable</h5>                
            </div>
            <div class="ibox-content table-responsive" style="padding:0!important;">
                <table class="table table-hover no-margins">
                    <thead>
                    </thead>
                    <tbody>
                    <tr>
                        <td><span class="label label-default"><b>Total Base</b></span></td>
                        <td>{{datoTotalBase}}</td>
                    </tr>
                    <tr>
                        <td><span class="label label-default"><b>Contactados</b></span> </td>
                        <td>{{datoContactados}}</td>
                    </tr>
                    <tr>
                        <td><span class="label label-default"><b>Efectividad</b></span></td>
                        <td>{{efectividadInforme}}%</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="col-lg-6" style="margin: 2% 0" >
        <div class="ibox">
            <div class="ibox-title">    
                   <h5>Efectividad Ventas</h5>                
            </div>
            <div class="ibox-content table-responsive" style="padding:0!important;">
                <table class="table table-hover no-margins">
                    <thead>
                    </thead>
                    <tbody>
                    <tr>
                        <td><span class="label label-default"><b>Contactados</b></span></td>
                        <td>{{datoContactados}}</td>
                    </tr>
                    <tr>
                        <td><span class="label label-default"><b>Ventas</b></span> </td>
                        <td>{{datoVentas}}</td>
                    </tr>
                    <tr>
                        <td><span class="label label-default"><b>Efectividad</b></span></td>
                        <td>{{efectividadVenta}}%</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>  
</div>

<div class="wrapper wrapper-content animated fadeInRight">    
    {# Contactados por campaña #}
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>Contactados</h5>
                    <div class="ibox-tools">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><form action="{{url('GOPASScoordinador/reporteContactados')}}" target="_blank" method="POST">
                                <input type="hidden" name="fechaInicio" value="{{fechaInicial}}" class="form-control">
                                <input type="hidden" name="fechaFinal" value="{{fechaFinal}}">
                                <input type="hidden" name="filtroConvenio" value="{{ filtroConvenio }}">
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
                        <canvas id="barChartCamapana" height="140"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {# Fin contactados por campaña #}
    {# Calificacion presentacion personal #}
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>Calificacion Presentación Personal</h5>
                    <div class="ibox-tools">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><form action="{{url('GOPASScoordinador/reportePresentacionPersonal')}}" target="_blank" method="POST">
                                <input type="hidden" name="fechaInicio" value="{{fechaInicial}}" class="form-control">
                                <input type="hidden" name="fechaFinal" value="{{fechaFinal}}">
                                <input type="hidden" name="filtroConvenio" value="{{ filtroConvenio }}">
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
                        <canvas id="barChartCalificacion" height="140"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {# Fin calificacion personal #}
    {# Informados de membresias #}
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>Informados de membresias</h5>
                    <div class="ibox-tools">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><form action="{{url('GOPASScoordinador/reporteConoceMembresias')}}" target="_blank" method="POST">
                                <input type="hidden" name="fechaInicio" value="{{fechaInicial}}" class="form-control">
                                <input type="hidden" name="fechaFinal" value="{{fechaFinal}}">
                                <input type="hidden" name="filtroConvenio" value="{{ filtroConvenio }}">
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
                        <canvas id="barChartInfoMembresia" height="140"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {# Fin informados de membresia #}
    {# Adquirieron membresia #}
    <div class="row">
        <div class="col-lg-12">
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>Adquirieron Membresía</h5>
                    <div class="ibox-tools">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li><form action="{{url('GOPASScoordinador/reporteAdquiereMembresia')}}" target="_blank" method="POST">
                                <input type="hidden" name="fechaInicio" value="{{fechaInicial}}" class="form-control">
                                <input type="hidden" name="fechaFinal" value="{{fechaFinal}}">
                                <input type="hidden" name="filtroConvenio" value="{{ filtroConvenio }}">
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
                        <canvas id="barChartAdqMembresia" height="140"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {# Fin adquirieron membresia #}

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script>   

//Grafico para contactados
$(document).ready(function(){    
    var lineOptions = {
        responsive: true
    };    

    var datos = {
        labels : ['Postventa', 'Fidelizacion'],
        datasets : [{
                label : "Postventa",
                backgroundColor : "#60d394",
                borderColor : "#60d394",
                pointBackgroundColor: "rgba(26,179,148,1)",
                pointBorderColor: "#fff",
                data : [{% for resultado in datoContactadoCampana %}
                            {% if resultado.campanaId is 2 %}
                                {{ resultado.cantidad }}                            
                            {% endif %}
                        {% endfor %}]
            },
            {
                    label : "Fidelización",
                    backgroundColor : "#aaf683",
                    borderColor : "#aaf683",
                    pointBackgroundColor: "rgba(26,179,148,1)",
                    pointBorderColor: "#fff",
                    data : [0,{% for resultado in datoContactadoCampana %}
                            {% if resultado.campanaId is 3 %}
                                {{ resultado.cantidad }}                            
                            {% endif %}
                        {% endfor %}]
            }
        ]
    };
    
    var canvas = document.getElementById('barChartCamapana');
    window.bar = new Chart(canvas, {
        type : "bar",
        data : datos,
        options : {
            responsive : true,
            scales: {
                yAxes: [
                    {
                        ticks: {
                    beginAtZero:true
                    },
                        stacked: false
                    }
                ]
            }
        }
    });
});

//Grafico para informacion membresia
$(document).ready(function(){
    var lineOptions = {
        responsive: true
    };

    var datos = {
        labels : ['Si','No'],
        datasets : [{
                label : "Si",
                backgroundColor : "#aaf683",
                borderColor : "#aaf683",
                pointBackgroundColor: "rgba(26,179,148,1)",
                pointBorderColor: "#fff",
                data : [{% for resultado in datoConoceMembresias %}
                            {% if resultado.conoceMembresias is 1 %}
                                {{ resultado.cantidad }}                            
                            {% endif %}
                        {% endfor %}]
            },
            {
                    label : "No",
                    backgroundColor : "#ee6055",
                    borderColor : "#ee6055",
                    pointBackgroundColor: "rgba(26,179,148,1)",
                    pointBorderColor: "#fff",
                    data : [0,{% for resultado in datoConoceMembresias %}
                            {% if resultado.conoceMembresias is 0 %}
                                {{ resultado.cantidad }}
                            {% endif %}
                        {% endfor %}]
            }
        ]
    };
    
    var canvas = document.getElementById('barChartInfoMembresia');
    window.bar = new Chart(canvas, {
        type : "bar",
        data : datos,
        options : {
            responsive : true,
            scales: {
                yAxes: [
                    {
                        ticks: {
                    beginAtZero:true
                    },
                        stacked: false
                    }
                ]
            }
        }
    });
});

//Grafico para adquirieron membresia
$(document).ready(function(){
    var lineOptions = {
        responsive: true
    };

    var datos = {
        labels : ['Postventa (Si)','Postventa (No)','Fidelizacion (Si)','Fidelizacion (No)'],
        datasets : [{
                label : "Postventa (Si)",
                backgroundColor : "#60d394",
                borderColor : "#60d394",
                pointBackgroundColor: "rgba(26,179,148,1)",
                pointBorderColor: "#fff",
                data : [{% for resultado in datoAdquiereMembresia %}
                            {% if resultado.campanaId is 2 and resultado.adquiereMembresia is 1  %}
                                {{resultado.cantidad}}
                            {% else %}                                
                            {% endif %}
                        {% endfor %}]
            },
            {
                    label : "Postventa (No)",
                    backgroundColor : "#ee6055",
                    borderColor : "#ee6055",
                    pointBackgroundColor: "rgba(26,179,148,1)",
                    pointBorderColor: "#fff",
                    data : [0,{% for resultado in datoAdquiereMembresia %}
                                {% if resultado.campanaId is 2 and resultado.adquiereMembresia is 0  %}
                                    {{resultado.cantidad}}                            
                                {% endif %}
                            {% endfor %}] 
            },
            {
                    label : "Fidelización (si)",
                    backgroundColor : "#aaf683",
                    borderColor : "#aaf683",
                    pointBackgroundColor: "rgba(26,179,148,1)",
                    pointBorderColor: "#fff",
                    data : [0,0,{% for resultado in datoAdquiereMembresia %}
                                    {% if resultado.campanaId is 3 and resultado.adquiereMembresia is 1  %}
                                        {{resultado.cantidad}}                            
                                    {% endif %}
                                {% endfor %}]     
            },
            {
                    label : "Fidelización (No)",
                    backgroundColor : "#ff9b85",
                    borderColor : "#ff9b85",
                    pointBackgroundColor: "rgba(26,179,148,1)",
                    pointBorderColor: "blue",
                    data : [0,0,0,{% for resultado in datoAdquiereMembresia %}
                                    {% if resultado.campanaId is 3 and resultado.adquiereMembresia is 0  %}
                                        {{resultado.cantidad}}                            
                                    {% endif %}
                                {% endfor %}]  
            }
        ]
    };
    
    var canvas = document.getElementById('barChartAdqMembresia');
    window.bar = new Chart(canvas, {
        type : "bar",
        data : datos,
        options : {
            responsive : true,
            scales: {
                yAxes: [
                    {
                        ticks: {
                    beginAtZero:true
                    },
                        stacked: false
                    }
                ]
            }
        }
    });
});

//Grafico para Calificacion
$(document).ready(function(){
    var lineOptions = {
        responsive: true
    };

    var datos = {
        labels : ['Valor 1','Valor 2', 'valor 3', 'valor 4', 'valor 5'],
        datasets : [{
                label : "Valor 1",
                backgroundColor : "#ee6055",
                borderColor : "#ee6055",
                pointBackgroundColor: "rgba(26,179,148,1)",
                pointBorderColor: "#fff",
                data : [{% for resultado in datoPresentacionPersonal %}
                            {% if resultado.calificacion is 1 %}
                                {{resultado.cantidad}}
                            {% else %}
                            {% endif %}
                        {% endfor %}]
            },
            {
                label : "Valor 2",
                backgroundColor : "#ff9b85",
                borderColor : "#ff9b85",
                pointBackgroundColor: "rgba(26,179,148,1)",
                pointBorderColor: "#fff",
                data : [0,{% for resultado in datoPresentacionPersonal %}
                            {% if resultado.calificacion is 2 %}
                                {{resultado.cantidad}}
                            {% else %}
                            {% endif %}
                        {% endfor %}]
            },
            {
                label : "Valor 3",
                backgroundColor : "#ffd97d",
                borderColor : "#ffd97d",
                pointBackgroundColor: "rgba(26,179,148,1)",
                pointBorderColor: "#fff",
                data : [0,0,{% for resultado in datoPresentacionPersonal %}
                            {% if resultado.calificacion is 3 %}
                                {{resultado.cantidad}}
                            {% else %}
                            {% endif %}
                        {% endfor %}]
            },
            {
                label : "Valor 4",
                backgroundColor : "#aaf683",
                borderColor : "#aaf683",
                pointBackgroundColor: "rgba(26,179,148,1)",
                pointBorderColor: "#fff",
                data : [0,0,0,{% for resultado in datoPresentacionPersonal %}
                            {% if resultado.calificacion is 4 %}
                                {{resultado.cantidad}}
                            {% else %}
                            {% endif %}
                        {% endfor %}]
            },
            {
                label : "Valor 5",
                backgroundColor : "#60d394",
                borderColor : "#60d394",
                pointBackgroundColor: "rgba(26,179,148,1)",
                pointBorderColor: "#fff",
                data : [0,0,0,0,{% for resultado in datoPresentacionPersonal %}
                            {% if resultado.calificacion is 5 %}
                                {{resultado.cantidad}}
                            {% else %}
                            {% endif %}
                        {% endfor %}]
            },            
        ]
    };

    var canvas = document.getElementById('barChartCalificacion');
    window.bar = new Chart(canvas, {
        type : "bar",
        data : datos,
        options : {
            responsive : true,
            scales: {
                yAxes: [
                    {
                        ticks: {
                    beginAtZero:true
                    },
                        stacked: false
                    }
                ]
            }
        }
    });
});
</script>