<div class="col-md-12">
        <h1>Cargar base <i class="fas fa-database"></i></h1>
        
        <hr>
</div>

<div class="white-bg dashboard-header col-md-5 col-md-offset-1">
    <button class="form-control btn btn-warning" type="button" data-toggle="modal" data-target="#myModal5">Indicaciones</button><br><br>
    <a href="../Plantillas_Excel/PlantillaEstadosTarjteas.csv" target="_blank" class="btn btn-primary form-control"><i class="fas fa-file-excel"></i> Descargar plantilla</a>
    <br>
</div>

<div class="white-bg dashboard-header col-md-5  ">
    <form enctype="multipart/form-data" method="POST" action="{{url('administrador/tarjetas')}}"  name="cargarBase" >
        <input type="file" name="archivoExcel" id="file-5" class="form-control inputfile inputfile-4" data-multiple-caption="{count} files selected" multiple required/>
        <br>
        <select style="height: 40px;" name="verificar" required id="" class="form-control">
            <option value="">Seleccione...</option>
            <option value="1">SOLO CARGAR</option>
            <option value="2">CARGAR Y ACTUALIZAR</option>
            <option value="3">SOLO ACTUALIZAR</option>
        </select>
        <br>
        <button class="btn btn-primary form-control"><i class="fas fa-upload"></i> Subir</button>
    </form>
    <br>
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
                <li class="list-group-item">
                    
                    <span class="label label-info"><i class="fas fa-chart-area"></i></span> Insertados
                    <span class="float-right datoPromedio">
                        {{data.insertados}}
                    </span>
                </li>
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

<div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog2" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Indicaciones para subir base</h4>
            </div>
            <div class="modal-body">
                
                    <div class="row">
                        <div class="col-md-6">
                            <div class="col-md-6">
                                <label for="">Primer paso:</label>
                            </div>
                            <div class="col-md-12">
                                <p>Descargue la planilla.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6">
                                <label for="">Segundo paso:</label>
                            </div>
                            <div class="col-md-12">
                                <p>Cargue todos los datos solicitados en la planilla, los datos no deben tener caracteres especiales.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6">
                                <label for="">Tercer paso:</label>
                            </div>
                            <div class="col-md-12">
                                <p>El campo Ciudad es númerico.</p>
                                <ul>
                                    <li>1 = BOGOTÁ</li>
                                    <li>2 = MEDELLÍN</li>
                                    <li>3 = CALI</li>
                                    <li>4 = BUCARAMANGA</li>
                                    <li>9 = TUNJA</li>
                                    <li>19 = NEIVA</li>
                                    <li>22 = VILLAVICENCIO</li>
                                    <li>30 = IBAGUÉ</li>
                                    <li>49 = EJE CAFETERO</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6">
                                <label for="">Cuarto paso:</label>
                            </div>
                            <div class="col-md-12">
                                <p>Mantener el formato de fecha 2019-09-09(año-mes-dia) sin caracteres especiales. Formula en excel: <h4>=TEXTO(Campo a modificar;"YYYY-MM-DD")</h4></p>
                            </div>
                        </div>
                        <div class="col-md-6">

                        </div>
                    </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
            </div>
            </form>
        </div>
    </div>
</div>