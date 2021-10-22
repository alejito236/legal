<style>
	select {
		height: 40px !important;
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
		padding: 15px 0 8px 15px !important;
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
		border-color: #5095E2 !important;
	}
	hr {
		height: 1px !important;
		background-color: silver;
	}
	input,
	select {
		border: 1px solid silver !important;
	}

	input {
		text-transform: uppercase;
	}
	.container-ciudad {
		border: 2px solid #ccc;
		overflow-y: scroll;
		display: block;
		height: 100%;
		width: 100%;
		padding-bottom: 10px;
	}
	.container {

		height: 120px;
		padding-left: 0;
		padding-right: 0;
		padding-bottom: 10px;

	}
	.ciudad {
		border: 0.5px solid #4F7F20;
		display: block;
		width: 100%;
		background-color: #4F7F20;
		color: #f2f2f2;
	}
	.col-sm-12 {
		padding: 10px;
	}
</style>
<div class="wrapper ">
	{% if notFound is defined %}
		<br>
		<div class="col-md-12">
			<div class="alert alert-info alert-dismissable">
				<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
				<i class="fas fa-exclamation-triangle"></i>
				{{ notFound }}
			</div>
		</div>
	{% endif %}
</div>
<br><br><br>
<div class="wrapper ">
<div id="notificacion" name="notificacion" class="alert alert-info" role="alert">
</div>
{% if getEnGestion is defined %}
	<div class="row" name="divInfoGestion" id="divInfoGestion">			
			<h3 class="h3" style="padding-left: 15px;">Reportes en Gestión</h3><br><br>
			<div class="col-lg-1 col-sm-9">
				<button 
					type="button" 
					id="btnLiberar" 
					name="btnLiberar" 
					class="btn btn-primary "
					
				>
					<i class="fas fa-lock-open"></i>
				</button>
			</div><br><br><br>
			<div class ="col-lg-12 col-sm-6 text-center" name ="divTableGestion" id ="divTableGestion">
				
				<table class="table table-striped table-bordered table-condensed" id="tblGestion" name="tblGestion">
					<thead>				
						<th>ID </th>
						<th>Cliente </th>
						<th>Producto </th>
						<th>Usuario </th>
						<th>Nombre </th>
						<th>Tiempo En Gestión </th>
						<th>Liberar</th>
						
					</thead>
					<tbody>
						{% for item in getEnGestion %}
							<tr>								
								<td>{{item.tipoventa_id}}</td>
								<td>{{item.cedulacliente}}</td>
								<td>{{item.nombreProducto}}</td>
								<td>{{item.usuarioid}}</td>
								<td>{{item.nombreBack}}</td>
								<td>{{item.minutos}}</td>
								<input type="hidden" value="{{item.gestionId}}" id="gestionId" name="gestionId">								
								<td>
										<input 
											class="form-check-input " 
											type="checkbox" 										
											id="liberar" 
											name="liberar"
										></td>
															
							</tr>						
						{% endfor %}
						
						
					</tbody>
				</table>		
			</div>				
	</div>
{% endif %}
</div>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script>
	$(document).ready(function() {
		$('#notificacion').hide();
	});
	$('#btnLiberar').on('click', function() {			 
		Swal.fire({
			title: '¿Seguro desea liberar los registros seleccionados?',
			showDenyButton: false,
			showCancelButton: true,
			confirmButtonText: 'Guardar',			
		}).then((result) => {
			/* Read more about isConfirmed, isDenied below */
			if (result.isConfirmed) {
				let arrayLiberar = [{}];
				
				$('#tblGestion tbody tr').each(function(){					
					let checkAnular = $(this).find('input[type="checkbox"]').prop('checked');
					if(checkAnular){
						let gestionId = $(this).find('input[id="gestionId"]').val()						
						arrayLiberar.push({gestionId:gestionId});
					}
				});
				console.log(arrayLiberar.length);
				if (arrayLiberar.length > 1){
					let url = "{{url('administrador/limpiarGestion')}}";  
					let parametros = {datos: arrayLiberar};
					$.ajax({
						type: "POST",
						url: url,
						data: parametros,
						success: function(data){
							console.log(data);						
							$('#notificacion').show()					
							$('#notificacion').append(`<strong>${data}</strong><br>`)								
							
							setTimeout(() => {
								$('#notificacion').hide();
								$('#notificacion').empty();
								let url2 = "{{url('administrador/liberarRegistroBack')}}"
								location.assign(url2);
							}, 5000)
							

							
						}
					});
				}else{
					Swal.fire({
						title: 'Debe seleccionar al menos un registro para liberar',
						showDenyButton: false,						
						confirmButtonText: 'Aceptar',			
					});
				}
				
			}
		})
		
	});	
</script>
	