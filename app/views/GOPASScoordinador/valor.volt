<style>
	select{
		height: 34px!important;
	}
</style>
<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<div class="col-md-12">
	<h1>Soat <i class="fas fa-money-check-alt"></i></h1>
	<hr>
</div>

{% if hecho is defined %}
	<br>
	<div class="col-md-12">
		<div class="alert alert-info alert-dismissable">
	        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
	        <i class="fas fa-check"></i> El valor fue actualizado con éxito.
	    </div>
    </div>
{% endif %}

<div class="col-md-12">
	<div class="col-md-12 panel panel-primary">
		<br>
		<div class="col-md-12">
			<table class="table table-bordered table-striped dataTables-example">
				<button style="margin: 0% 35%;position: absolute;" type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter">Actualizar Todo</button>
				<thead>
					<tr>
						<th class="text-center">#</th>
						<th class="text-center">Clase Vehiculo</th>
						<th class="text-center">Cilindraje</th>
						<th class="text-center">Valor Actual</th>
						<th class="text-center">Valor Actualizar</th>
						<th class="text-center">Acción</th>
					</tr>
				</thead>
				<tbody>
					{% for item in data %}
					<tr>
						<form action="{{url('SOATcoordinador/valor')}}" class="formu" method="POST">
							<td>
								{{item.num}}
							</td>
							<td>
								<input type="hidden" name="id" value="{{item.id}}">
								{{item.clase}}
							</td>
							<td>
								{{item.cilindraje}}
							</td>
							<td>
								{{item.valor}}
							</td>
							<td>
								<input type="text" name="valor" value="{{item.valor}}" class="form-control">
							</td>
							<td class="text-center">
								<button type="button" class="btn btn-warning demo3">Actualizar</button>
							</td>
						</form>
					</tr>
					{% endfor %}
				</tbody>
			</table>
		</div>
	</div>
</div>  

  <!-- Modal Cargar Valor -->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
	  <div class="modal-content">
		<div class="modal-header">
		  <h5 class="modal-title" id="exampleModalLongTitle">Actualiza valores del soat</h5>
		  <button style="margin: -3% 0;" type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		  </button>
		</div>
		<div class="modal-body">
			<div class="white-bg dashboard-header col-md-10 col-md-offset-1">
				<button class="form-control btn btn-warning" type="button" data-toggle="modal" data-target="#myModal5">Indicaciones</button><br><br>
				<a href="{{url('SOATcoordinador/plantillaValorSoat')}}" target="_blank" class="btn btn-primary form-control"><i class="fas fa-file-excel"></i> Descargar plantilla</a>
			</div>
			<div class="white-bg dashboard-header col-md-10">
				<form enctype="multipart/form-data" method="POST" action="{{url('SOATcoordinador/cargarValor')}}"  name="cargarBase" >
					<div class="white-bg dashboard-header col-md-10" style="margin: auto 6%;margin-bottom: 6%;">
						<input type="file" name="archivoExcel" id="file-5" class="form-control inputfile inputfile-4" data-multiple-caption="{count} files selected" multiple required/>
					</div>
					<br><br>
					<button style="margin: auto 11%;" class="btn btn-primary form-control"><i class="fas fa-upload"></i> Subir</button>
				</form>
				<br>
			</div>
		</div>
		<div class="modal-footer">
		</div>
	  </div>
	</div>
  </div>


  <div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog2" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title">Indicaciones para subir base</h4>
            </div>
            <div class="modal-body">
                
                    <div class="row">
                        <div class="col-md-6">
                            <div class="col-md-6">
                                <label for="">Primer paso:</label>
                            </div>
                            <div class="col-md-12">
                                <p>Descargue la planilla.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6">
                                <label for="">Segundo paso:</label>
                            </div>
                            <div class="col-md-12">
                                <p>Cargue todos los datos solicitados en la planilla, los datos no deben tener caracteres especiales.</p>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="col-md-6">
                                <label for="">Tercer paso:</label>
                            </div>
                            <div class="col-md-12">
                                <p>Cambiar el tipo de archivo por CSV (delimitado por comas) (*.csv).</p>
                            </div>
                        </div>
                        <div class="col-md-6">

                        </div>
                    </div>

            </div>

            <div class="modal-footer">
                <button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
            </div>
            </form>
        </div>
    </div>
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
	$(document).ready(function(){
		$('.demo3').click(function () {
			let _this = $(this);
			
            swal({
                title: "¿Seguro de cambiar el valor?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Si",
                closeOnConfirm: false
            }, function () {

				_this.parent().parent().find('.formu').submit();
            });
        });
	});
</script>
<script>
    $(document).ready(function(){

        $('.dataTables-example').DataTable({
            pageLength: 10,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [
                {extend: 'excel', title: 'Valor SOAT'},
                {extend: 'pdf', title: 'Valor SOAT'},

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