<style>
	select{
		height: 40px!important;		
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
	
	input{
		text-transform: uppercase;
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
	.col-sm-12{
		padding:10px;
	}

</style>
<!-- Almacena cache para evitar reenvio de formulario y mostrar la Información anterio -->
<?php  
  header("Cache-Control: max-age=2592000"); //30days (60sec * 60min * 24hours * 30days)
?>
<meta http-equiv='cache-control' content='no-cache'>
<meta http-equiv='expires' content='0'>
<meta http-equiv='pragma' content='no-cache'>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<br>
<div class="wrapper ">
	<!--<div class="row">
        <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-content">
                    <h5 class="m-b-md">Gestión</h5>
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> 0
                    </h2>
                </div>
            </div>
        </div>
    </div>-->
	{% if error is defined %}
		<br>
		<div class="col-md-12">
			<div class="alert alert-danger alert-dismissable" id="error" name="error" >
				<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
				<i class="fas fa-exclamation-triangle"></i> {{ error }}
			</div>
		</div>
	{% endif %}
	
	{% if guardo is defined %}
		<br>
		<div class="alert alert-info alert-dismissable" id="guardo" name="guardo">
			<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			<i class="fas fa-check"></i> {{guardo}}
		</div>
	{% endif %}	
	<div id="notificacion" name="notificacion" class="alert alert-info" role="alert">
	</div>

	{% if enGestion is defined %}	
		<div class="alert alert-danger alert-dismissable" id="enGestion" name="enGestion" >
			<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			<i class="fas fa-check"></i> {{enGestion}}
		</div>
	{% endif %}

	{% if getListadoGestion is defined %}
		<div class="row" name="divInfoGestion" id="divInfoGestion">			
			<div class="col-lg-1 col-sm-9">
				<button 
					type="button" 
					id="btnAnular" 
					name="btnAnular" 
					class="btn btn-danger "
					
				>
					<i class="fas fa-window-close"></i>
				</button>
			</div>

			<div class=" col-lg-10"></div>		
			
			
			<br><br><br><br>		
			<div class ="col-lg-12 col-sm-6 text-center" name ="divTableGestion" id ="divTableGestion">
				
				<table class="table table-striped table-bordered table-condensed" id="tblGestion" name="tblGestion">
					<thead>				
						<th>ID </th>
						<th>Fecha </th>
						<th>Franja </th>
						<th>Ciudad </th>
						<th>Producto </th>
						<th>N° Documento </th>
						<th>Placa </th>
						<th>Mensajero </th>
						<th>Estado Reporte </th>
						<th>Estado Back </th>
						<th>Estado Cierre </th>
						<th style="width:80px;" >Acción  </th>
						<th> </th>
					</thead>
					<tbody>
						{% for item in getListadoGestion %}
							<tr>
								<form action="{{ url('backoffice/gestion') }}" method="POST">
									<td>{{item.ventaid}}</td>
									<td>{{item.fechaEntrega}}</td>
									{% if item.franjaHoraria is 0 %}
										<td>AM</td>
									{% else %}
										<td>PM</td>
									{% endif %}								
									<td>{{item.nombreCiudad}}</td>
									<td>{{item.nombreProducto}}</td>
									<td>{{item.cedulacliente}}</td>
									{% if item.placa is not null %}
										<td>{{item.placa}}</td>									
									{% else %}
										<td>SIN PLACA</td>									
									{% endif %}
									<td>{{item.nombreMoto}}</td>
									<td>{{item.nombreEstadoMoto}}</td>									
									{% if item.estadoBackId is numeric %}
										<td>{{item.nombreEstadoBack}}</td>	
									{% else %}
										<td>PENDIENTE</td>
									{% endif %}
									{% if item.estadoCierreId is numeric %}
										<td>{{item.nombreEstadoCierre}}</td>	
									{% else %}
										<td>PENDIENTE</td>
									{% endif %}
									<input type="hidden" value="{{item.tipoventa_id}}" id="tipoVenta" name="tipoVenta">
									<input type="hidden" value="{{item.gestionasignadorid}}" id="gestionasignadorid" name="gestionasignadorid">
									<input type="hidden" value="{{item.productoid}}" id="productoid" name="productoid">
									{% if arrayCiudades is defined %}
										<input type="hidden" value="{{arrayCiudades}}" id="arrayCiudades" name="arrayCiudades">									
									{% endif %}
									
									<td>
										<button
											type="submit" 
											class="btn btn-primary"
											id="btnEditar"
											name="btnEditar"
										>
											<i class="fas fa-pencil-alt"></i>
										</button>
										<!--<button
											type="submit" 
											class="btn btn-warning"
											id="btnVer"
											name="btnVer"
										>
											<i class="fas fa-eye"></i>
										</button>-->
									</td>
									<td>
										<input 
											class="form-check-input " 
											type="checkbox" 
											value="checkAnular" 
											id="anular" 
											name="anular"
										>
									</td>	
								</form>				
							</tr>						
						{% endfor %}
						
						
					</tbody>
				</table>		
			</div>
			<!-- Boton cancelar y volver a atrás -->
			<div class="col-md-12 col-sm-12">
				<button 
					type="button" 
					id="btnCancelar" 
					name="btnCancelar" 
					class="btn btn-danger"
					onclick="borrarArrayCiudades()"
				>	
					<i class="fas fa-long-arrow-alt-left"></i>					
				</button>
			</div><br><br>		
		</div>
	{% else %}
		<br><br>
		<div class="row" name="divFiltrado" id="divFiltrado">		
			<form action="{{url('backoffice/index')}}"  method="POST" id="formGenerar" name="formGenerar">			
				{# Ciudades #}
				<div class="col-lg-6 col-sm-6">
					<div class="col-lg-3">
					</div>				
					<div class="container col-lg-6">
						<label class="col-md-3 control-label ciudad">Elegir Ciudades</label>
						<div class="container-ciudad">				
							<div class="form-check" style="  margin-left: 15px; margin-right: 0px;">
							<input type="hidden" id="arrayCiudad" name="arrayCiudad">
							{% for item in ciudades %}
								<input 
									class="form-check-input" 
									value="{{ item.ciudadId }}" 
									type="checkbox" 
									id="ciudad" 
									name="ciudad"
								>{{ item.nombre }}
								<br>
							{% endfor %}
							</div>
						</div>
					</div>
				</div>	
				{# Tipo Producto  #}
				<div class="col-lg-6 col-sm-12">				                                      
					<label class="col-lg-3 col-sm-12 control-label">Tipo Producto:</label>	
						<div class="input-group col-lg-6 col-sm-12">							
							<select 
								class="form-control col-lg-6 col-sm-12" 
								name="tipoProducto" 
								id = "tipoProducto"						
								required 
							>
								<option value="">Seleccione...</option>
								{% for item in productos %}
									<option value="{{item.productoId}}">{{item.nombre}}</option>
								{% endfor %}							
								<option value="0">Todos</option>
							</select>									
						</div>				
				</div><br><br><br><br><br><br><br><br><br><br>
				<div class="col-lg-6 col-sm-12">	
				<div class="col-lg-4">
				{# Button Generar #}
				</div>
					<div class ="col-lg-6 col-md-12">
						<button 
							type="submit" 
							id="btnGenerar" 
							name="btnGenerar"  
							class="btn btn-lg btn-primary"
						>
						<i class="fa fa-cog"></i>
							Generar
						</button>					
					</div>
				</div>
				
			</form>
		</div>
	{% endif %}
	



<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>




<script>  
	let arrayCiudades = [];
	if(performance.navigation.type == 2){
		location.reload(true);
	}
	
	$(document).ready(function() {
		$('#notificacion').hide();
		//location.reload();
		//$('#divInfoGestion').hide();
		/**
			*Funcion para anular todos las gestiones elegidas
		*/
		$('#btnAnular').on('click', function() {			 
			Swal.fire({
				title: '¿Seguro desea anular los registros seleccionados?',
				showDenyButton: false,
				showCancelButton: true,
				confirmButtonText: 'Guardar',			
			}).then((result) => {
				/* Read more about isConfirmed, isDenied below */
				if (result.isConfirmed) {
					let arrayAnular = [{}];
					let tot=0;
					$('#tblGestion tbody tr').each(function(){
						let checkAnular = $(this).find('input[type="checkbox"]').prop('checked');
						if(checkAnular){
							let tipoVenta = $(this).find('input[id="tipoVenta"]').val()
							let gestionasignadorid = $(this).find('input[id="gestionasignadorid"]').val()
							let productoid = $(this).find('input[id="productoid"]').val()
							/*let datos={
								id,tipoProducto
							}*/
							
							//array.push(datos);
							arrayAnular.push({tipoVenta:tipoVenta, gestionasignadorid: gestionasignadorid, productoid: productoid});
						}
					});
					if(arrayAnular.length > 1){
						console.log(arrayAnular);
						let url = "{{url('backoffice/anular')}}";  
						let parametros = {
							datos: arrayAnular
						}			
						$.ajax({
							type: "POST",
							url: url,
							data: parametros,
							success: function(data){
								console.log(data);
								let body = JSON.parse(data);										
								body.forEach((element) => {
									$('#notificacion').show()
									//console.log(element[0]);
									$('#notificacion').append(`<strong>${element[0]}</strong><br>`)								
								});
								setTimeout(() => {
									$('#notificacion').hide();
									$('#notificacion').empty();
									let url2 = "{{url('backoffice/index')}}"
									location.assign(url2);
								}, 5000);								
							}
						});
					}else{
						Swal.fire({
							title: 'Debe seleccionar al menos un registro para anular',
							showDenyButton: false,							
							confirmButtonText: 'Aceptar',			
						})
					}
				}
			})
			
		});	

		/**
			*Funcion onClick  para generar el array de ciudades a buscar
		*/
		$('input[type=checkbox]').on('click', function(){
			let checkbox = $(this);		
						
			if(checkbox.attr('id') !== "anular"){
				let	ciudadId = checkbox.val();
				//console.log("Entro");
				if(checkbox.prop("checked")){
					arrayCiudades.push(ciudadId)
				}else{			
					arrayCiudades = eliminarElemento(arrayCiudades,ciudadId);
				}
				//console.log(arrayCiudades);
				$('#arrayCiudad').val(arrayCiudades);
				console.log(arrayCiudades);
			}

		});

		/** 
			*Recibe un array y un item
			*Retorna un nuevo array sin el item recibido
		*/
		let eliminarElemento = (arr,item) => {
			return arr.filter( elemento => elemento !== item );
		};

		/**
			*Funcion para agregar paginación a la tabla
		*/
		$('#tblGestion').DataTable({			
			aaSorting: [],
            pageLength: 10,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [{
					extend: 'excel',
					title: 'No entregados',
					exportOptions: {
						columns:[0,1,2,3,4,5,6,7,8,9,10]
							
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

	function borrarArrayCiudades(){
		let url = "{{url('backoffice/borrarArrayCiudades')}}";  
		let parametros = {
			eliminarArray: 'eliminarArray'
		}			
		$.ajax({
			type: "POST",
			url: url,
			data: parametros,
			success: function(data){				
				let url2 = "{{url('backoffice/index')}}"
				location.assign(url2);
				
			}
		});	
	}

	$("#formGenerar").on('submit', function(evt){
		if(arrayCiudades.length <= 0){
			Swal.fire({
				title: 'Seleccione al menos una ciudad',
				showDenyButton: false,							
				confirmButtonText: 'Aceptar',			
			})			
			evt.preventDefault();
		}
	});
	{% if error is defined %}
		$('#error').show();
		setTimeout(()=>{
			$('#error').hide();			
		},5000)
	{% endif %}

	{% if guardo is defined  %}		
		$('#guardo').show();
		setTimeout(()=>{
			$('#guardo').hide();
		},5000)
	{% endif %}

	{% if enGestion is defined %}
		$('#enGestion').show();
		setTimeout(()=>{
			$('#enGestion').hide();
		},5000)
	{% endif %}
	
</script>

<script>
	
</script>