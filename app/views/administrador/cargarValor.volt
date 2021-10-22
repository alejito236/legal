<div class="col-md-12">
        <h1>Resultados de la carga <i class="fas fa-database"></i></h1>
        
        <hr>
</div>


{% if data is defined %}

<div class="row  border-bottom  dashboard-header">
    <div class="col-md-5 col-md-offset-3">
        <br><br>
        <div class="ibox-title">
            <h5>Datos del proceso</h5>
        </div>
        <div class="ibox-content">
            <ul class="list-group clear-list m-t">
                <li class="list-group-item fist-item">
                    
                    <span class="label label-success"><i class="far fa-clock"></i></span> Total de datos
                    <span class="float-right datoInicio">
                        {{data.total}}
                    </span>
                </li>
                <!-- <li class="list-group-item">
                    
                    <span class="label label-info"><i class="fas fa-chart-area"></i></span> Insertados
                    <span class="float-right datoPromedio">
                        {{data.insertados}}
                    </span>
                </li> -->
                <li class="list-group-item">
                    
                    <span class="label label-primary "><i class="fas fa-stopwatch"></i></span> Actualizados
                    <span class="float-right datoTrabajo">
                        {{data.actualizados}}
                    </span>
                </li>
                <li class="list-group-item">
                    
                    <span class="label label-warning "><i class="fas fa-check"></i></span> Existen
                    <span class="float-right datoTrabajo">
                        {{data.existen}}
                    </span>
                </li>
                <li class="list-group-item">
                    
                    <span class="label label-danger"><i class="fas fa-bug"></i></span> Errores
                    <span class="float-right bg-gray datoErrores">
                        {{data.errores}}
                    </span>
                </li>
            </ul>
        </div>
    </div>
</div>
{% endif %}
