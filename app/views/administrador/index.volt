<style>
	select {
		height: 33px !important;
	}
</style>
<div class="text-right">
	<br>
	<div class="col-md-12">
		<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal5">
			<i class="fas fa-plus-square"></i>
			Asignar fecha
		</button>
		<br>
	</div>
	<br><br><br>
</div>
{% if ok is defined %}
	<br>
	<div class="col-md-12">
		<div class="alert alert-info alert-dismissable">
			<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			<i class="fas fa-check"></i>
			Datos actualizados con exito.
		</div>
	</div>
{% endif %}

{% if okEliminado is defined %}
	<br>
	<div class="col-md-12">
		<div class="alert alert-info alert-dismissable">
			<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			<i class="fas fa-check"></i>
			Dato eliminado con exito.
		</div>
	</div>
{% endif %}

{% if fechaCreate is defined %}
	<br>
	<div class="col-md-12">
		<div class="alert alert-info alert-dismissable">
			<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			<i class="fas fa-check"></i>
			Fecha creada con exito.
		</div>
	</div>
{% endif %}

{% if userError is defined %}
	<br>
	<div class="col-md-12">
		<div class="alert alert-danger alert-dismissable">
			<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
			<i class="fas fa-ban"></i>
			La fecha
			{{userError}}
			ya se encuentra registrado en la Base de Datos.
		</div>
	</div>
{% endif %}
<div class="wrapper wrapper-content animated fadeInRight" style="margin: 2% 0;">
	<div class="row">
		<div class="col-lg-12" style="margin: 2% 0;">
			<div class="ibox ">
				<div class="ibox-title">
					<h5>Fechas de entrega (Dias en especifico)</h5>

					<div class="ibox-tools">
						<a class="collapse-link">
							<i class="fa fa-chevron-up"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">

					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>#</th>
									<th>Fecha Deshabilitar</th>
									<th>Rol</th>
									<th>Campaña</th>
									<!-- <th>Editar</th> -->
									<th>Eliminar</th>
								</tr>
							</thead>
							<tbody>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>

