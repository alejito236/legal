<style>
	select{
		height: 33px!important;		
	}	
	label {display:block; width:x; height:y; text-align:left!important;}
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
	.form-control{
		border-color: gray;
	}
	table{
		text-transform: uppercase;
	}
	input{
		text-transform: uppercase;
	}
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<br><br><br>
<div class="wrapper ">
	<h2 class="h2" style="padding-left: 15px;">Postventa</h2>	
	<div class="row">
		<form action="{{url('GOPASSsac/postventa')}}"  method="POST" id="buscarForm">
			<div class="col-md-6">
				<div class="col-md-8">
					<input type="text" id="placa" placeholder="Placa" name="placa" class="form-control">
				</div>
				<div class="col-md-4">
					<button id="buscar" name="buscar" class="btn btn-primary form-control">Buscar</button>
				</div>
			</div>
		</form>
	</div>	

	{% if error is defined %}
		<br>
		<div class="col-md-12">
			<div class="alert alert-danger alert-dismissable" >
				<button aria-hidden="true" data-dismiss="alert" class="close" type="button">??</button>
				<i class="fas fa-exclamation-triangle"></i> La placa {{ error }} no se encuentra en la base de datos.
			</div>
		</div>
	{% endif %}	
	
	{% if exito is defined %}
	<br>
	<div class="alert alert-info alert-dismissable" id="exito">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">??</button>
        <i class="fas fa-check"></i> La placa {{exito}} fue gestionada exitosamente.
    </div>
	{% endif %}
	
	{% if yaGestionada is defined %}
	<br>
	<div class="alert alert-danger alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">??</button>
        <i class="fas fa-ban"></i> La placa {{yaGestionada}} ya fue gestionada o no corresponde a esta campa??a.
    </div>
	{% endif %}	

	<div class="col-md-12">			
		{% if resultadoPostventa is defined %}		
		{% for item in resultadoPostventa %}
		<form class="form-horizontal" method="POST" id="enviarForm" name="enviarForm" action="{{url('GOPASSsac/guardarPostventa')}}" style = "margin-top: 20px;">
			<div class="panel panel-default">
				<br>
				<div class="panel-body">                                                                        
					<div class="row">
						<input type="hidden" value="{{item.gestionId}}" name="gestionId">
						<div class="col-md-12">
							<h1><i class="fas fa-address-card"></i><b>{{item.nombrePersona}} {{item.apellidoPersona}}</b></h1>
						</div>
						<div class="col-md-12">
							<h3 class="text-uppercase"><b>{{item.tipoId}} {{item.cedulaPersona}}</b></h3>
						</div>						
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Placa</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-id-card-alt"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<input 
											type = "text"  
											class = "form-control"  
											name = "placaForm"
											id = "placaForm"
											placeholder = "AAA333"
											required
											maxlength = "6"
											value = "{{item.placa}}" 										
										>										
									</div>            
									<span class="">Placa</span>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Tag Asociado</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-id-card-alt"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<input 
											type = "number"  
											class = "form-control"  
											name = "tagAsociado"
											id = "tagAsociado"
											placeholder = "123456789" 
											readonly											
											value = "{{item.tagAsociado}}" 										
										>										
									</div>            
									<span class="">Tag Asociado</span>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Documento</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>										
										<input 
											type = "number"  
											class = "form-control"  
											name = "documento"
											id = "documento"
											placeholder = "123456"
											readonly
											value = "{{item.cedulaPersona}}"
										>									
									</div>            
									<span class="">Documento</span>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Celular</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<input 
											type = "number"  
											class = "form-control"  
											name = "celular"
											id = "celular"
											maxlength = "10"
											placeholder = "3333333333"
											readonly
											{% if item.celularLlamadas is not null %}
												value = "{{item.celularLlamadas}}"
											{% elseif item.celularWhatsapp is not null %}
												value = "{{item.celularWhatsapp}}"
											{% else %}
												value = "{{item.telefono}}"
											{% endif %}
										>									
									</div>            
									<span class="">Celular</span>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Activador</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fa fa-users"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<input 
											type = "text"  
											class = "form-control"  
											name = "activador"
											id = "activador"
											placeholder = "Nombre Asesor"
											readonly
											value = "{{item.nombreUser}} {{item.apellidoUser}}" 										
										>									
									</div>            
									<span class="">Activador</span>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Punto de Activaci??n</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-map-marker-alt"></span></span>										
										<input 
											type = "text"  
											class = "form-control"  
											name = "puntoActivacion"
											id = "puntoActivacion"
											placeholder = "Punto Activaci??n"
											readonly
											value = "{{item.nombrePuntoActivacion}}" 										
										>									
									</div>            
									<span class="">Punto de Activaci??n</span>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Fecha de Activaci??n</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}										
										
										{% if item.fechaActivacion is not null and item.fechaActivacion is not '0000-00-00' %}
											<input 
												type = "date"  
												class = "form-control"  
												name = "fechaActivacion"
												id = "fechaActivacion"												
												value = "{{item.fechaActivacion}}"											
												readonly												
											>	
										{% else %}	
											<input 
												type = "date"  
												class = "form-control"  
												name = "fechaActivacion"
												id = "fechaActivacion"												
												value = ""
												required								
											>							
										{% endif %}
									</div>            
									<span class="">Fecha de Activaci??n</span>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">??Se logro contacto?</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<select 
											class="form-control" 
											name="logroContacto" 
											id = "logroContacto"
											required 
										>
											<option value="">Seleccione...</option>
											<option value="1">Si</option>
											<option value="0">No</option>											
										</select>									
									</div>            
									<span class="">Contacto</span>
								</div>
							</div>
						</div>
						<div class="col-md-6 col-sm-12" id="divNoContacto">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Motivo</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>									
										<textarea
											type = "text"
											class = "form-control"
											name = "noContacto"
											id = "noContacto"
											placeholder = "Escriba aqu?? motivo de NO contacto"
										></textarea>		
									</div>            
									<span class="">Motivo</span>
								</div>
							</div>
						</div>						
					</div>
				</div>				
				<!-- Informaci??n venta -->
				<div class="panel-body" id="divInfoVenta" name="divInfoVenta">
					<hr>
					<div class="row">
						<h3 class="h3" style="padding-left: 15px;">Informaci??n Postventa</h3><br>
						<!-- 1 -->
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Tipo Membres??a</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>										
										{% if item.tipoMembresiaId is null or item.tipoMembresiaId is 1 %}
											<select 
												class="form-control" 
												name="tipoMembresia" 
												id = "tipoMembresia"
											>
												<option value="">Seleccione...</option>
												{% for membresia in membresias %}
													<option value="{{membresia.tipoMembresiaId}}">{{membresia.nombre}}</option>
												{% endfor %}
											</select>
										{% else %}
											<input 
												type = "text"
												class = "form-control"
												name = "tipoMembresia" 
												id = "tipoMembresia"
												value = "{{item.nombreMembresia}}"
												readonly
											>
										{% endif %}
									</div>            
									<span class="">Tipo Membres??a</span>
								</div>
							</div>
						</div>
						<!-- 2 -->						
						<!-- 3 -->
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Tipo Bono</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>
										{% if item.nombreBono is null or item.tipoBonoId is 1 %}
											<select 
												class="form-control" 
												name="tipoBono" 
												id = "tipoBono"
											>
												<option value="">Seleccione...</option>
												{% for bono in bonos %}
													<option value="{{bono.tipoBonoId}}">{{bono.nombre}}</option>
												{% endfor %}										
											</select>
										{% else %}
										<input 
											type = "text"
											class = "form-control"
											name = "tipoBono" 
											id = "tipoBono"
											value = "{{item.nombreBono}}"
											readonly
										>
										{% endif %}
									</div>            
									<span class="">Tipo Bono</span>
								</div>
							</div>
						</div>
						<!-- 4 -->
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">??Redimi?? Bono?</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<select 
											class="form-control" 
											name="redimeBono" 
											id = "redimeBono"
										>
											<option value="">Seleccione...</option>
											<option value="1">Si</option>
											<option value="0">No</option>											
										</select>									
									</div>            
									<span class="">Redimi?? Bono</span>
								</div>
							</div>
						</div>
						<!-- 5 -->
						<div class="col-md-6 col-sm-12" id="divFechaRedimeBono" name="divFechaRedimeBono">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Fecha en la que redimi?? el bono</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-id-card-alt"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<input 
											type = "date"  
											class = "form-control"  
											name = "fechaRedimeBono"
											id = "fechaRedimeBono"
											placeholder = "01/01/2000" 											
										/>										
									</div>            
									<span class="">Fecha del bono remedido</span>
								</div>
							</div>
						</div>
						<!-- 6 -->
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">??Recibio informaci??n bono?</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<select 
											class="form-control" 
											name="infoBono" 
											id = "infoBono"
										>
											<option value="">Seleccione...</option>
											<option value="1">Si</option>
											<option value="0">No</option>											
										</select>									
									</div>            
									<span class="">Informaci??n Bono</span>
								</div>
							</div>
						</div>
						<!-- 7 -->
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">??Conoce las membres??as? </label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<select 
											class="form-control" 
											name="conoceMembresias" 
											id = "conoceMembresias"
										>
											<option value="">Seleccione...</option>
											<option value="1">Si</option>
											<option value="0">No</option>											
										</select>									
									</div>            
									<span class="">??Conoce las membres??as?</span>
								</div>
							</div>
						</div>
						<!-- 8 -->
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">??Desea membres??a anual?</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<select 
											class="form-control" 
											name="adquiereMembresia" 
											id = "adquiereMembresia"
										>
											<option value="">Seleccione...</option>
											<option value="1">Si</option>
											<option value="0">No</option>											
										</select>									
									</div>            
									<span class="">Adquiere Membres??a</span>
								</div>
							</div>
						</div>
						<!-- 9 -->
						<div class="col-md-6 col-sm-12" id="divObservaciones" name="divObservaciones">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">??Por qu???</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>									
										<textarea
											type = "text"
											class = "form-control"
											name = "observacion"
											id = "observacion"
											placeholder = "Escriba comentarios del usuario del porque no"
										></textarea>		
									</div>            
									<span class="">??Por qu???</span>
								</div>
							</div>
						</div>
						<!-- 10 -->
						<div class="col-md-6 col-sm-12" id="divTipificacion" name="divTipificacion">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Tpificaci??n</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>									
										<select
											class = "form-control"
											name = "tipificacion"
											id = "tipificacion"																					
										>
											<option value="">Seleccione...</option>
											{% for tipificacion in tipificaciones %}
												{% if tipificacion.tipificacionId is 217 or tipificacion.tipificacionId is 219 %}
													<option value="{{tipificacion.tipificacionId}}">{{tipificacion.nombre}}</option>
												{% else %}
													<option hidden value="{{tipificacion.tipificacionId}}">{{tipificacion.nombre}}</option>
												{% endif %}
												
											{% endfor %}
										</select>		
									</div>            
									<span class="">Tipificaci??n</span>
								</div>
							</div>
						</div>
						<!-- 11 -->
						<div class="col-md-6 col-sm-12" id="divObservaciones" name="divObservaciones">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">??Desea evaluar experiencia con Gopass?</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>									
										<select
											class = "form-control"
											name = "expGopass"
											id = "expGopass"
										>
											<option value="">Seleccione...</option>
											<option value="1">Si</option>
											<option value="0">No</option>
										</select>		
									</div>            
									<span class="">Observaciones</span>
								</div>
							</div>
						</div>
						
					</div>					
				</div>				
				<!-- Experiencia Gopass -->
				<div class="panel-body" id="divExpGopass" name="divExpGopass">
					<hr>
					<div class="row" >
						<h3 class="h3" style="padding-left: 15px;">Encuesta Experiencia Gopass</h3><br>
						<!-- 1 -->
						<div class="col-md-12 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-8 control-label">??La presentaci??n personal/apariencia del representante de Gopass era pulcra, adecuada?</label>
								<div class="col-md-4 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>									
										<select 
											class="form-control" 
											name="calificacionPresentacionPersonal" 
											id = "calificacionPresentacionPersonal"
										>
											<option value="">Seleccione...</option>
											<option value="1">1</option>
											<option value="2">2</option>										
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>											
										</select>					
									</div>
								</div>
							</div>
						</div>
						<!-- 2 -->
						<div class="col-md-12 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-8 control-label">??La informaci??n sobre el servicio, beneficios y costos fue clara?</label>
								<div class="col-md-4 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>									
										<select 
											class="form-control" 
											name="calificacionInfoClara" 
											id = "calificacionInfoClara"
										>
											<option value="">Seleccione...</option>
											<option value="1">1</option>
											<option value="2">2</option>										
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>											
										</select>					
									</div>            									
								</div>
							</div>
						</div>
						<!-- 3 -->
						<div class="col-md-12 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-8 control-label">El colaborador acompa??o el proceso de vinculaci??n e instalaci??n del tag</label>
								<div class="col-md-4 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>									
										<select 
											class="form-control" 
											name="calificacionAcompanamiento" 
											id = "calificacionAcompanamiento"
										>
											<option value="">Seleccione...</option>
											<option value="1">1</option>
											<option value="2">2</option>										
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>											
										</select>					
									</div>
								</div>
							</div>
						</div>
						<!-- 4 -->
						<div class="col-md-12 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-8 control-label">??El tiempo que aguardo para obtener el servicio fue satisfactorio?</label>
								<div class="col-md-4 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>									
										<select 
											class="form-control" 
											name="calificacionTiempoEspera" 
											id = "calificacionTiempoEspera"
										>
											<option value="">Seleccione...</option>
											<option value="1">1</option>
											<option value="2">2</option>										
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>											
										</select>					
									</div>
								</div>
							</div>
						</div>
						<!-- 5 -->
						<div class="col-md-12 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-8 control-label">??El comportamiento del colaborador Gopass le inspiro confianza y seguridad?</label>
								<div class="col-md-4 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>									
										<select 
											class="form-control" 
											name="calificacionComportamiento" 
											id = "calificacionComportamiento"
										>
											<option value="">Seleccione...</option>
											<option value="1">1</option>
											<option value="2">2</option>										
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>											
										</select>					
									</div>
								</div>
							</div>
						</div>
						<!-- 6 -->
						<div class="col-md-12 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-8 control-label">??El colaborador Gopass demuestro amabilidad y buen trato?</label>
								<div class="col-md-4 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-id-card"></span></span>									
										<select 
											class="form-control" 
											name="calificacionAmabilidad" 
											id = "calificacionAmabilidad"
										>
											<option value="">Seleccione...</option>
											<option value="1">1</option>
											<option value="2">2</option>										
											<option value="3">3</option>
											<option value="4">4</option>
											<option value="5">5</option>											
										</select>					
									</div>            									
								</div>
							</div>
						</div>
					</div>
				</div>				
				<button type="submit" id="btnEnviar" name="btnEnviar"  class="btn btn-primary form-control">Reagendar Venta</button>
			</div>
		</form>	
		{% endfor %}
		{% endif %}
	</div>
