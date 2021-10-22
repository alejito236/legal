<style>
    select{
        height: 34px!important;
    }
</style>
<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">

<br><br><br><br>
<div class="row col-md-12">
    <form action="{{url('administrador/anulada')}}" method="POST">
        <div class="col-md-5">
            <select name="campana" required class="form-control">
                <option value="">Seleccione Campaña...</option>
                <option value="2">SOAT</option>
                <option value="3">TARJETAS</option>
                <option value="4">TODO RIESGO</option>
				 <option value="19">FAMISANAR</option>
            </select>
            <br>
        </div>
        <div class="col-md-2">
            <button class="btn btn-primary form-control">Filtrar</button>
            <br>
        </div>
    </form>
</div>
<br><br><br><br><br>

{% if campana == 2 %}

<div class="col-md-12">
    <h1>Anuladas Soat <i class="fas fa-file-excel"></i></h1>
    <hr>
</div>

<div class="col-md-12">
    <form action="{{url('administrador/anulada')}}" method="POST">
        <div class="col-md-4">
            <label for="">Placa:</label>
            <input type="text" name="placa" required class="form-control" placeholder="AAA000">
            <input type="hidden" name="campana" value="2">
        </div>
        <div class="col-md-4">
            <label for="">Base:</label>
            <select name="ciudad" required id="ciudad" class="form-control">
                <option value="">Seleccione...</option>
            {% for item in ciudades %}
                <option value="{{item.id}}">{{item.ciudad}}</option>
            {% endfor %}
            </select>
        </div>
        <div class="col-md-2" style="margin-top: 5px;">
            <br>
            <button class="btn btn-primary form-control">Buscar</button>
        </div>
    </form>
</div>
<br><br><br><br><br><br><br><br><br>

{% if ventaKO is defined %}
    <br>
    <div class="col-md-12">
        <div class=" col-md-12 alert alert-danger alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-ban"></i> La placa <b>{{ventaKO}}</b> no está en anuladas.
        </div>
    </div>
    
