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
	{% if error is defined %}
		<br>
		<div class="col-md-12">
			<div class="alert alert-danger alert-dismissable" >
				<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
				<i class="fas fa-exclamation-triangle"></i> La placa {{ error }} no se encuentra en la base de datos.
			</div>
		</div>
	{% endif %}
	{% if error2 is defined %}
		<br>
		<div class="col-md-12">
			<div class="alert alert-danger alert-dismissable" >
				<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
				<i class="fas fa-exclamation-triangle"></i> La placa {{ error2 }} no se pudo gestionar correctamente.
			</div>
		</div>
	{% endif %}	
	
	{% if exito is defined %}
	<br>
	<div class="alert alert-info alert-dismissable" id="exito">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> La placa {{exito}} fue reagendada con exito en la Base de Datos.
    </div>
	{% endif %}	
	{% if errorTipificacion is defined %}
	<br>
	<div class="alert alert-danger alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-ban"></i> {{errorTipificacion}}
    </div>
	{% endif %}
	
	<div class="row">
		<form action="{{url('GOPASSsac/index')}}"  method="POST">
			<div class="col-md-6">
				<div class="col-md-8">
					<input type="text" maxlength="6" id="placa" placeholder="Placa" name="placa" class="form-control" required>
				</div>
				<div class="col-md-4">
					<button id="btnBuscar" name="btnBuscar" class="btn btn-primary form-control">Buscar</button>
				</div>
			</div>
		</form>
	</div>	
	
	<div class="col-md-12">
	{% if historial is defined %}
			<div class="col-md-12" style = "margin-top: 20px;">
				<form action="{{url('GOPASSsac/index')}}" method="POST">
					<input type="hidden" value = "{{ placa }}" name = "placaGestionar" name = "placaGestionar">
					<button class = "btn btn-success" id="btnGestionar" name="btnGestionar">Gestionar</button>
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
							{# <th>Numero Tags</th> #}
							<th>Tipificacion</th>
							<th>Fecha Entrega</th>
							<th>Fecha Gestión</th>
							<!-- <th>Ver Informacion</th> -->
						</thead>
						<tbody>
						{% for item in historial %}
					
						<tr>
							<td>{{item.cedulaPersona}}</td>
							<td>{{item.nombrePersona}}</td>
							<td>{{item.direccionEntrega}}</td>
							<td>{{item.telefono}}</td>
							{% if item.celularLlamadas is not  null and item.celularLlamadas is not 0 %}
									<td>{{item.celularLlamadas}}</td>
								{% elseif item.celularWhatsapp is not null or item.celularWhatsapp is not 0 %}
									<td>{{item.celularWhatsapp}}</td>
								{% else %}
									<td>No tiene celular</td>
								{% endif %}				                    										
							<td>{{item.observacion}}</td>
							<td>{{item.placa}}</td>							
							{# <td>{{item.numTags}}</td> #}
							<td>{{item.nombreTipificacion}}</td>
							<td>{{item.fechaEntrega}}</td>
							<td>{{item.fechaGestion}}</td>
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
	<form class="form-horizontal" method="POST" action="{{url('GOPASSsac/reagendar')}}" style = "margin-top: 20px;">
		<input type="hidden" name="gestionId" id="gestionId" value = "{{ consulta.gestionId }}">
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
										name="documentoCliente" 
										placeholder = "Documento del cliente" 
										value = "{{ consulta.cedulaPersona }}"
										required
									>
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
										name="nombreCliente" 
										placeholder = "Nombre del cliente" 
										value = "{{ consulta.nombrePersona }}"
										required
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
										name="direccionCliente" 
										placeholder = "Dirección del cliente" 
										value = "{{ consulta.direccionCasa }}"
										required
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
										name="telefonoCliente" 
										placeholder = "Telefono del cliente"
										value = "{{ consulta.telefono }}"
										required
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
										name="celularCliente" 
										placeholder = "Celular del cliente" 
										value = "{{ consulta.celularLlamadas }}"
										required
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
										id = "ciudadResidencia"
										required
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
										id = "localidadCliente"
										required
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
						<!-- Pendienre revisar -->
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Barrio residencia cliente</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-city"></span></span>
									<select 
										name="barrioCliente" 
										style="border-color: gray; height: 34px;" 
										class="form-control" 
										id = "barrioCliente"
										required
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
						<!-- Pendiente revisar -->
						<div class="codigoVendedor form-group">                                        
							<label class="col-md-3 control-label">Franja entrega</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-hourglass-end"></span></span>
									<select 
										name="franjaEntrega" 
										style="border-color: gray; height: 34px;" 
										class="form-control" 
										required
									>
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
										name="fechaEntrega" 
										value = "{{ fechaEntrega }}"
										required
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
										name="direccionEntrega" 										
										placeholder = "Dirección de entrega" 
										value = "{{ consulta.direccionEntrega }}"
										required
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
							<label class="col-md-3 control-label">Placa</label>
							<div class="col-md-9 col-xs-12">
								<div class="input-group">
									<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-id-card-alt"></span></span>
									<input 
										type="text" 
										maxlength = "6" 
										style="border-color: gray;" 
										class="form-control"  
										name="placa" 
										placeholder = "AAA000" 
										value = "{{ consulta.placa }}" 
										readonly
										required
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
										name="numeroTags" 
										placeholder = "Número de tags" 
										value = "{{ consulta.numTags }}" 
										readonly
										required
									>
								</div>            
								<span class="help-block">Número de tags</span>
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
										name="observaciones" 
										placeholder = "Observaciones"
										required
									>{{ consulta.observacion }}</textarea>
								</div>            
								<span class="help-block">Observaciones</span>
							</div>
						</div>												
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
	$(document).ready(function (){
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
		console.log("Entro ciudad",ciudadResidencia);

		//Llena el select de localidad con las localidades de la ciudad en especifico
		if(ciudadResidencia > 0){			
			var url = "{{ url('GOPASSsac/buscarLocalidad') }}";
			var parametros = {
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
					$('#localidadCliente').val(localidadResidencia);
					
					// $('#localidadCliente').prop('required', true);
					// $('#barrioCliente').val(barrioResidencia);
				}				
			});	
		}

		//Llena el select de barrios con los barrios de la localidad
		if(localidadResidencia > 0){
			var url = "{{ url('GOPASSsac/buscarBarrio') }}";
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
		let url = "{{ url('GOPASSsac/buscarLocalidad') }}";
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
		var url = "{{ url('GOPASSsac/buscarBarrio') }}";		
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

	 $("#formularioVen").on('submit', function(evt){
		 var numeroPlaca = $('#placa').val();
		var numeroTags=$('#numeroTags').val();
		var placas=numeroPlaca.split(',');
		//console.log("Entro");
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
 	});
</script>