</div>

<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script>
	$(document).ready(function (){
		$('#divInfoVenta').hide();
		$('#divExpGopass').hide();
		$('#divObservaciones').hide();
		$('#divTipificacion').hide();
		$('#divNoContacto').hide();
		$('#divFechaRedimeBono').hide();		
	});

	$('#placaForm').change(function() {
		var numeroPlaca = $('#placaForm').val();
		let expresionRegular = /^[a-zA-Z]{3}[0-9]{3}$/;
		if (expresionRegular.test(numeroPlaca)){
			console.log("Entro");
		}else{
			alert("La placa digitada no es valida");
			$('#placaForm').val('');
		}
	});

	$('#logroContacto').change(() => {
		let contacto = $('#logroContacto').val();		
		$('#observacion').val('');
		document.querySelector('#observacion').required = false;
		expGopass
		if(contacto == 1){
			$('#divNoContacto').hide();
			$('#divInfoVenta').show();
			document.querySelector('#noContacto').required = false;
			document.querySelector('#tipoMembresia').required = true;						
			document.querySelector('#tipoBono').required = true;
			document.querySelector('#redimeBono').required = true;		
			document.querySelector('#infoBono').required = true;			
			document.querySelector('#conoceMembresias').required = true;
			document.querySelector('#adquiereMembresia').required = true;
			document.querySelector('#expGopass').required = true;		
			document.querySelector('#fechaRedimeBono').required = true;				
			$('#noContacto').val('');
			$('#tipificacion').val(null);			
		}else{
			$('#divNoContacto').show();
			$('#divInfoVenta').hide();
			$('#tipoMembresia').val(null);
			// $('#numVehiculo').val('');
			$('#tipoBono').val(null);
			$('#redimeBono').val(null);
			$('#fechaRedimeBono').val(null);
			$('#infoBono').val(null);
			$('#conoceMembresias').val(null);
			$('#adquiereMembresia').val(null);
			document.querySelector('#noContacto').required = true;
			document.querySelector('#tipoMembresia').required = false;
			document.querySelector('#tipoBono').required = false;
			document.querySelector('#redimeBono').required = false;
			document.querySelector('#fechaRedimeBono').required = false;
			document.querySelector('#infoBono').required = false;
			document.querySelector('#conoceMembresias').required = false;
			document.querySelector('#adquiereMembresia').required = false;			
			//document.querySelector('#numVehiculo').required = false;
			$('#divExpGopass').hide();
			document.querySelector('#calificacionPresentacionPersonal').required = false;
			document.querySelector('#calificacionInfoClara').required = false;
			document.querySelector('#calificacionAcompanamiento').required = false;
			document.querySelector('#calificacionTiempoEspera').required = false;
			document.querySelector('#calificacionComportamiento').required = false;
			document.querySelector('#calificacionAmabilidad').required = false;
			document.querySelector('#expGopass').required = false;
			$('#expGopass').val(null);
			$('#tipificacion').val(null);
		}
	});

	$('#adquiereMembresia').change(()=>{
		let membresia = $('#adquiereMembresia').val();
		if(membresia == 1){
			$('#divObservaciones').hide();
			$('#divTipificacion').hide();
			document.querySelector('#tipificacion').required = false;
			document.querySelector('#observacion').required = false;
			$('#observacion').val('');
			$('#tipificacion').val(null);
			$('#tipificacion').val(null);
		}else{
			$('#divObservaciones').show();
			$('#divTipificacion').show();
			$('#tipificacion').val(null);		
			document.querySelector('#observacion').required = true;
			document.querySelector('#tipificacion').required = true;
		}
	});

	$('#expGopass').change(()=>{
		let experiencia = $('#expGopass').val();
		if(experiencia == 1){
			$('#divExpGopass').show();
			document.querySelector('#calificacionPresentacionPersonal').required = true;
			document.querySelector('#calificacionInfoClara').required = true;
			document.querySelector('#calificacionAcompanamiento').required = true;
			document.querySelector('#calificacionTiempoEspera').required = true;
			document.querySelector('#calificacionComportamiento').required = true;
			document.querySelector('#calificacionAmabilidad').required = true;			
		}else{
			$('#divExpGopass').hide();
			document.querySelector('#calificacionPresentacionPersonal').required = false;
			document.querySelector('#calificacionInfoClara').required = false;
			document.querySelector('#calificacionAcompanamiento').required = false;
			document.querySelector('#calificacionTiempoEspera').required = false;
			document.querySelector('#calificacionComportamiento').required = false;
			document.querySelector('#calificacionAmabilidad').required = false;				
		}
	});

	$('#redimeBono').change(()=>{
		let redimeBono = $('#redimeBono').val();
		if(redimeBono == 1){
			$('#divFechaRedimeBono').show();
			document.querySelector('#fechaRedimeBono').required = true;				
		}else{
			$('#divFechaRedimeBono').hide();
			document.querySelector('#fechaRedimeBono').required = false;	
			$('#fechaRedimeBono').val(null);
		}
	})

	$("#enviarForm").on('submit', function(evt){
		let contacto = $('#logroContacto').val();
		let membresia = $('#adquiereMembresia').val();
		let tipificacion = $('#tipificacion').val();		
		if(contacto == 0){
			$('#tipificacion').val(216);
		}else{
			if(membresia == 1){
				$('#tipificacion').val(200);
			}else{
				if(tipificacion == null){
					alert("Por favor seleccione una tipificaci??n valida")
					evt.preventDefault();
				}
			}
		}
		console.log('tipificacion',$('#tipificacion').val());
		

			
			
		
 	});
	

	

</script>