<div class="wrapper wrapper-content animated fadeInRight">
	<div class="row">
		<div class="col-lg-12">
			<div class="ibox ">
				<div class="ibox-title">
					<h5>Fechas de entrega (Rango)</h5>

					<div class="ibox-tools">
						<a class="collapse-link">
							<i class="fa fa-chevron-up"></i>
						</a>
					</div>
				</div>
				<div class="ibox-content">

					<div class="table-responsive">
						<table class="table table-striped table-bordered table-hover dataTables-example">
							<thead>
								<tr>
									<th>#</th>
									<th>Fecha Inicio (Rango)</th>
									<th>Fecha Fin (Rango)</th>
									<th>Dia Inicio (Rango)</th>
									<th>Dia Fin (Rango)</th>
									<th>Rol</th>
									<th>Campaña</th>
									<th>Tipificación</th>
									<th>Editar</th>
								</tr>
							</thead>
							<tbody>
								{% for item in dataRango %}
									<tr class="gradeX">
										<td>{{item.num}}</td>
										<td>{{item.fechainicio}}</td>
										<td>{{item.fechafin}}</td>
										<td>{{item.diainicio}}</td>
										<td>{{item.diafin}}</td>
										<td>
											{% if item.rol == 17 %}
												Renovación
											{% endif %}
											{% if item.rol == 5 %}
												Asesor Comercial
											{% endif %}
											{% if item.rol == 4 %}
												Sac
											{% endif %}
										</td>
										<td>
											{% if item.campana == 2 %}
												SOAT
											{% endif %}
											{% if item.campana == 3 %}
												TARJETAS
											{% endif %}
											{% if item.campana == 4 %}
												TODO RIESGO
											{% endif %}
										</td>
										<td>
											{% if item.tipificacion == 12 %}
												VENTA EFECTIVA
											{% endif %}
											{% if item.tipificacion == 50 %}
												RENOVACIÓN
											{% endif %}
										</td>
										<td class="text-center">
											<form action="{{url('administrador/index')}}" method="POST">
												<input type="hidden" name="edit1" value="edit1">
												<input type="hidden" name="id" value="{{item.id}}">
												<input type="hidden" name="fechainicio" value="{{item.fechainicio}}">
												<input type="hidden" name="fechafin" value="{{item.fechafin}}">
												<input type="hidden" name="rol" value="{{item.rol}}">
												<input type="hidden" name="campana" value="{{item.campana}}">
												<button type="submit" class="btn btn-info form-control">
													<i class="fas fa-calendar-check"></i>
												</button>
											</form>
										</td>
									</tr>
								{% endfor %}
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog2" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				{% if dato is defined %}
					<h4 class="modal-title">Actualizar Fecha (Especifica)</h4>
				{% else %}
					<h4 class="modal-title">Asignar nueva fecha</h4>
				{% endif %}
			</div>
			<div class="modal-body">
				<form method="post" {% if dato is defined %} action="{{url('administrador/editFecha')}}" {% else %} action="{{url('administrador/nuevaFecha')}}" {% endif %}>
					<div class="row">
						<div class="col-md-6">
							<div class="col-md-6">
								<label for="">Fecha Deshabilitar:</label>
							</div>
							<div class="col-md-12">
								<input type="hidden" name="id" value="{% if dato is defined %}{{dato['id']}}{% endif %}">
								<input id="date-picker-1" autocomplete="off" name="fecha" type="text" class="date-picker form-control" value="{% if dato is defined %}{{dato['fecha']}}{% endif %}" data-date-format="dd-mm-yyyy" placeholder="dd-mm-aaaa" required/>
							</div>
						</div>
						<div class="col-md-6">
							<div class="col-md-3">
								<label for="">Campaña:</label>
							</div>
							<div class="col-md-12">
								<select required name="campana" class="form-control m-b" id="campana">
									<option value="">Seleccione..</option>
									<option value="2" {% if dato is defined %} {% if dato['campana'] == 2 %} selected {% endif %} {% endif %}>SOAT</option>
									<option value="3" {% if dato is defined %} {% if dato['campana'] == 3 %} selected {% endif %} {% endif %}>TARJETAS</option>
									<option value="4" {% if dato is defined %} {% if dato['campana'] == 4 %} selected {% endif %} {% endif %}>TODO RIESGO</option>
								</select>
							</div>
						</div>
						<br><br><br><br><br>
						<!-- <div class="col-md-6" id="noTr">
						                                <div class="col-md-3">
						                                    <label for="">Rol:</label>
						                                </div>
						                                <div class="col-md-12">
						                                    <select name="rol" id="noTr" class="form-control m-b">
						                                        <option value="">Seleccione..</option>
						                                        <option value="4" {% if dato is defined %}{% if dato['rol'] == 4 %}selected{% endif %}{% endif %}>SAC</option>
						                                        <option value="5" {% if dato is defined %}{% if dato['rol'] == 5 %}selected{% endif %}{% endif %}>ASESOR COMERCIAL</option>
						                                    </select>
						                                </div>
						                            </div> -->
						<div class="col-md-6">
							<div class="col-md-3">
								<label for="">Rol:</label>
							</div>
							<div class="col-md-12" id="">
								<select name="rol" class="form-control m-b">
									<option value="">Seleccione..</option>
									<option value="4" {% if dato is defined %} {% if dato['rol'] == 4 %} selected {% endif %} {% endif %}>SAC</option>
									<option value="5" {% if dato is defined %} {% if dato['rol'] == 5 %} selected {% endif %} {% endif %}>ASESOR COMERCIAL</option>
									<option id="Tr" value="17" {% if dato is defined %} {% if dato['rol'] == 17 %} selected {% endif %} {% endif %}>RENOVADOR (A)</option>
								</select>
							</div>
						</div>
						<div class="col-md-12">
							<div class="col-md-12" id="message"></div>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
					<button type="submit" class="btn btn-success">Guardar datos</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div class="modal inmodal fade" id="myModal6" tabindex="-1" role="dialog2" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span>
					<span class="sr-only">Close</span>
				</button>
				{% if dato1 is defined %}
					<h4 class="modal-title">Actualizar Fecha (Rango)</h4>
				{% else %}
					<h4 class="modal-title">Asignar nueva fecha</h4>
				{% endif %}
			</div>
			<div class="modal-body">
				<form method="post" {% if dato1 is defined %} action="{{url('administrador/editFecha')}}" {% else %} action="{{url('administrador/nuevaFecha')}}" {% endif %}>
					<div class="row">
						<div class="col-md-8">
							<div class="col-md-6">
								<label for="">Modificar por:</label>
							</div>
							<div class="col-md-12">
								<select required name="Modificar" id="Modificar" class="form-control m-b">
									<option value="">Seleccione..</option>
									<option value="FECHA">FECHA</option>
									<option value="DIAS">DIAS</option>
								</select>
							</div>
						</div>
						<div class="col-md-6" id="fechaInicio">
							<div class="col-md-6">
								<label for="">Fecha Inicio:</label>
							</div>
							<div class="col-md-12">
								<input type="hidden" name="id" value="{% if dato1 is defined %}{{dato1['id']}}{% endif %}">
								<input id="date-picker-1" autocomplete="off" type="date" name="fechainicio" class=" form-control" value="{{dato1['fechainicio']}}" placeholder="dd-mm-aaaa" data-date-format="dd-mm-yyyy"/>
							</div>
							<br>
						</div>
						<div class="col-md-6" id="fechaFin">
							<div class="col-md-6">
								<label for="">Fecha Fin:</label>
							</div>
							<div class="col-md-12">
								<input id="date-picker-1" autocomplete="off" name="fechafin" type="date" class=" form-control" value="{{dato1['fechafin']}}" data-date-format="dd-mm-yyyy" placeholder="dd-mm-aaaa"/>
							</div>
							<br>
						</div>
						<br><br><br><br><br>
						<div class="col-md-6" id="diaInicio">
							<br>
							<div class="col-md-6">
								<label for="">Dia Inicio:</label>
							</div>
							<div class="col-md-12">
								<input name="diainicio" type="text" class="form-control" value="{% if dato1['diainicio'] is empty %} {% else %} {% if dato1 is defined %}{{dato1['diainicio']}}{% endif %} {% endif %}" placeholder="+8d"/>
							</div>
							<br>
						</div>
						<div class="col-md-6" id="diaFin">
							<br>
							<div class="col-md-6">
								<label for="">Dia Fin:</label>
							</div>
							<div class="col-md-12">
								<input name="diafin" type="text" class="form-control" value="{% if dato1['diafin'] is empty %} {% else %} {% if dato1 is defined %}{{dato1['diafin']}}{% endif %} {% endif %}" placeholder="0d"/>
							</div>
							<br>
						</div>
						<br><br><br><br><br>
						<div class="col-md-12">
							<div class="col-md-12" id="message"></div>
						</div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
					<button type="submit" class="btn btn-success">Guardar datos</button>
				</div>
			</form>
		</div>
	</div>
