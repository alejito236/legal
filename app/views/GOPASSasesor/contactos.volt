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
	input{
		text-transform: uppercase;
	}
	
</style>

<div class="col-md-12">
	<h1>Contactos <i class="far fa-id-card"></i></h1>
	<hr>
</div>
<div class="wrapper wrapper-content animated fadeInRight">
		<div class="row">
			<div class="col-lg-12">
			<div class="ibox ">
				<div class="ibox-content">	
					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover dataTables-example" >
						<thead>
						<tr>
							<th>#</th>
							<th>Cliente</th>
							<th>Cédula</th>
							<th>Placa</th>
							<th>Teléfono</th>
							<th>Celular</th>
							<th>Convenio</th>
							<th>Fecha de gestión</th>
							<th>Fecha volver a llamar</th>
							<th>Tipificación</th>
							<th>Acción</th>
						</tr>
						</thead>
						<tbody>
						{% if contactos is empty %}
							No hay datos
						{% else %}
							{% for item in contactos %}
								
								<tr class="gradeX">
									<td>{{ item.gestionId }}</td>
									<td>{{ item.nombrePersona }}</td>
									<td>{{ item.cedulaPersona }}</td>
									<td style="text-transform: uppercase;">{{ item.placa }}</td>
									<td>{{ item.telefono }}</td>
									{% if item.celularLlamadas is not  null and item.celularLlamadas is not 0 %}
										<td>{{item.celularLlamadas}}</td>
									{% elseif item.celularWhatsapp is not null and item.celularWhatsapp is not 0 %}
										<td>{{item.celularWhatsapp}}</td>
									{% else %}
										<td>No tiene celular</td>
									{% endif %}				                    
									<td>{{ item.nombreConvenio }}</td>
									<td>{{ item.fechaGestion }}</td>
									{% if item.fechaVolverLlamar is not null and item.fechaVolverLlamar is not "0000-00-00 00:00:00" %}
										<td>{{ item.fechaVolverLlamar }}</td>
									{% else %}
										<td>Sin fecha</td>
									{% endif %}
									
									<td>{{ item.nombreTipi }}</td>
									<td class="text-center">
										<form action="{{url('GOPASSasesor/index')}}" method="POST">
											<div class="col-md-5">
												<input type="hidden" id="placa" required placeholder="Buscar" name="placaBuscar" class="form-control" value="{{item.placa}}">
											</div>
											<button id="boton" class="btn btn-primary">{{item.nombreTipi}}</button>
										</form>
									</td>
								</tr>
							{% endfor %}
						{% endif %}
						
						</tbody>
						</table>
					</div>	
				</div>
			</div>
		</div>
		</div>
	</div>
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>

<script>
    $(document).ready(function(){

        $('.dataTables-example').DataTable({
            pageLength: 10,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [
                {extend: 'excel', title: 'Contactos'},
                {extend: 'pdf', title: 'Contactos'},

                {extend: 'print',
                 customize: function (win){
                        $(win.document.body).addClass('white-bg');
                        $(win.document.body).css('font-size', '10px');

                        $(win.document.body).find('table')
                                .addClass('compact')
                                .css('font-size', 'inherit');
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

</script>