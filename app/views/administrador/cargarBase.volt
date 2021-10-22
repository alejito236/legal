<style>
    select{
        height: 33px!important;
    }
</style>
<!-- <div class="col-md-12">
        <h1>Cargar base <i class="fas fa-database"></i></h1>
        
        <hr>
</div> -->

<br><br><br><br>
<div class="row col-md-12">
    <form action="{{url('administrador/cargarBase')}}" method="POST">
        <div class="col-md-5">
            <select name="campana" required class="form-control">
                <option value="">Seleccione Campaña...</option>
                <option value="5">COLFONDOS</option>
                <option value="2">SOAT</option>
                <option value="3">TARJETAS</option>
                <option value="4">TODO RIESGO</option>
                <option value="7">BILLETERA SEGURA</option>
                <option value="19">FAMISANAR </option>
                <option value="100">SOAT (Pasar ventas a renovaciones)</option>
                <option value="200">GOPASS (Pasar ventas entre bases)</option>
            </select>
            <br>
        </div>
        <div class="col-md-2">
            <button class="btn btn-primary form-control">Filtrar</button>
            <br>
        </div>
    </form>
</div>

{% if campana == 2 %}

<div class="col-md-12">
    <h1>Cargar Base Soat <i class="fas fa-database"></i></h1>
    
    <hr>
</div>
<div class="white-bg dashboard-header col-md-5 col-md-offset-1">
    <button class="form-control btn btn-warning" type="button" data-toggle="modal" data-target="#myModal5">Indicaciones</button><br><br>
    <a href="../Plantillas_Excel/PlantillaSoat.csv" target="_blank" class="btn btn-primary form-control"><i class="fas fa-file-excel"></i> Descargar plantilla</a>
    <br>
</div>

<div class="white-bg dashboard-header col-md-5  ">
    <form enctype="multipart/form-data" method="POST" action="{{url('administrador/cargarBase')}}"  name="cargarBase" >
        <input type="file" name="archivoExcel" id="file-5" class="form-control inputfile inputfile-4" data-multiple-caption="{count} files selected" multiple required/>
        <input type="hidden" name="campana" value="2"/>
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
                                    <li>23 = PASTO</li>
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
                            <div class="col-md-6">
                                <label for="">Quinto paso:</label>
                            </div>
                            <div class="col-md-12">
                                <p>el campo tipo tarjeta o franquicia es numerico </h4></p>
								<ul>
                                    <li>1 = VISA</li>
                                    <li>2 = MASTER CARD</li>
                                    <li>3 = TARJETA NOVUS</li>              
									
                                </ul>
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
{% elseif campana == 3 %}

<div class="col-md-12">
    <h1>Cargar Base Tarjetas <i class="fas fa-database"></i></h1>
    
    <hr>
</div>

<div class="white-bg dashboard-header col-md-5 col-md-offset-1">
<button class="form-control btn btn-warning" type="button" data-toggle="modal" data-target="#myModal5">Indicaciones</button><br><br>
<a href="../Plantillas_Excel/PlantillaTarjetas.csv" target="_blank" class="btn btn-primary form-control"><i class="fas fa-file-excel"></i> Descargar plantilla</a>
<br>
</div>

<div class="white-bg dashboard-header col-md-5  ">
<form enctype="multipart/form-data" method="POST" action="{{url('administrador/cargarBase')}}"  name="cargarBase" >
    <input type="hidden" name="campana" value="3"/>
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
                                <li>5 = BARRANQUILLA</li>
                                <li>9 = TUNJA</li>
                                <li>14 = VALLEDUPAR</li>
                                <li>16 = MONTERIA</li>
                                <li>19 = NEIVA</li>
                                <li>22 = VILLAVICENCIO</li>
                                <li>23 = PASTO</li>
                                <li>30 = IBAGUÉ</li>
                                <li>49 = EJE CAFETERO</li>
                            </ul>
                        </div>
                    </div>
                     <div class="col-md-6">
                        <div class="col-md-6">
                            <label for="">Cuardo paso:</label>
                        </div>
                        <div class="col-md-12">
                            <p>El campo Tipo de Tarjeta es númerico.</p>
                            <ul>
                                <li>1 = CLASICA</li>
                                <li>2 = ORO</li>
                                <li>3 = PLATINUM</li>
                                <li>4 = BLACK</li>
                                <li>5 = FACILISIMA</li>
                                <li>6 = PENDIENTE</li>
                            </ul>
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

{% elseif campana == 4 %}

<div class="col-md-12">
    <h1>Cargar Base Todo Riesgo <i class="fas fa-database"></i></h1>
    
    <hr>
</div>

<div class="white-bg dashboard-header col-md-5 col-md-offset-1">
<button class="form-control btn btn-warning" type="button" data-toggle="modal" data-target="#myModal5">Indicaciones</button><br><br>
<a href="../Plantillas_Excel/PlantillaTodoRiesgo.csv" target="_blank" class="btn btn-primary form-control"><i class="fas fa-file-excel"></i> Descargar plantilla</a>
<br>
</div>

