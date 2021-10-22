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
	{% if sinFecha is defined %}
		<br>
		<div class="col-md-12">
			<div class="alert alert-danger alert-dismissable" id="error" name="error" >
				<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
				<i class="fas fa-exclamation-triangle"></i> {{ sinFecha }}
			</div>
		</div>
	{% endif %}
	
	{% if sinResgistros is defined %}
		<br>
		<div class="col-md-12">
			<div class="alert alert-danger alert-dismissable" id="error" name="error" >
				<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
				<i class="fas fa-exclamation-triangle"></i> {{ sinResgistros }}
			</div>
		</div>
	{% endif %}		

	{% if enGestion is defined %}	
		<div class="alert alert-danger alert-dismissable" id="enGestion" name="enGestion" >
			<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			<i class="fas fa-check"></i> {{enGestion}}
		</div>
	{% endif %}

	{% if getAnuladosBack is defined %}
		<div class="row" name="divInfoGestion" id="divInfoGestion">			
			<h3 class="h3" style="padding-left: 15px;">Reporte de Anulados</h3><br><br>			
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
					</thead>
					<tbody>
						{% for item in getAnuladosBack %}
							<tr>								
								<td>{{item.tipoventa_id}}</td>
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
					onclick="atras()"
				>	
					<i class="fas fa-long-arrow-alt-left"></i>					
				</button>
			</div><br><br>		
		</div>
	{% else %}
		<div class="row">
			<h3 class="h3" style="padding-left: 15px;">Reporte de Anulados</h3><br><br>
			<form class="form-horizontal" action="{{url('backoffice/anulados')}}" method="POST">
				<div class="col-lg-2"></div>
				<div class="col-lg-3">
					<label for="fechaInicio">Fecha inicio:</label>
					<input type="date" name="fechaInicio" id="fechaInicio" value="{{fechaInicio}}" class="form-control">
				</div>
				<div class="col-lg-3">
					<label for="fechaFinal">Fecha final:</label>
					<input type="date" name="fechaFin" id="fechaFin" value="{{fechaFin}}" class="form-control">
				</div>
				<div class="col-lg-2"><br>
					<button 
						style="margin-top: 4px;" 
						class="btn btn-primary" 
						id="btnGenerar" 
						name="btnGenerar"
					>
						<i class="fa fa-cog"></i>
						Generar
					</button>
				</div>
				<br><br><br><br><br>
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
		/**
			*Funcion para agregar paginación a la tabla
		*/
		$('#tblGestion').DataTable({
			aaSorting: [],
            pageLength: 10,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [
                {extend: 'excel', title: 'Reporte Anulados'}
                
                
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

	function atras(){
		let url2 = "{{url('backoffice/anulados')}}"
		location.assign(url2);
	}

	
	
</script>

<script>
	
</script>