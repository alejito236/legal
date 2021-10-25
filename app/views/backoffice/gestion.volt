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
	input,select,textarea{
		border: 1px solid gray!important;
		padding:0px;
		text-transform: capitalize;
	}	
	table{
		text-transform: uppercase;				
		text-align: center;
	}	
	.container-ciudad { 
		border:2px solid #ccc; 		
		overflow-y: scroll;
		display: block;		
		height: 100%;
		width:100%;
		padding-bottom:10px;
	}
	.container{					
		
		height: 120px;
		padding-left:0;
		padding-right:0;
		padding-bottom:10px;
		
	}
	.ciudad{
		border:0.5px solid #4F7F20; 
		display: block; 
		width: 100%; 
		background-color: #4F7F20; 
		color:#f2f2f2;
	}

	#map {
		height: 500px;
		width: 100%;
	}

</style>
<!-- Almacena cache para evitar reenvio de formulario y mostrar la Información anterio -->
{# <?php  
  header("Cache-Control: max-age=2592000"); //30days (60sec * 60min * 24hours * 30days)
?> #}
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<br>
<div class="wrapper ">		
	{% if error is defined %}
		<br>
		<div class="col-md-12">
			<div class="alert alert-danger alert-dismissable" >
				<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
				<i class="fas fa-exclamation-triangle"></i> La placa {{ error }} no se encuentra en la base de datos.
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

	<div class="row">		
		<form class="form-horizontal" method="POST" id="enviarForm" name="enviarForm" action="{{url('backoffice/guardarGestion')}}" style = "margin-top: 20px;">
			<div class="panel panel-default">
				<br>
				<!-- Información Cliente -->
				<div class="panel-body">                                                                        
					<div class="row">
						<h3 class="h3" style="padding-left: 15px;">Información Cliente</h3><br>
						<input type="hidden" value="{{getGestionBack.tipoventa_id}}" name="tipoventa_id">
						<input type="hidden" value="{{getGestionBack.ventaid}}" name="ventaid">
						<input type="hidden" value="{{getGestionBack.gestionexpedidorid}}" name="gestionexpedidorid">
						<input type="hidden" value="{{getGestionBack.gestionAsignacionid}}" name="gestionAsignacionid">
						<input type="hidden" value="{{getGestionBack.productoid}}" name="productoid">
						
						<div class="col-md-12">
						<!-- <h1><i class="fas fa-address-card"></i><b> </b></h1> -->
						</div>
						<div class="col-md-12">
							<h3 class="text-uppercase"><b> </b></h3>
						</div>
						<!-- Número de documento del cliente -->	
						<div class="col-md-3 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-4 control-label">Documento</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-id-card"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<input 
											type = "text"  
											class = "form-control"  
											name = "numDocumento"
											id = "numDocumento"											
											required											
											value = "{{getGestionBack.cedulacliente}}"
											readonly									
										>										
									</div>									
								</div>
							</div>
						</div>
						<!-- Placa del vehiculo en caso de ser soat -->
						<div class="col-md-4 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Placa</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-address-card"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<input 
											type = "text"  
											class = "form-control"  
											name = "placa"
											id = "placa"											
											required
											{% if getGestionBack.placa is not null %}
												value = "{{getGestionBack.placa}}"
											{% else %}
												value = "SIN PLACA"
											{% endif %}											
												
											readonly								
										>										
									</div>									
								</div>
							</div>
						</div>
						<!-- Nombre del cliente -->
						<div class="col-md-5 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Nombre</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-user-alt"></span></span>										
										<input 
											type = "text"  
											class = "form-control"  
											name = "nombre"
											id = "nombre"																					
											required											
											value = "{{getGestionBack.nombreCliente}}" 		
											readonly								
										>										
									</div>									
								</div>
							</div>
						</div>
						<!-- Teléfono -->
						<div class="col-md-3 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-4 control-label">Teléfono</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-phone"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<input 
											type = "number"  
											class = "form-control"  
											name = "telefono"
											id = "telefono"											
											required											
											value = "{{getGestionBack.telefono}}" 		
											readonly								
										>										
									</div>									
								</div>
							</div>
						</div>
						<!-- Celular 1 -->
						<div class="col-md-4 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Celular 1</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-phone"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<input 
											type = "number"  
											class = "form-control"  
											name = "celular1"
											id = "celular1"											
											required											
											value = "{{getGestionBack.celular1}}" 	
											readonly									
										>										
									</div>									
								</div>
							</div>
						</div>
						<!-- Celular 2 -->
						<div class="col-md-5 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Celular 2</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-phone"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<input 
											type = "number"  
											class = "form-control"  
											name = "celular2"
											id = "celular2"												
											required											
											value = "{{getGestionBack.celular2}}" 	
											readonly									
										>										
									</div>									
								</div>
							</div>
						</div>
						<!-- Ciudad -->
						<div class="col-md-3 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-4 control-label">Ciudad</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-city"></span></span>										
										<input 
											type = "text"  
											class = "form-control"  
											name = "ciudad"
											id = "ciudad"											
											required											
											value = "{{getGestionBack.nombreCiudad}}" 		
											readonly								
										>										
									</div>									
								</div>
							</div>
						</div>
						<!-- dirección -->
						<div class="col-md-4 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Dirección</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-home"></span></span>
										{# <input type="number"  style="border-color: gray;" class="form-control" required name="documentoCliente" placeholder = "Documento del cliente" value = "{{ consulta.documentoCliente }}"> #}
										<input 
											type = "text"  
											class = "form-control"  
											name = "direccion"
											id = "direccion"											
											required											
											value = "{{getGestionBack.direccionentrega}}" 	
											readonly									
										>										
									</div>									
								</div>
							</div>
						</div>
						<!-- Barrio -->
						<div class="col-md-5 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Barrio</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon" style="border-color: gray;"><span class="fas fa-location-arrow"></span></span>										
										<input 
											type = "text"  
											class = "form-control"  
											name = "barrio"
											id = "barrio"																					
											required											
											value = "{{getGestionBack.nombreBarrio}}" 	
											readonly									
										>										
									</div>									
								</div>
							</div>
						</div>						

					</div>
				</div>				
				<!-- Información Producto -->
				<div class="panel-body" id="divInfoProducto" name="divInfoProducto">
					<hr>
					<div class="row">
						<h3 class="h3" style="padding-left: 15px;">Información Producto</h3><br>
						<!-- Tipo de producto -->
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Tipo</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-list-alt"></span></span>										
											<input 
												type = "text"
												class = "form-control"
												name = "producto" 
												id = "producto"												
												value = "{{getGestionBack.nombreProducto}}"
												readonly
											>										
									</div>									
								</div>
							</div>
						</div>
						<!-- 2 -->				
						<!-- Se muestra la poliza solo si el tipo de producto es soat -->
						{% if getGestionBack.poliza != 0 %}
							<div class="col-md-6 col-sm-12">
								<div class="form-group">                                        
									<label class="col-md-3 control-label">No Poliza</label>
									<div class="col-md-8 col-xs-12">
										<div class="input-group">
											<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-user-shield"></span></span>											
											<input 
												type = "text"
												class = "form-control"
												name = "numPoliza" 
												id = "numPoliza"												
												value = "{{getGestionBack.poliza}}"
												readonly
											>											
										</div>										
									</div>
								</div>
							</div>						
						{% endif %}										
					</div>					
				</div>				
				<!-- Información del reporte del motorizado -->
				<div class="panel-body" id="divReporteMotorizado" name="divReporteMotorizado">
					<hr>					
					<div class="row" >
						<h3 class="h3" style="padding-left: 15px;">Información Reporte Entregado</h3><br>						
						<br><br>
						<table class="table table-striped table-bordered table-condensed" id="tblGestion" name="tblGestion">
							<thead>				
								<th>Fecha</th>
								<th>Hora</th>
								<th>Estado Reporte</th>
								<th>Motivo</th>
								<th>Obervación</th>
								<th>Lugar Reporte</th>																
								<th>Ubicar</th>
							</thead>
							<tbody>
							{% for item in getHistoricoReporte %}
								<tr>									
									<td>{{item.fecha}}</td>
									<td>{{item.hora}}</td>
									<td>{{item.nombreEstado}}</td>
									<td>{{item.nombreMotivo}}</td>
									<td>{{item.observacion}}</td>
									<td>{{item.ubicacionReporte}}</td>
									<td>
										<button 
											class="btn btn-sm btn-primary"
											id="btnLocalizar"
											name="btnLocalizar"
											value="{{item.ubicacionReporte}}"
											type="button"
											onClick="localizar('{{item.ubicacionReporte}}')"
										>
											<i class="fas fa-map-marker-alt"></i>
										</button>
									</td>									
								</tr>								
							{% endfor %}					
							</tbody>
						</table>
					</div>
				</div>

				<!-- Espacio para cargar el mapa -->
				<div class="panel-body" id="mapa" name="mapa">
					<hr>
					<div class="row" >
						<div class ="col-lg-2 col-md-12">
							<button 
								type="button" 
								id="btnLimpiarMapa" 
								name="btnLimpiarMapa"  
								class="btn btn-primary form-control"
								onClick="limpiarMarcadores();"
							>
							<i class="fas fa-eraser"></i>
								Limpiar Mapa
							</button>	
						</div>
						<br><br>
						<h3 class="h3" style="padding-left: 15px;">Mapa</h3>
						
						<div class="col-md-12 vr-google">							
							<div id="map">
							</div>
						</div>
					</div>
				</div>

				<!-- Gestión Back -->
				<div class="panel-body" id="divGestionBack" name="divGestionBack">
					<hr>
					<div class="row">
						<h3 class="h3" style="padding-left: 15px;">Gestión Backoffice</h3><br>
						
						<!-- Estado de la gestión del backoffice -->
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Estado</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-exclamation"></span></span>										
											<select
												class="form-control" 
												name="estadoBack" 
												id = "estadoBack"
												required 
											>
												<option value=""> Seleccione </option>
												{% for item in getEstadosBack %}
													<option value="{{item.estadoid}}">{{item.nombre}} </option>
												{% endfor %}
												
											</select>								
									</div>									
								</div>
							</div>
						</div>						

						<!-- Acción a realizar (anular o guardar) -->				
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Acción</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-edit"></span></span>										
											<select
												class="form-control" 
												name="accionBack" 
												id = "accionBack"
												required 
											>
												<option value=""> Seleccione </option>
												<option value="1"> Guardar </option>
												<option value="2"> Anular </option>
											</select>								
									</div>									
								</div>
							</div>
						</div>
						<!-- Obervacion de la gestion-->
						<div class="col-md-6 col-sm-12">
							<div class="form-group">                                        
								<label class="col-md-3 control-label">Observación</label>
								<div class="col-md-8 col-xs-12">
									<div class="input-group">
										<span class="input-group-addon"  style="border-color: gray;"><span class="fas fa-align-justify"></span></span>											
										<textarea 												
											class = "form-control"
											name = "observacionBack" 
											id = "observacionBack"
											minlength="5"
											required pattern="[A-Za-z0-9]"								
										></textarea>
									</div>										
								</div>
							</div>
						</div>

						<br><br><br><br>

						<div class="col-md-2 col-sm-12">							
						</div>
						<!-- Boton de guardar -->
						<div class="col-md-2 col-sm-12">							
							<button 
								type="submit" 
								id="btnGuardar" 
								name="btnGuardar" 
								class="btn btn-primary"
							>
								<i class="fas fa-save"></i>
								Guardar
							</button>
						</div>
						<!-- Boton cancelar y volver a atrás -->
						<div class="col-md-2 col-sm-12">							
							<button 
								type="button" 
								id="btnCancelar" 
								name="btnCancelar" 
								class="btn btn-danger"
								onclick="atras()"
							>	
								<i class="fas fa-times-circle"></i>
								Cancelar
							</button>
						</div>										
					</div>					
				</div>	
			</div>
		</form>	
	</div>	
	<br><br>

	



<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script async src="https://maps.googleapis.com/maps/api/js?key=&libraries=places"></script>
<script async defer	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9BN2M2d6aJIlUvMEFe6s7p2NNDrXd0do&callback=initMap">	</script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
	let markerDirEntrega;
	let markerDirMotorizado = [];
	let ciudadNombre;
	let address;
	let iconoDirEntrega = '../public/markerGreen.png';
	let iconoDirMotorizado = '../public/markerBlack.png';
	let contador = 0;
	let titleEntrega = "Ubicacion de entrega";
	let titleMotorizado = "Ubicación de reporte";
	let dirMotorizado;
	let map;

	/** Inicializa el mapa*/
    function initMap() {
		map = new google.maps.Map(document.getElementById('map'), {
			center: { lat: 4.676086, lng: -74.058496 },
			zoom: 18
		});
		geocoder = new google.maps.Geocoder();
		ciudadNombre = document.getElementById('ciudad').value;		
		direccion = document.getElementById('direccion').value + ' ' + ciudadNombre + " Colombia";
		ubicarMarcador(geocoder, markerDirEntrega, direccion, iconoDirEntrega, titleEntrega);
	}

	/** Localiza los puntos del reporte de los motorizados*/
	function localizar(direccion){
		console.log(direccion);
		dirMotorizado = direccion;
		if( contador == 1){					
			for (let i = 0; i < markerDirMotorizado.length; i++) {
				//Borrar los marcadores de los motorizados del mapa
				//markerDirMotorizado[i].setMap(null);				
			}						
			//markerDirMotorizado = [];				
			contador = 0;
		}
		console.log(dirMotorizado);
		ubicarMarcador(geocoder, markerDirMotorizado, dirMotorizado, iconoDirMotorizado, titleMotorizado);
	}

	/** 
		*Funcion para ubicar los marcadores
		*(direccion de entrega y dirección de reporte de motorizados)
	*/
	function ubicarMarcador(geocoder, marker, address, image, title){
		geocoder.geocode({ 'address': address }, function (results, status) {
			console.log(address);
			if (status === 'OK') {
				if (Array.isArray(marker)){					
					//title = title + id;
					//Genera marcador en un array para los motorizados
					console.log("latitud, longitud : ", results[0].geometry.location.lat)				
					let nuevoMarker = new google.maps.Marker({							
						position: results[0].geometry.location,
						icon: image,
						title: title
					});
					marker.push(nuevoMarker);
					contador = 1;
					for (let i = 0; i < marker.length; i++) {
						//Ubica el marcador en el mapa
						marker[i].setMap(map);
					}
				}else{
					//Genera el marcador principal de ubicacion de entrega		
					map.setCenter(results[0].geometry.location);
					marker = new google.maps.Marker({
						map,
						position: results[0].geometry.location,
						icon: image,
						title: title
					});										
				}
			}else{
				$('.GeneradaB').show();
				alert('dirrecion no encontrada ' + address);
			}
		});
	}

	function limpiarMarcadores(){
		for (let i = 0; i < markerDirMotorizado.length; i++) {
				//Borrar los marcadores de los motorizados del mapa
				markerDirMotorizado[i].setMap(null);				
			}						
			markerDirMotorizado = [];				
			contador = 0;
	}
      
</script>

<script>
	$(document).ready(function() {
		/**Recarga la pagina en caso de que se acceda a ella con un boton de atras**/
		if(performance.navigation.type == 2){
			location.reload(true);		
		}
		/**Funcion datatable para el manejo de la tabla**/
		$('#tblGestion').DataTable({		
			aaSorting: [],
            pageLength: 10,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [
                {
					extend: 'excel', 
					title: 'Rutas',
					exportOptions: {
						columns:[0,1,2,3,4,5]
							
					}
				}
            ],
            language: {
                "decimal": "",
                "emptyTable": "No hay información",
                "info": "Mostrando _START_ a _END_ de _TOTAL_ Entradas",
                "infoEmpty": "Mostrando 0 to 0 of 0 Entradas",
                "infoFiltered": "(Filtrado de _MAX_ total entradas)",
                "infoPostFix": "",
                "thousands": ",",
                "lengthMenu": "Mostrar _MENU_ Entradas",
                "loadingRecords": "Cargando...",
                "processing": "Procesando...",
                "search": "Buscar:",
                "zeroRecords": "Sin resultados encontrados",
                "paginate": {
                    "first": "Primero",
                    "last": "Ultimo",
                    "next": "Siguiente",
                    "previous": "Anterior"
                }
            },

		});
	});

	/**Funcion para limpiar los filtro de busqueda 
	*y volver a la vista para ecoger fechas y productos
	**/
	function atras(){
		let url = "{{url('backoffice/limpiarEnGestion')}}";
		let gestionAsignacionid = {{getGestionBack.gestionAsignacionid}};
		console.log(gestionAsignacionid);
		let parametros = {
			limpiarEnGestion: gestionAsignacionid,
		}			
		$.ajax({
			type: "POST",
			url: url,
			data: parametros,
			success: function(data){	
				console.log(data);
				let url2 = "{{url('backoffice/index')}}"
				location.assign(url2);
				
			}
		});	
	}
	
	/**Validación para el campo observación, que tenga al menos una letra y no permita solo espacios**/
	$('#enviarForm').on('submit', function(evt){
		let observacion = $('#observacionBack').val();
		let expresionRegular = /[A-Za-z0-9]/;
		if (!expresionRegular.test(observacion)){
			//console.log("Entro");
			evt.preventDefault();
			Swal.fire({
				title: 'La observación no puede estar vacia',
				showDenyButton: false,							
				confirmButtonText: 'Aceptar',			
			})			 
				
			}
	});
</script>