<div class="white-bg dashboard-header col-md-5  ">
<form enctype="multipart/form-data" method="POST" action="{{url('administrador/cargarBase')}}"  name="cargarBase" >
    <input type="hidden" name="campana" value="4"/>
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
                            <p>Mantener el formato de fecha 20190909(año-mes-dia) sin caracteres especiales. Formula en excel: <h4>=TEXTO(Campo a modificar;"YYYYMMDD")</h4></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-8">
                            <label for="">Cuarto paso:</label>
                        </div>
                        <div class="col-md-12">
                                <p>El campo Zona es númerico.</p>
                            <select style="height: 40px;" name="departamento" id="departamento" class="form-control">
                                <option value="">Buscar..</option>
                                {% for item3 in departamentos %}
                                <option id="item3" value="{{item3.id}}">{{item3.departamento}} = {{item3.id}}</option>
                                {% endfor %}
                            </select>
                            <br>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-8">
                            <label for="">Quinto paso:</label>
                        </div>
                        <div class="col-md-12">
                            <p>El campo Ciudad es númerico.</p>
                            <select style="height: 40px;" name="ciudad" id="ciudad" class="form-control">
                                <option value="">Buscar..</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-6">
                            <label for="">Ultimo paso:</label>
                        </div>
                        <div class="col-md-12">
                            <p>El campo Aseguradora es númerico.</p>
                            <ul class="col-md-6">
                                <li>1 = HDI</li>
                                <li>2 = SBS</li>
                                <li>4 = EQUIDAD</li>
                                <li>6 = ESTADO</li>
                                <li>7 = AXA</li>
                                <li>11 = BOLIVAR</li>
                                <li>12 = MAPFRE</li>
                            </ul>
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


{% elseif campana == 5 %}

<div class="col-md-12">
    <h1>Cargar Base Colfondos <i class="fas fa-database"></i></h1>
    
    <hr>
</div>

<div class="white-bg dashboard-header col-md-5 col-md-offset-1">
<button class="form-control btn btn-warning" type="button" data-toggle="modal" data-target="#myModal5">Indicaciones</button><br><br>
<a href="../Plantillas_Excel/plantillaColfondos.csv" target="_blank" class="btn btn-primary form-control"><i class="fas fa-file-excel"></i> Descargar plantilla</a>
<br>
</div>

<div class="white-bg dashboard-header col-md-5  ">
<form enctype="multipart/form-data" method="POST" action="{{url('administrador/cargarBase')}}"  name="cargarBase" >
    <input type="hidden" name="campana" value="5"/>
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
                            <p>Mantener el formato de fecha 20190909 (año-mes-dia) sin caracteres especiales. Formula en excel: <h4>=TEXTO(Campo a modificar;"YYYYMMDD")</h4></p>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-8">
                            <label for="">Cuarto paso:</label>
                        </div>
                        <div class="col-md-12">
                                <p>El campo Ciuda de expedicion y ciu es númerico.</p>
                                <ul class="col-md-6">
                                    <li>1 = BOGOTÁ</li>
                                    <li>2 = MEDELLÍN</li>
                                    <li>3 = CALI</li>
                                    <li>4 = BUCARAMANGA</li>
                                    <li>5 = BARRANQUILLA</li>
                                    <li>6 = LETICIA</li>
                                    <li>7 = ARAUCA</li>
                                    <li>8 = CARTAGENA DE INDIAS</li>
                                    <li>9 = TUNJA</li>
                                    <li>10 = MANIZALES</li>
                                    <li>11 = FLORENCIA</li>
                                    <li>12 = YOPAL</li>
                                    <li>13 = POPAYÁN</li>
                                    <li>14 = VALLEDUPAR</li>
                                    <li>15 = QUIBDÓ</li>
                                    <li>16 = MONTERÍA</li>
                                    <li>17 = INÍRIDA</li>
                                    <li>18 = SAN JOSÉ DEL GUAVIARE</li>
                                    <li>19 = NEIVA</li>
                                    <li>20 = RIOHACHA</li>
                                    <li>21 = SANTA MARTA</li>
                                    <li>22 = VILLAVICENCIO</li>
                                </ul>
                            <br>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-8">
                            <label for="">Quinto paso:</label>
                        </div>
                        <div class="col-md-12">
                            <p>El campo genero.</p>
                            <ul class="col-md-6">
                                <li> M = Masculino. </li>
                                <li> F = Femenino </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="col-md-6">
                            <label for="">Ultimo paso:</label>
                        </div>
                        <div class="col-md-12">
                            <p>El campo Nicho.</p>
                            <ul class="col-md-6">
                                <li>NICHO 1</li>
                                <li>NICHO 2</li>
                                <li>NICHO 3</li>
                            </ul>
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