</div>

<div id="modal2"></div>

<div class="modal" id="eliminar" tabindex="-1" role="dialog">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Eliminar fecha</h5>
				<button style="margin: -3% 0;" type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="{{url('administrador/eliminarFecha')}}" method="POST">
				<div class="modal-body">
					<input type="hidden" name="id" value="{% if dato2 is defined %}{{dato2['id']}}{% endif %}">
					<p>Esta seguro de eliminar esta fecha
						{% if dato2 is defined %}
							{{dato2['fecha']}}
						{% endif %}.</p>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-primary">Eliminar</button>
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
				</div>
			</form>
		</div>
	</div>
</div>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>

{% if dato is defined %}

	<script>
		var edit = "{{ dato['edit'] }}";

if (edit == 'edit') {

$('#myModal5').modal('show');

$('.btn-white').click(function () {
window.location ='{{ url("administrador/index") }}';
});

}
	</script>

{% endif %}


{% if dato1 is defined %}

	<script>
		var edit = "{{ dato1['edit1'] }}";

if (edit == 'edit1') {

$('#myModal6').modal('show');

$('.btn-white').click(function () {
window.location ='{{ url("administrador/index") }}';
});

}
	</script>

{% endif %}

{% if dato2 is defined %}

	<script>
		var eliminar = "{{ dato2['eliminar'] }}";

if (eliminar == 'eliminar') {

$('#eliminar').modal('show');

$('.btn-white').click(function () {
window.location ='{{ url("administrador/index") }}';
});
}
	</script>

{% endif %}

<script>
	$(document).ready(function () {

$('.dataTables-example').DataTable({
pageLength: 10,
responsive: true,
dom: '<"html5buttons"B>lTfgitp',
buttons: [
{
extend: 'excel',
title: 'Usuarios'
}, {
extend: 'pdf',
title: 'Usuarios'
}, {
extend: 'print',
customize: function (win) {
$(win.document.body).addClass('white-bg');
$(win.document.body).css('font-size', '10px');

$(win.document.body).find('table').addClass('compact').css('font-size', 'inherit');
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
}

});

});
</script>

<script type="text/javascript">

	$(".date-picker").datepicker({});

$("#noTr").hide();
$("#Tr").hide();

$("#campana").on('change', function () {
var campana = $(this).val();

if (campana == 2) {
$("#noTr").show('slow');
$("#Tr").hide();
} else if (campana == 3) {
$("#noTr").show('slow');
$("#Tr").hide();
} else if (campana == 4) {
$("#Tr").show('slow');
$("#noTr").hide();
} else {
$("#noTr").hide();
$("#Tr").hide();
}

});

$("#fechaInicio").hide();
$("#fechaFin").hide();
$("#diaInicio").hide();
$("#diaFin").hide();

$("#Modificar").on('change', function () {
var Modificar = $(this).val();

if (Modificar == "FECHA") {
$("#fechaInicio").show('slow');
$("#fechaFin").show('slow');
$("#diaInicio").hide();
$("#diaFin").hide();
} else if (Modificar == "DIAS") {
$("#diaInicio").show('slow');
$("#diaFin").show('slow');
$("#fechaInicio").hide();
$("#fechaFin").hide();
} else {
$("#fechaInicio").hide();
$("#fechaFin").hide();
$("#diaInicio").hide();
$("#diaFin").hide();
}

});
</script>
