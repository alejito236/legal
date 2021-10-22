<style>
	p{display: block;font-size: 1.3em;width: 300px;margin: 0 0 0 -28%;padding: 2px 0 2px 80px;}
	.confirmacion{background:#C6FFD5;border:1px solid green;}
	.negacion{background:#ffcccc;border:1px solid red}
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
	</style>
	<div class="page-content-center">
		<br><br>
			{% if exito is defined %}
			<div class="col-md-12">
				<div class="alert alert-info" role="alert">
					<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<strong>¡Hecho!</strong> Se ha gestionado correctamente.
				</div>
			</div>
			{% endif %}
			{% if gestionExitosa is defined %}
			<div class="col-md-12">
				<div class="alert alert-success" role="alert">
					<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<strong>¡Hecho!</strong> Se gestionó la placa {{ gestionExitosa }} correctamente.
				</div>
			</div>
			{% endif %}

			{% if error is defined %}
			<div class="col-md-12">
				<div class="alert alert-danger" role="alert">
					<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<strong>Error!</strong> {{ error }} .
				</div>
			</div>
			{% endif %}

			{% if ventaCreada is defined %}
			<div class="col-md-12">
				<div class="alert alert-success" role="alert">
					<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<strong>¡Hecho!</strong> Se ha registrado la venta a la placa {{ ventaCreada }}.
				</div>
			</div>
			{% endif %}

			{% if errorCon is defined %}
			<div class="col-md-12">
				<div class="alert alert-danger" role="alert">
					<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<strong>¡Ojo!</strong> {{errorCon}}
				</div>
			</div>
			{% endif %}			
			<br>
		<div class="wrapper ">
		<!-- <div class="row"> -->
			<div class="col-lg-4">
				<div class="ibox">
					<div class="ibox-content">
						<h5 class="m-b-md">Ventas</h5>
						<h2 class="text-navy">
							<i class="fa fa-play fa-rotate-270"></i> {% for item in cantidad %} {{item.cantidad}} {% endfor %}
							
						</h2>
					</div>
				</div>
			</div>
		<!-- </div> -->
		<!-- PAGE CONTENT WRAPPER -->
		<div class="page-content-wrap-center">
			<div class="row">
				<div class="col-md-12 " >
					<form class="form-group-center" method="POST" action="{{url('GOPASSasesor/index')}}">
						<div class="row-center">
							<div class="col-4 col-md-4">
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;">
										<span class="fas fa-id-card-alt"></span>
									</span>
									<input 
										type="text" 
										maxlength = "69"  
										style="border-color: gray;" 
										class="form-control" 										
										name="placaBuscar" 
										id="placaBuscar" 
										placeholder = "Placa"
										>
										

								</div>
								<span class="help-block">Placa</span>
							</div>
							<div class="col-3 col-md-3">
								{# <label class="col-md-1 control-label text-center">Placa:</label> #}
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;">
										<span class="fas fa-id-card-alt"></span>
									</span>
									<input 
										type="text" 
										style="border-color: gray;" 
										class="form-control" 										
										name="cedulaBuscar" 
										id="cedulaBuscar" 
										placeholder = "Cédula">

								</div>
								<span class="help-block">Cédula</span>
							</div>
							<div class="col-3 col-md-3">
								{# <label class="col-md-1 control-label text-center">Placa:</label> #}
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;">
										<span class="fas fa-id-card-alt"></span>
									</span>
									<input 
										type="text" 
										maxlength = "10"  
										style="border-color: gray;" 
										class="form-control" 										
										name="telefonoBuscar" 
										id="telefonoBuscar" 
										placeholder = "Teléfono">

								</div>
								<span class="help-block">Teléfono</span>
							</div>
							<div class = "col-md-1">
								<button type="submit" class="btn btn-primary form-control"><i class="fas fa-search"></i></button>
							</div>
						</div>
					</form>
				</div>
			</div>
			{% if (telConsulta is defined) or (cedulaConsulta is defined) %}
				<table class="table table-striped table-bordered table-hover oTables-example" >
					<thead>
						<tr>                
							<th>Nombre</th>
							<th>Placa</th>
							<th>Cédula</th>
							<th>Teléfono</th>  
							<th>Celular</th>                
							<th>Gestionar</th>						
						</tr>
					</thead>
					<tbody>
					
					{% for item in consulta %}
						<tr class="gradeX">
							<form class="form-group-center" method="POST" action="{{url('GOPASSasesor/index')}}">
								<input 
									type="hidden" 
									name="placaBuscar" 
									id="placaBuscar"
									value="{{ item.placa }}"
								>
								<td> {{ item.nombrePersona }} </td>
								<td uppercase > {{ item.placa }} </td>
								<td> {{ item.cedulaPersona }} </td>
								<td>{{item.telefono}}</td>								
								{% if item.celularLlamadas is not  null and item.celularLlamadas is not 0 %}
									<td>{{item.celularLlamadas}}</td>
								{% elseif item.celularWhatsapp is not null or item.celularWhatsapp is not 0 %}
									<td>{{item.celularWhatsapp}}</td>
								{% else %}
									<td>No tiene celular</td>
								{% endif %}				                    
								<td class="text-center">
									<button type="submit" class="form-control btn btn-info">Gestionar</button>
								</td>
							</form>                        
						</tr>
					{% endfor %}
					
					
				</table>
		{% elseif consulta is defined %}		
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
				<br>
				<div class="panel-body">
					<form class="row" method="POST" action="{{url('GOPASSasesor/guardar')}}" id="" name="">
						<div class="col-md-12">
							<div class="form-group">                                        
								<label class="col-md-4 control-label text-uppercase">
									{{ consulta.nombrePersona }}
									<br>
									C.C: {{ consulta.cedulaPersona }}
								</label>
								<input type="hidden" name="documentoClienteTipi" value = "{{ consulta.cedulaPersona }}">
								<input type="hidden" name="placaTipi" value = "{{ consulta.placa }}">
								<input type="hidden" name="gestionId" value = "{{ consulta.gestionId }}">
								<div class="col-md-6 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-exchange-alt"></span></span>
										<select 
											style="border-color: gray; height: 34px;" 
											name="tipificacion" 
											class = "form-control" 
											id="tipificacion"  
											required
										>
											<option value="">Seleccione una tipificación</option>
											{% for item in mastertipificacion %}
												<option value = "{{ item.tipificacionId }}">{{ item.nombre }}</option>
											{% endfor %}
										</select>
									</div>            
									<span class="help-block">Tipificación</span>
								</div>
								<div class="col-md-2" id = "btnGuardarTipificacion">
									<button class = "btn btn-primary">Guardar</button>
								</div>
							</div>
							<br>
						</div>
						<div class="col-md-12" style = "padding-top: 30px;" id = "formularioReagendamiento">
							<div class="form-group">                                        
								<label class="col-md-4 control-label text-uppercase">
									Fecha volver a llamar:
								</label>
								<div class="col-md-6 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-exchange-alt"></span></span>
										<input type="date" class = "form-control" style="border-color: gray; height: 34px;" name="fechaReagendar" id = "fechaReagendar">
									</div>            
									<span class="help-block">Fecha volver a llamar</span>
								</div>
							</div>
							
							<br>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-12" id = "formulario" name = "formulario">
				<form class="form-horizontal" method="POST" action="{{url('GOPASSasesor/guardar')}}" name="formularioVen" id="formularioVen">
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
											>
											<input type="hidden" name="tipificacionInput" id = "tipificacionInput">
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
												value = "{{ fechaEntrega }}">
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
												value = "{{ consulta.direccionEntrega }}">
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
									<label class="col-md-3 control-label">Número de tags</label>
									<div class="col-md-9 col-xs-12">
										<div class="input-group">
											<span class="input-group-addon" style="border-color: gray;"><span class="fa fa-tag"></span></span>
											<input 
												type="number" 
												style="border-color: gray;" 
												class="form-control" 
												required 
												name="numeroTags" 
												id='numeroTags' 
												placeholder = "Número de tags" 
												value = "{{ consulta.numTags }}"
											>
										</div>            
										<span class="help-block">Número de tags</span>
									</div>
								</div>
								<br>
								<div class="codigoVendedor form-group">                                        
									<label class="col-md-3 control-label">Placa</label>
									<div class="col-md-9 col-xs-12">
										<div class="input-group">
											<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-id-card-alt"></span></span>
											<input 
											type="text" 
											maxlength = "69" 
											style="border-color: gray;" 
											class="form-control" 
											required 
											name="placa" 
											id="placa" 
											placeholder = "AAA000" 
											value = "{{ consulta.placa }}"
										>
										</div>            
										<b><span>Para ingresar varias placas separe por "," sin espacios</span> <br>
										<span>Ej: AAA111,AAA222</span></b>
									</div>
								</div>
								<br>
								<!-- <input type="number" class="form-control" required > -->
								<p name="tag2"></p>
							</div>							
						</div>
					</div>
					<button type="submit" class="btn btn-primary form-control" name="btnVenta" id="btnVenta" >Ingresar Venta</button>                  
				</div>
				</form>
			</div>
		</div>
		{% endif %} 
		                                                                
</div>     
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