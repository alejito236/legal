<style>
	select{
		height: 33px!important;
	}
	.ibox-title {
	    -moz-border-bottom-colors: none;
	    -moz-border-left-colors: none;
	    -moz-border-right-colors: none;
	    -moz-border-top-colors: none;
	    background-color: #ffffff;
	    border-color: #e7eaec;
	    border-image: none;
	    border-style: solid solid none;
	    border-width: 2px 0 0;
	    color: inherit;
	    margin-bottom: 0;
	    padding: 15px 0px 8px 15px!important;
	    min-height: 48px;
	    position: relative;
	    clear: both;
	}
	.panel {
	    margin-bottom: 20px;
	    background-color: #FFFFFF;
	    border: 1px solid transparent;
	    border-radius: 4px;
	}
	.panel-primary {
	    border-color: #5095E2!important;
	}
	hr{
		height: 1px!important;
		background-color: silver;
	}
	input,select{
		border: 1px solid silver!important;
	}
	.btn{
        background-color: #4F7F20!important;
        color: #f2f2f2!important;
        border-color: #80B250!important;
    }
    .btn:hover{
        background-color: #80B250!important;
	}
	table{
		text-transform: uppercase;
	}
	input{
		text-transform: uppercase;
	}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<br>
<div class="wrapper ">
	<div class="row">
        <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-content">
                    <h5 class="m-b-md">Reagendamiento de Ventas</h5>
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> {% for item in cantidad %} {{item.cantidad}} {% endfor %}
                    </h2>
                </div>
            </div>
        </div>
    </div>

	{% if exitoGestion is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable" >
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> Gestión Exitosa.
        </div>
    </div>
	{% endif %}
	{% if error is defined %}
		<br>
		<div class="col-md-12">
			<div class="alert alert-danger alert-dismissable" >
				<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
				<i class="fas fa-exclamation-triangle"></i> {{ error }}
			</div>
		</div>
	{% endif %}
	{% if error2 is defined %}
		<br>
		<div class="col-md-12">
			<div class="alert alert-danger alert-dismissable" >
				<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
				<i class="fas fa-exclamation-triangle"></i> La placa {{ error2 }} no se encuentra pudo gestionar correctamente.
			</div>
		</div>
	{% endif %}
	<div class="row">
		<form action="{{url('GOPASSasesor/reagendamiento')}}"  method="POST">
			<div class="col-md-6">
				<div class="col-md-8">
					<input type="text" id="placa" placeholder="Buscar" name="placa" class="form-control">
				</div>
				<div class="col-md-4">
					<button id="mensaje" class="btn btn-primary form-control">Buscar</button>
				</div>
			</div>
		</form>
	</div>
	{% if entregado is defined %}
	<br>
	<div class="alert alert-info alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> La placa {{entregado}} ya le fue entregado el SOAT.
    </div>
	{% endif %}
	{% if exito is defined %}
	<br>
	<div class="alert alert-info alert-dismissable" id="exito">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> La placa {{exito}} fue reagendada con exito en la Base de Datos.
    </div>
	{% endif %}
	
	{% if notFoundDB is defined %}
	<br>
	<div class="alert alert-danger alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-ban"></i> La placa {{notFoundDB}} no se encuenta en la Base de datos.
    </div>
	{% endif %}
	{% if otraCiudad is defined %}
	<br>
	<div class="alert alert-danger alert-dismissable" id="otraCiudad">
		<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
		<i class="fas fa-ban"></i> La placa existe en otra ciudad <b>{{otraCiudad}}</b>.
	</div>
	{% endif %}
	<div class="col-md-12">
	{% if historial is defined %}
			<div class="col-md-12" style = "margin-top: 20px;">
				<form action="{{url('GOPASSasesor/reagendamiento')}}" method="POST">
					<input type="hidden" value = "{{ placa }}" name = "placaGestionar" id = "placaGestionar">
					<button class = "btn btn-success">Gestionar</button>
				</form>
				<div class="ibox-content table-responsive" style="padding:0!important; margin-top: 20px;">
					<table class="table table-striped table-bordered no-margins">
						<thead>
							<th>Documento</th>
							<th>Nombre</th>
							<th>Direccion Entrega</th>
							<th>Telefono</th>
							<th>Celular</th>							
							<th>Observaciones</th>
							<th>Placa</th>
							<th>Convenio</th>
							{# <th>Numero Tags</th> #}
							<th>Tipificacion</th>
							<th>Fecha Entrega</th>
							<th>Fecha Gestión</th>
						</thead>
						<tbody>
						{% for item in historial %}
					
						<tr>
							<td>{{ item.cedulaPersona }}</td>
							<td>{{ item.nombrePersona }}</td>
							<td>{{ item.direccionEntrega }}</td>
							<td>{{ item.telefono }}</td>
							<td>{{ item.celularLlamadas }}</td>							
							<td>{{ item.observacion }}</td>
							<td>{{ item.placa }}</td>
							<td>{{ item.nombreConvenio }}</td>
							{# <td>{{ item.numTags }}</td> #}
							<td>{{ item.nombreTipi }}</td>
							<td>{{ item.fechaEntrega }}</td>
							<td>{{ item.fechaGestion }}</td>
						</tr>
						{% endfor %}
						</tbody>
					</table>
				</div>
			</div>
			{% endif %}
			<div class="col-lg-6 h-100 p-lg">
					
			</div>
		</div>
	{% if consulta is defined %}	
	<form class="form-horizontal" method="POST" action="{{url('GOPASSasesor/reagendar')}}" style = "margin-top: 20px;">
		<div class="panel panel-default">
			<br>
			<div class="panel-body">                                                                        
				<div class="row">
					<div class="col-md-6">
						<div class="form-group">                                        
							<label class="col-md-3 control-label">Documento cliente</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>
									<input 
										type="number"  
										style="border-color: gray;" 
										class="form-control" 
										required 
										name="documentoCliente" 
										placeholder = "Documento del cliente" 
										value = "{{ consulta.cedulaPersona }}" 
										readonly
									>
									<input type="hidden" name="id" id="id" value = "{{ consulta.gestionId }}">
								</div>            
								<span class="help-block">Documento cliente</span>
							</div>
						</div>
						<br>
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Nombre cliente</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;"><span class="fa fa-users"></span></span>
									<input 
										type="text"  
										style="border-color: gray;" 
										class="form-control" 
										required 
										name="nombreCliente" 
										placeholder = "Nombre del cliente" 
										value = "{{ consulta.nombrePersona }}" 
										readonly
									>
								</div>            
								<span class="help-block">Nombre cliente</span>
							</div>
						</div>
						<br>
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Dirección cliente</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-map-marker-alt"></span></span>
									<input 
										type="text"  
										style="border-color: gray;" 
										class="form-control" 
										required 
										name="direccionCliente" 
										placeholder = "Dirección del cliente" 
										value = "{{ consulta.direccionCasa }}"
									>
								</div>            
								<span class="help-block">Dirección cliente</span>
							</div>
						</div>
						<br>
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Telefono cliente</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;"><span class="fa fa-phone"></span></span>
									<input 
										type="number"  
										style="border-color: gray;" 
										class="form-control" 
										required 
										name="telefonoCliente" 
										placeholder = "Telefono del cliente" 
										value = "{{ consulta.telefono }}"
									>
								</div>            
								<span class="help-block">Telefono cliente</span>
							</div>
						</div>
						<br>
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Celular cliente</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;"><span class="fa fa-phone"></span></span>
									<input 
										type="number"  
										style="border-color: gray;" 
										class="form-control" 
										required 
										name="celularCliente" 
										placeholder = "Celular del cliente" 
										value = "{{ consulta.celularLlamadas }}"
									>
								</div>            
								<span class="help-block">Celular cliente</span>
							</div>
						</div>
						<br>
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Ciudad residencia cliente</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-city"></span></span>
									<select 
										name="ciudadCliente" 
										style="border-color: gray; height: 34px;" 
										class="form-control" 
										required 
										id = "ciudadResidencia"
									>
										<option>Seleccione...</option>
										{% for item in ciudades %}
										<option value = "{{ item.ciudadId }}">{{ item.nombre }}</option>
										{% endfor %}
									</select>
								</div>            
								<span class="help-block">Ciudad residencia cliente</span>
							</div>
						</div>
						<br>
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Localidad residencia cliente</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-city"></span></span>
									<select 
										name="localidadCliente" 
										style="border-color: gray; height: 34px;" 
										class="form-control" 
										required 
										id = "localidadCliente"
									>
										<option>Seleccione...</option>
										{% for item in localidades %}
										<option value = "{{ item.localidadId }}">{{ item.nombre }}</option>
										{% endfor %}
									</select>
								</div>            
								<span class="help-block">Localidad residencia cliente</span>
							</div>
						</div>
						<br>
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Barrio residencia cliente</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-city"></span></span>
									<select 
										name="barrioCliente" 
										style="border-color: gray; height: 34px;" 
										class="form-control" 
										required 
										id = "barrioCliente"
									>
										<option>Seleccione...</option>
										{% for item in barrios %}
										<option value = "{{ item.barrioId }}">{{ item.nombre }}</option>
										{% endfor %}
									</select>
								</div>            
								<span class="help-block">Barrio residencia cliente</span>
							</div>
						</div>
						<br>
					</div>
					<div class="codigoVendedor col-md-6">						
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Franja entrega</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-hourglass-end"></span></span>
									<select name="franjaEntrega" style="border-color: gray; height: 34px;" class="form-control" required>
										<option value = "0">AM</option>
										<option value = "1">PM</option>
									</select>
								</div>            
								<span class="help-block">Franja entrega</span>
							</div>
						</div>
						<br>
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Fecha entrega</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-hourglass-end"></span></span>
									<input 
										type="date" 
										style="border-color: gray;" 
										class="form-control" 
										required 
										name="fechaEntrega" 
										value = "{{ fechaEntrega }}"
									>
								</div>            
								<span class="help-block">Fecha entrega</span>
							</div>
						</div>
						<br>
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Dirección entrega</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-map-marker-alt"></span></span>
									<input 
										type="text" 
										style="border-color: gray;" 
										class="form-control" 
										required 
										name="direccionEntrega" 										
										placeholder = "Dirección de entrega" 
										value = "{{ consulta.direccionEntrega }}"
									>
								</div>            
								<span class="help-block">Dirección entrega</span>
							</div>
						</div>
						<br>
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Convenio</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-handshake"></span></span>
									<select 
										name="convenio" 
										style="border-color: gray; height: 34px;" 
										class="form-control" 
										id = "convenio" 
										required 
										readonly 
										disabled
									>
										<option>Seleccione...</option>
										{% for item in convenios %}
										<option value = "{{ item.convenioId }}">{{ item.nombre }}</option>
										{% endfor %}
									</select>
								</div>            
								<span class="help-block">Convenio</span>
							</div>
						</div>
						<br>
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Observaciones</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-eye"></span></span>
									<textarea 
										type="text" 
										style="border-color: gray;" 
										class="form-control" 
										required 
										name="observaciones" 
										placeholder = "Observaciones">{{ consulta.observacion }}</textarea>
								</div>            
								<span class="help-block">Observaciones</span>
							</div>
						</div>						
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Placa</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-id-card-alt"></span></span>
									<input 
										type="text" maxlength = "6" 
										style="border-color: gray;" 
										class="form-control" 
										required 
										readonly
										name="placa" 
										placeholder = "AAA000" 
										value = "{{ consulta.placa }}" 
									>
								</div>            
								<span class="help-block">Placa</span>
							</div>
						</div>
						<br>
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Número de tags</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon" style="border-color: gray;"><span class="fa fa-tag"></span></span>
									<input 
										type="number" 
										style="border-color: gray;" 
										class="form-control" 
										required 
										readonly
										name="numeroTags" 
										placeholder = "Número de tags" 
										value = "{{ consulta.numTags }}" 
									>
								</div>            
								<span class="help-block">Número de tags</span>
							</div>
						</div>
						<br>						
					</div>							
				</div>
			</div>
			<button type="submit" class="btn btn-primary form-control">Reagendar Venta</button>                  
		</div>
		</form>	
	{% endif %}
</div>



<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>


<script>
	$(document).ready(function() {
		$('#formulario').hide();
		$('#btnGuardarTipificacion').hide();
		$('#formularioReagendamiento').hide();
		let ciudadResidencia = '{{ consulta.ciudadId }}';
		let localidadResidencia = '{{ consulta.localidadId }}';		
		let barrioCliente = '{{ consulta.barrioId }}';
		let franjaHoraria = '{{ consulta.franjaHoraria }}';

		$('#franjaEntrega').val(franjaHoraria);
		
		if(ciudadResidencia > 0){
			$('#ciudadResidencia').val(ciudadResidencia);
		}
		let convenio = '{{ consulta.convenioId }}';
		if(convenio > 0){
			$('#convenio').val(convenio);
		}	

		//Llena el select de localidad con las localidades de la ciudad en especifico
		if(ciudadResidencia > 0){			
			var url = "{{ url('GOPASSasesor/buscarLocalidad') }}";
			var parametros = {
				"ciudadResidencia" : ciudadResidencia,
				"traerLocalidad" : 'si'
			}			
			$.ajax({
				type: "POST",
				url: url,
				data: parametros,
				success: function(data){
					console.log(data);
					var body = JSON.parse(data);					
					var option = '<option value="">Seleccione..</option>';
					for (var i = 0; i < body.length; i++) {
						option+= '<option value="' + body[i]['localidadId'] + '">' + body[i]['nombre']+ '</option>';
					}
					$('#localidadCliente').html(option);
					$('#localidadCliente').val(localidadResidencia);
					
					// $('#localidadCliente').prop('required', true);
					// $('#barrioCliente').val(barrioResidencia);
				}				
			});	
		}

		// //Llena el select de barrios con los barrios de la localidad
		if(localidadResidencia > 0){
			var url = "{{ url('GOPASSasesor/buscarBarrio') }}";
			console.log(localidadResidencia);
			var parametros = {
				"localidadCliente" : localidadResidencia,
				"traerBarrios" : 'si'
			}
			console.log(parametros);
			$.ajax({
				type: "POST",
				url: url,
				data: parametros,
				success: function(data){					
					var body = JSON.parse(data);
					var option = '<option value="">Seleccione..</option>';
					for (var i = 0; i < body.length; i++) {
						option+= '<option value="' + body[i]['barrioId'] + '">' + body[i]['nombre']+ '</option>';
					}
					$('#barrioCliente').html(option);
					$('#barrioCliente').val(barrioCliente);
					// $('#localidadCliente').prop('required', true);
					// $('#barrioCliente').val(barrioResidencia);
				}				
			});			
		}
	});

	$('#ciudadResidencia').change(function(){
		let url = "{{ url('GOPASSasesor/buscarLocalidad') }}";
		let ciudadResidencia = $('#ciudadResidencia').val();
		let parametros = {
			"ciudadResidencia" : ciudadResidencia,
			"traerLocalidad" : 'si'
		}			
		$.ajax({
			type: "POST",
			url: url,
			data: parametros,
			success: function(data){
				var body = JSON.parse(data);					
				var option = '<option value="">Seleccione..</option>';
				for (var i = 0; i < body.length; i++) {
					option+= '<option value="' + body[i]['localidadId'] + '">' + body[i]['nombre']+ '</option>';
				}
				$('#localidadCliente').html(option);								
			}				
		});	
	})

	$('#localidadCliente').change(function(){
		let localidadResidencia = $('#localidadCliente').val();
		var url = "{{ url('GOPASSasesor/buscarBarrio') }}";		
		var parametros = {
			"localidadCliente" : localidadResidencia,
			"traerBarrios" : 'si'
		}
		console.log(parametros);
		$.ajax({
			type: "POST",
			url: url,
			data: parametros,
			success: function(data){					
				var body = JSON.parse(data);
				var option = '<option value="">Seleccione..</option>';
				for (var i = 0; i < body.length; i++) {
					option+= '<option value="' + body[i]['barrioId'] + '">' + body[i]['nombre']+ '</option>';
				}
				$('#barrioCliente').html(option);
			}				
		});			
	});

	$('#tipificacion').change(function() {
		let tipi =  $('#tipificacion').val();
		console.log(tipi);
		$('#tipificacionInput').val(tipi);
		if($('#tipificacion').val() == 215){
			$("#fechaReagendar").prop('required',false);
			$('#formulario').show("slow");
			$('#formularioReagendamiento').hide("slow");
			$('#btnGuardarTipificacion').hide("slow");			
			$('#indicacionesEntrega').attr('required', true);
			$('#convenio').attr('required', true);
			$('#formulario').find('input, select, textarea').attr('required', 'true');
		}
		else if($('#tipificacion').val() == 216){
			$('#formulario').hide("slow")
			$('#formularioReagendamiento').hide("slow")
			$('#btnGuardarTipificacion').show("slow")
			$("#fechaReagendar").prop('required',false);
		}
		else if($('#tipificacion').val() == 217){
			$('#formulario').hide("slow")
			$('#btnGuardarTipificacion').show("slow")
			$('#formularioReagendamiento').show("slow")
			$("#fechaReagendar").prop('required',true);
		}
		else if($('#tipificacion').val() == 218){
			$('#formulario').hide("slow")
			$('#formularioReagendamiento').hide("slow")
			$('#btnGuardarTipificacion').show("slow")
			$("#fechaReagendar").prop('required',false);
		}
		else if($('#tipificacion').val() == 219){
			$('#formulario').hide("slow")
			$('#formularioReagendamiento').hide("slow")
			$('#btnGuardarTipificacion').show("slow")
			$("#fechaReagendar").prop('required',false);
		}
		//btnGuardarTipificacion
	});

	//Valida número de tags
	$('#numeroTags').change(function(){
		var numeroTags=$('#numeroTags').val();
		var container = $(document.createElement('div'));
		//console.log("Entro tag");
		if (numeroTags > 10){
			alert("El número de tags no puede ser mayor a 10");
			document.getElementById("numeroTags").value = null;
		}
			
	});
	
	//Valida que el numero de placas sea igual al numero de tags
	$('#placa').change(function() {
		//console.log('{{ consulta.placa }}');
		var numeroPlaca = $('#placa').val();
		var numeroTags=$('#numeroTags').val();
		var placas=numeroPlaca.split(',');
		let expresionRegular = /^[a-zA-Z]{3}[0-9]{3}$/
		for (i = 0; i<placas.length; i++){
			let ppp =placas[i]
			if (expresionRegular.test(ppp)){
				 
				console.log("Entro");
			}else{
				alert("Alguna de las placas digitadas no es valida");
				break;
			}
		}

		if(placas.length > 10 || placas.length != numeroTags){
			alert("La cantidad de placas debe ser igual al número de tags");
			document.getElementById("placa").value = '{{ consulta.placa }}';
			
		}else{
			document.getElementById("placa").value = placas;
			//console.log($('#placa').val());
		}
		
	});

	$("#formularioVen").on('submit', function(evt){
		let numeroPlaca = $('#placa').val();
		let numeroTags=$('#numeroTags').val();
		let placas=numeroPlaca.split(',');
		let tipi =  $('#tipificacion').val();
		let expresionRegular = /^[a-zA-Z]{3}[0-9]{3}$/
		for (i = 0; i<placas.length; i++){
			let ppp =placas[i]
			if (expresionRegular.test(ppp)){
				 
				console.log("Entro");
			}else{
				alert("Alguna de las placas digitadas no es valida");
				evt.preventDefault();  
				break;
			}
		}

		if(placas.length > 10 || placas.length != numeroTags){
			alert("La cantidad de placas debe ser igual al número de tags");
			document.getElementById("placa").value = '{{ consulta.placa }}';
			evt.preventDefault();  
			
		}else{
			document.getElementById("placa").value = placas;
			//console.log($('#placa').val());
		}   
		console.log(tipi);
		$('#tipificacionInput').val(tipi);
 	});
</script>
