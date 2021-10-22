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
	input{
		text-transform: uppercase;
	}
	</style>
<div class="wrapper ">
	<div class="page-content">
			{% if exito is defined %}
			<div class="col-md-12">
				<div class="alert alert-success" role="alert">
					<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<strong>¡Hecho!</strong> se registraron la siguientes placas {% for item in exito %} {{item}} {% endfor %} 
					
						
				</div>
			</div>
			{% endif %}
			{% if error is defined %}
			<div class="col-md-12">
				<div class="alert alert-danger" role="alert">
					<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
					<strong>¡Ojo!</strong> {{error}}
				</div>
			</div>
			{% endif %}			
			  <!-- PAGE CONTENT WRAPPER -->
			  <div class="page-content-wrap">					
				<div class="row">
					<div class="col-md-12">						
						<form class="form-horizontal" method="POST" action="{{url('GOPASSasesor/guardarfuera')}}" name="formularioVen" id="formularioVen">
						<div class="panel panel-default">							
							<br><br><br><br>
							<form>
							<div class="panel-body">                                                                        
								<div class="row">									
									<div class="col-md-12">
										<div class="form-group text-center">
											<h1><b>Ingresar agendamiento</b></h1>
											<hr>
										</div>
										<br>
									</div>
									<div class="col-md-6">
										<div class="form-group">                                        
											<label class="col-md-3 control-label">Tipo Identificacion</label>
											<div class="col-md-9 col-xs-12">
												<div class="input-group">
													<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>
													<select 
														name="tipoId" 
														style="border-color: gray; height: 34px;" 
														class="form-control" 
														required 
														id = "tipoId"
													>
														<option value=""> Seleccione...</option>
														{% for item in tipoId %}
															<option value="{{item.tipoId}}"> {{item.nombre}} </option>
														{% endfor %}
													</select>
												</div>            
												<span class="help-block">Tipo Identificación</span>
											</div>
										</div>
										<br>
										<div class="form-group">                                        
											<label class="col-md-3 control-label">Documento cliente</label>
											<div class="col-md-9 col-xs-12">
												<div class="input-group">
													<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>
													<input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente">
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
													<input type="text"  style="border-color: gray;" class="form-control" required name="nombreCliente" placeholder = "Nombre del cliente">
												</div>            
												<span class="help-block">Nombre cliente</span>
											</div>
										</div>
										<br>
										<div class="codigoVendedor form-group">                                        
											<label class="col-md-3 control-label">Apellido cliente</label>
											<div class="col-md-9 col-xs-12">
												<div class="input-group">
													<span class="input-group-addon"  style="border-color: gray;"><span class="fa fa-users"></span></span>
													<input 
														type="text"  
														style="border-color: gray;" 
														class="form-control" 
														required 
														name="apellidoCliente" 
														id="apellidoCliente" 
														placeholder = "Apellido del cliente">
												</div>            
												<span class="help-block">Apellido cliente</span>
											</div>
										</div>
										<br>
										<div class="codigoVendedor form-group">                                        
											<label class="col-md-3 control-label">Dirección cliente</label>
											<div class="col-md-9 col-xs-12">
												<div class="input-group">
													<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-map-marker-alt"></span></span>
													<input type="text"  style="border-color: gray;" class="form-control" required name="direccionCliente" placeholder = "Dirección del cliente">
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
														maxlength = "7"
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
														id="celularCliente" 
														placeholder = "Celular del cliente"
														maxlength = "10"
													>
												</div>            
												<span class="help-block">Celular cliente</span>
											</div>
										</div>
										<div class="codigoVendedor form-group">                                        
											<label class="col-md-3 control-label">Celular para whatsapp</label>
											<div class="col-md-9 col-xs-12">
												<div class="input-group">
													<span class="input-group-addon"  style="border-color: gray;"><span class="fa fa-phone"></span></span>
													<input 
														type="number"  
														style="border-color: gray;" 
														class="form-control" 
														name="celularWhatsapp" 
														id="celularWhatsapp" 
														placeholder = "Celular para whatsapp"
														maxlength = "10"
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
													<input type="date" style="border-color: gray;" class="form-control" required name="fechaEntrega">
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
													<input type="text" style="border-color: gray;" class="form-control" required name="direccionEntrega" placeholder = "Dirección de entrega">
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
													<select name="convenio" style="border-color: gray; height: 34px;" class="form-control" required>
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
													<textarea type="text" style="border-color: gray;" class="form-control" required name="observaciones" placeholder = "Observaciones"></textarea>
												</div>            
												<span class="help-block">Observaciones</span>
											</div>
										</div>										
										<div class="codigoVendedor form-group">                                        
											<label class="col-md-3 control-label">Número de tags</label>
											<div class="col-md-9 col-xs-12">
												<div class="input-group">
													<span class="input-group-addon" style="border-color: gray;"><span class="fa fa-tag"></span></span>
													<input type="number" style="border-color: gray;" class="form-control" required name="numeroTags" id="numeroTags" placeholder = "Número de tags">
												</div>            
												<span class="help-block">Número de tags</span>
											</div>
										</div>										
										<div class="codigoVendedor form-group">                                        
											<label class="col-md-3 control-label">Placa</label>
											<div class="col-md-9 col-xs-12">
												<div class="input-group">
													<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-id-card-alt"></span></span>
													<input type="text" maxlength = "69" style="border-color: gray;" class="form-control" required name="placa" id="placa" placeholder = "AAA000">													
												</div>            
												<b><span>Para ingresar varias placas separe por "," sin espacios</span> <br>
													<span>Ej: AAA111,AAA222</span></b>
											</div>
										</div>
										<br>										
									</div>
								</div>
							</div>
							<button type="submit" class="btn btn-primary form-control">Ingresar Venta</button>                  
						</div>
						</form>
					</div>
				</div>                    
				
			</div>
			<!-- END PAGE CONTENT WRAPPER -->                                                
		</div>         
		<!-- END PAGE CONTENT -->
	</div>
	<!-- END PAGE CONTAINER -->
		</div>
	</div>   
</div>     
	<script>
	
	

	
	$('#ciudadResidencia').change(function(){
		console.log("Entro");
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
				console.log(data);
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
		console.log("Entro");
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
				console.log(data);
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
		let numeroPlaca = $('#placa').val();
		let numeroTags = $('#numeroTags').val();
		let placas = numeroPlaca.split(',');
		//console.log("Entro");
		let expresionRegular = /^[a-zA-Z]{3}[0-9]{3}$/
		for (i = 0; i<placas.length; i++){
			let ppp = placas[i]
			if (expresionRegular.test(ppp)){				 
				console.log("Entro");
			}else{
				alert("Alguna de las placas digitadas no es valida");
				evt.preventDefault();  
				break;
			}
		}
		if((lacas.length > 10) || (placas.length != numeroTags)){
			alert("La cantidad de placas debe ser igual al número de tags");
			document.getElementById("placa").value = '';			
			evt.preventDefault();			
		}else{
			document.getElementById("placa").value = placas;
		}
 	});		
</script>