{% endif %}
{% if anular is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> Venta actualizada con exito.
        </div>
    </div>
{% endif %}

{% if otraCiudad is defined %}
<br>
<div class="alert alert-danger alert-dismissable" style="margin-left: 2%; margin-right: 2%;">
    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
    <i class="fas fa-ban"></i> La placa existe en la ciudad de <b>{{otraCiudad}}</b>.
</div>
{% endif %}
<div class="col-md-12">
    {% if data is defined %}
    <br>
    <div class="col-md-12">
        <div class="ibox-content table-responsive" style="padding:0!important;">
            <table class="table table-striped table-bordered no-margins">
                <thead>
                	<th>Fecha Venta</th>
                	<th>Fecha Vencimiento</th>
                	<th>Cédula</th>
                	<th>Cliente</th>
                	<th>Placa</th>
                	<th>Valor ($)</th>
                	<th>Asesor</th>
                	<th>Acciones</th>
                </thead>
                <tbody>
                <tr>
                    <td>{{data.fechaActualizacion}}</td>
                    <td>{{data.fechaVencimiento}}</td>
                    <td>{{data.cedulaCliente}}</td>
                    <td>{{data.nombreCliente}}</td>
                    <td>{{data.placa}}</td>
                    <td>{{data.valorSoat}}</td>
                    <td>{{data.asesor}}</td>
                    <td class="text-center">
						<form action="{{url('administrador/anulada')}}" id="anular" method="POST">
                            <input type="hidden" name="id" value="{{data.id}}">
                            <input type="hidden" name="campana" value="2">
							<button type="button" class="btn btn-warning demo3"><i class="fas fa-ban"></i></button>
						</form>
					</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    {% endif %}
    <div class="col-lg-6 h-100 p-lg">
            
        </div>
</div>

    {% elseif campana == 3 %}

    <div class="col-md-12">
        <h1>Anuladas Tarjetas <i class="fas fa-file-excel"></i></h1>
        <hr>
    </div>
    
    
    <div class="col-md-12">
        <form action="{{url('administrador/anulada')}}" method="POST">
            <div class="col-md-4">
                <label for="">Cedula:</label>
                <input type="text" name="cedula" required class="form-control" placeholder="1234567890">
                <input type="hidden" name="campana" value="3">
            </div>
            <div class="col-md-4">
                <label for="">Base:</label>
                <select name="ciudad" required id="ciudad" class="form-control">
                    <option value="">Seleccione...</option>
                {% for item in ciudades %}
                    <option value="{{item.id}}">{{item.ciudad}}</option>
                {% endfor %}
                </select>
            </div>
            <div class="col-md-2" style="margin-top: 5px;">
                <br>
                <button class="btn btn-primary form-control">Buscar</button>
            </div>
        </form>
    </div>
    <br><br><br><br><br><br><br><br><br>
    
    {% if ventaKO is defined %}
        <br>
        <div class="col-md-12">
            <div class=" col-md-12 alert alert-danger alert-dismissable">
                <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                <i class="fas fa-ban"></i> La cedula <b>{{ventaKO}}</b> no está en anuladas.
            </div>
        </div>
        
    {% endif %}
    {% if anular is defined %}
        <br>
        <div class="col-md-12">
            <div class="alert alert-info alert-dismissable">
                <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                <i class="fas fa-check"></i> Venta actualizada con exito.
            </div>
        </div>
    {% endif %}
    
    {% if otraCiudad is defined %}
    <br>
    <div class="alert alert-danger alert-dismissable" style="margin-left: 2%; margin-right: 2%;">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-ban"></i> La cedula existe en la ciudad de <b>{{otraCiudad}}</b>.
    </div>
    {% endif %}
    <div class="col-md-12">
        {% if data is defined %}
        <br>
        <div class="col-md-12">
            <div class="ibox-content table-responsive" style="padding:0!important;">
                <table class="table table-striped table-bordered no-margins">
                    <thead>
                        <th>#</th>
                        <th>Cedula</th>
                        <th>Nombre Cliente</th>
                        <th>Cedula Cliente</th>
                        <th>Fecha Vencimiento</th>
                        <th>Cupo Tarjeta ($)</th>
                        <th>Tipo Tarjeta </th>
                        <th>Fecha Gestion</th>
                        <th>Asesor</th>
                        <th>Editar</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td>{{data.id}}</td>
                        <td>{{data.cedula}}</td>
                        <td>{{data.nombreCliente}}</td>
                        <td>{{data.cedula}}</td>
                        <td>{{data.fechaVencimiento}}</td>
                        <td>{{data.cupo}}</td>
                        <td>{{data.tipo}}</td>
                        <td>{{data.fechaActualizacion}}</td>
                        <td>{{data.asesor}}</td>
                        <td class="text-center">
                            <form action="{{url('administrador/anulada')}}" id="anular" method="POST">
                                <input type="hidden" name="id" value="{{data.id}}">
                                <input type="hidden" name="campana" value="3">
                                <button type="button" class="btn btn-warning demo3"><i class="fas fa-ban"></i></button>
                            </form>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        {% endif %}
        <div class="col-lg-6 h-100 p-lg">
                
        </div>
    </div>
	{% elseif campana == 19 %}

    <div class="col-md-12">
        <h1>Anuladas Famisanar <i class="fas fa-file-excel"></i></h1>
        <hr>
    </div>
    
    
    <div class="col-md-12">
        <form action="{{url('administrador/anulada')}}" method="POST">
            <div class="col-md-4">
                <label for="">Cedula:</label>
                <input type="text" name="cedula" required class="form-control" placeholder="1234567890">
                <input type="hidden" name="campana" value="19">
            </div>
           
            <div class="col-md-2" style="margin-top: 5px;">
                <br>
                <button class="btn btn-primary form-control">Buscar</button>
            </div>
        </form>
    </div>
    <br><br><br><br><br><br><br><br><br>
    
    {% if ventaKO is defined %}
        <br>
        <div class="col-md-12">
            <div class=" col-md-12 alert alert-danger alert-dismissable">
                <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                <i class="fas fa-ban"></i> La cedula <b>{{ventaKO}}</b> no está en anuladas.
            </div>
        </div>
        
    {% endif %}
    {% if anular is defined %}
        <br>
        <div class="col-md-12">
            <div class="alert alert-info alert-dismissable">
                <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                <i class="fas fa-check"></i> Venta actualizada con exito.
            </div>
        </div>
    {% endif %}
    
    {% if otraCiudad is defined %}
    <br>
    <div class="alert alert-danger alert-dismissable" style="margin-left: 2%; margin-right: 2%;">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-ban"></i> La cedula existe en la ciudad de <b>{{otraCiudad}}</b>.
    </div>
    {% endif %}
    <div class="col-md-12">
        {% if data is defined %}
        <br>
        <div class="col-md-12">
            <div class="ibox-content table-responsive" style="padding:0!important;">
                <table class="table table-striped table-bordered no-margins">
                   <thead>
						<th>#</th>
						<th>Cedula</th>
						<th>Nombre Cliente</th>
						<th>tipo de afiliado ($)</th>
						<th>Tipificacion</th>
						
						<th>Editar</th>
					</thead>
					<tbody>
					<tr>
						<td>{{data.id}}</td>
						<td>{{data.numeroDocumento}}</td>
						<td>{{data.primerNombre}}</td>
						<td>{{data.tipoAfiliado}}</td>	
						<td>{{data.tipificacion}}</td>
						<td class="text-center">
                            <form action="{{url('administrador/anulada')}}" id="anular" method="POST">
                                <input type="hidden" name="id" value="{{data.id}}">
                                <input type="hidden" name="campana" value="19">
                                <button type="button" class="btn btn-warning demo3"><i class="fas fa-ban"></i></button>
                            </form>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        {% endif %}
        <div class="col-lg-6 h-100 p-lg">
                
        </div>
    </div>

    {% elseif campana == 4 %}

    <div class="col-md-12">
        <h1>Anuladas Todo Riesgo <i class="fas fa-file-excel"></i></h1>
        <hr>
    </div>
    
    
    <div class="col-md-12">
        <form action="{{url('administrador/anulada')}}" method="POST">
            <div class="col-md-2">
                <h3 class="m-b-md">Buscar por Placa:</h3>
                <br>
            </div>
            <div class="col-md-5">
                <input type="text" id="placa" maxlength="6" required placeholder="AAA111" name="placa" class="form-control">
                <input type="hidden" name="campana" value="4">
                <br>
            </div>
            <div class="col-md-2">
                <button class="btn btn-primary form-control">Buscar</button>
                <br>
            </div>
        </form>
    </div>
    <br><br><br><br><br><br><br><br><br>
    
    {% if ventaKO is defined %}
        <br>
        <div class="col-md-12">
            <div class=" col-md-12 alert alert-danger alert-dismissable">
                <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                <i class="fas fa-ban"></i> La placa <b>{{ventaKO}}</b> no está en anuladas.
            </div>
        </div>
        
    {% endif %}
    {% if anular is defined %}
        <br>
        <div class="col-md-12">
            <div class="alert alert-info alert-dismissable">
                <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
                <i class="fas fa-check"></i> Venta actualizada con exito.
            </div>
        </div>
    {% endif %}
    
    {% if otraCiudad is defined %}
    <br>
    <div class="alert alert-danger alert-dismissable" style="margin-left: 2%; margin-right: 2%;">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-ban"></i> La placa existe en la ciudad de <b>{{otraCiudad}}</b>.
    </div>
    {% endif %}
    <div class="col-md-12">
        {% if data is defined %}
        <br>
        <div class="col-md-12">
            <div class="ibox-content table-responsive" style="padding:0!important;">
                <table class="table table-striped table-bordered no-margins">
                    <thead>
                        <th>Placa</th>
                        <th>Nombre Cliente</th>
                        <th>Cedula Cliente</th>
                        <th>Fecha Vencimiento</th>
                        <th>Vigencia Poliza</th>
                        <th>Fecha Gestion</th>
                        <th>Asesor</th>
                        <th>Acciones</th>
                    </thead>
                    <tbody>
                    <tr>
                        <td>{{data.placa}}</td>
                        <td>{{data.nombreCliente}}</td>
                        <td>{{data.cedulaCliente}}</td>
                        <td>{{data.fechaVencimiento}}</td>
                        <td>{{data.vigenciaPoliza}}</td>
                        <td>{{data.fechaActualizacion}}</td>
                        <td>{{data.asesor}}</td>
                        <td class="text-center">
                            <form action="{{url('administrador/anulada')}}" id="anular" method="POST">
                                <input type="hidden" name="id" value="{{data.id}}">
                                <input type="hidden" name="campana" value="4">
                                <button type="button" class="btn btn-warning demo3"><i class="fas fa-ban"></i></button>
                            </form>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        {% endif %}
        <div class="col-lg-6 h-100 p-lg">
                
            </div>
    </div>
{% endif %}
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    $(document).ready(function(){
        $('.demo3').click(function () {
            swal({
                title: "¿Seguro de cambiar a venta efectiva?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Si",
                closeOnConfirm: false
            }, function () {
                $('#anular').submit();
            });
        });
    });
</script>