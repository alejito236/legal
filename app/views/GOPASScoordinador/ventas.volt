<style>
	select{
		height: 33px!important;
	}
</style>
<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<div class="col-md-12">
    <h1>Ventas <i class="fas fa-file"></i></h1>
    <hr>
</div>

<div class="col-md-12">
    <form action="{{url('SOATcoordinador/ventas')}}" method="POST">
        <div class="col-md-4">
            <label for="">Placa:</label>
            <input type="text" name="placa" required class="form-control" placeholder="AAA000">
        </div>
        <div class="col-md-4">
            <label for="">Base:</label>
            <select name="ciudad" required id="ciudad" class="form-control">
                <option value="">Seleccione...</option>
                {% for item in ciudades %}
					<option value="{{item.id}}">{{item.ciudad}}</option>
				{% endfor %}
            </select>
        </div>
        <div class="col-md-2" style="margin-top: 5px;">
            <br>
            <button class="btn btn-primary form-control">Buscar</button>
        </div>
    </form>
</div>
<br><br><br><br><br><br><br><br><br>

{% if ventaKO is defined %}
    <br>
    <div class="col-md-12">
        <div class=" col-md-12 alert alert-danger alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-ban"></i> La placa <b>{{ventaKO}}</b> no está en Ventas.
        </div>
    </div>
    
{% endif %}
{% if otraCiudad is defined %}
	<br>
	<div class="alert alert-danger alert-dismissable" style="margin-left: 2%; margin-right: 2%;">
		<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
		<i class="fas fa-ban"></i> La placa existe en la ciudad de <b>{{otraCiudad}}</b>.
	</div>
{% endif %}
{% if anular is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> Anulacion actualizada con exito.
        </div>
    </div>
{% endif %}
<div class="col-md-12">
		{% if data is defined %}
		<br>
		<div class="col-md-12">
			<div class="ibox-content table-responsive" style="padding:0!important;">
				<table class="table table-striped table-bordered no-margins">
					<thead>
						<th>#</th>
						<th>Placa</th>
						<th>Nombre Cliente</th>
						<th>Cedula Cliente</th>
						<th>Fecha Vencimiento</th>
						<th>Valor Soat ($)</th>
						<th>Fecha Gestion</th>
						<th>Asesor</th>
						<th>Editar</th>
					</thead>
					<tbody>
					<tr>
						<td>{{data.id}}</td>
						<td>{{data.placa}}</td>
						<td>{{data.nombreCliente}}</td>
						<td>{{data.cedulaCliente}}</td>
						<td>{{data.fechaVencimiento}}</td>
						<td>{{data.valorSoat}}</td>
						<td>{{data.fechaActualizacion}}</td>
						<td>{{data.asesor}}</td>
						<td class="text-center">
							<form action="{{url('SOATcoordinador/ventas')}}" id="anular" method="POST">
								<input type="hidden" name="id" value="{{data.id}}">
								<button type="button" class="btn btn-warning demo3"><i class="fas fa-ban"></i></button>
							</form>
						</td>
					</tr>
					</tbody>
				</table>
			</div>
		</div>
		{% endif %}
		<div class="col-lg-6 h-100 p-lg">
				
		</div>
	</div>
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    $(document).ready(function(){
        $('.demo3').click(function () {
            swal({
                title: "¿Seguro de cambiar a Anulada?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Si",
                closeOnConfirm: false
            }, function () {
                $('#anular').submit();
            });
        });
    });
</script>