{% elseif campana == 100 %}

<div class="col-md-12">
    <h1>Pasar ventas a renovaciones <i class="fas fa-database"></i></h1>
    
    <hr>
</div>

<div class="white-bg dashboard-header col-md-5 col-md-offset-1">
<button class="form-control btn btn-warning" type="button" data-toggle="modal" data-target="#myModal5">Indicaciones</button><br><br>
<a href="../Plantillas_Excel/PlantillaRenovaciones.csv" target="_blank" class="btn btn-primary form-control"><i class="fas fa-file-excel"></i> Descargar plantilla</a>
<br>
</div>

<div class="white-bg dashboard-header col-md-5  ">
<form enctype="multipart/form-data" method="POST" action="{{url('administrador/cargarBase')}}"  name="cargarBase" >
    <input type="hidden" name="campana" value="100"/>
    <input type="file" name="archivoExcel" id="file-5" class="form-control inputfile inputfile-4" data-multiple-caption="{count} files selected" multiple required/>
    <br>
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
                
                <span class="label label-primary "><i class="fas fa-stopwatch"></i></span> Actualizados
                <span class="float-right datoTrabajo">
                    {{data.actualizados}}
                </span>
            </li>
            <li class="list-group-item">
                
                <span class="label label-warning "><i class="fas fa-check"></i></span> Existen como venta o renovacion
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
{% elseif campana == 19 %}

<div class="col-md-12">
    <h1>Cargar Base Famisanar <i class="fas fa-database"></i></h1>
    
    <hr>
</div>

<div class="white-bg dashboard-header col-md-5 col-md-offset-1">
<button class="form-control btn btn-warning" type="button" data-toggle="modal" data-target="#myModal5">Indicaciones</button><br><br>
<a href="../Plantillas_Excel/PlantillaFamisanar.csv" target="_blank" class="btn btn-primary form-control"><i class="fas fa-file-excel"></i> Descargar plantilla</a>
<br>
</div>

<div class="white-bg dashboard-header col-md-5  ">
<form enctype="multipart/form-data" method="POST" action="{{url('administrador/cargarBase')}}"  name="cargarBase" >
    <input type="hidden" name="campana" value="19"/>
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
                                <li>23 = PASTO</li>
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
                            <p>Mantener el formato de fecha 20190909(año-mes-dia) sin caracteres especiales. Formula en excel: <h4>=TEXTO(Campo a modificar;"YYYYMMDD")</h4></p>
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
{% elseif campana == 7 %}

<div class="col-md-12">
    <h1>Cargar Base Billetera Segura <i class="fas fa-database"></i></h1>
    
    <hr>
</div>

<div class="white-bg dashboard-header col-md-5 col-md-offset-1">
<button class="form-control btn btn-warning" type="button" data-toggle="modal" data-target="#myModal5">Indicaciones</button><br><br>
<a href="../Plantillas_Excel/PlantillaBilleteraSegura.csv" target="_blank" class="btn btn-primary form-control"><i class="fas fa-file-excel"></i> Descargar plantilla</a>
<br>
</div>

<div class="white-bg dashboard-header col-md-5  ">
    <form enctype="multipart/form-data" method="POST" action="{{url('administrador/cargarBase')}}"  name="cargarBase" >
        <input type="hidden" name="campana" value="7"/>
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



{% elseif campana == 200 %}

<div class="col-md-12">
    <h1>Cargar Base Gopass <i class="fas fa-database"></i></h1>
    
    <hr>
</div>

<div class="white-bg dashboard-header col-md-8 col-md-offset-2">
    <form action="{{url('administrador/cargarBase')}}" method="POST">
        <input type="hidden" name="campana" value="200"/>
        <input type="hidden" name="insertar" value="insertar">
        <button class="form-control btn btn-success" type="submit">Subir Ventas Gopass</button>    
    </form>
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
                
                <span class="label label-warning "><i class="fas fa-check"></i></span> Existen no se pueden vender
                <span class="float-right datoTrabajo">
                    {{data.existen}}
                </span>
            </li>
        </ul>
    </div>
</div>
</div>
{% endif %}

{% endif %}

<script type="text/javascript">

    //funcion para traer el barrio dependiendo la localidad
    $("#departamento").change(function(e) {
    
    var url = "{{url('administrador/cargarBase')}}";
    var parametros = {
    "dapartamento2" : $('#departamento').val(),
    "campana" : 4
    }
    $.ajax({
    type: "POST",
    url: url,
    data: parametros,
    
    success: function(data){
        console.log(parametros)
    var body = JSON.parse(data);

    var option = '<option>Seleccione..</option>';
    for (var i = 0; i < body.length; i++) {
        option+= '<option value="' + body[i]['id'] + '">' + body[i]['ciudad'] + ' = ' + body[i]['id'] + '</option>';
    
    }
    $('#ciudad').html(option);
    }
    });
    e.preventDefault();
    });
</script>