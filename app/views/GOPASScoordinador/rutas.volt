<style>
	select{
		height: 34px!important;
	}
</style>
<div class="col-md-12">
	<h1>Rutas <i class="fas fa-calendar-alt"></i></h1>
	<hr>
</div>

{% if ventaKO is defined %}
	<br>
	<div class=" col-md-12 alert alert-danger alert-dismissable">
	    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
	    <i class="fas fa-ban"></i> La placa {{ventaKO}} no existe o está en la Base errada.
	</div>
{% endif %}
<div class="col-md-12">
	<form action="{{url('GOPASScoordinador/reporterutas')}}" target="_blank" method="POST">
		<!-- <div class="col-md-4">
			<label for="">Base:</label>
			<select name="ciudad" id="ciudad" required class="form-control">
				<option value="">Seleccione...</option>
				{% for item in ciudades %}
					<option value="{{item.id}}">{{item.ciudad}}</option>
				{% endfor %}
				<option value="5">TODAS</option>
			</select>
		</div> -->
		<div class="col-md-6">
			<label for="">Fecha inicio</label>
			<input type="date" name="fechaInicio" value="{{fechaInicial}}" required class="form-control" placeholder="dd-mm-aaaa">
		</div>
		<div class="col-md-6">
			<label for="">Fecha final</label>
			<input type="date" name="fechaFinal" value="{{fechaFinal}}" required class="form-control" placeholder="dd-mm-aaaa">
		</div>
		<div class="col-md-2 pull-right" required style="margin-top: 5px;">
			<br>
			<button class="btn btn-primary form-control"><i class="far fa-file-excel"></i> Exportar</button>
		</div>
		<div class="col-md-12">
			<img src="http://www.cpadp.gob.do/wp-content/uploads/2018/08/informe-de-gestion-de-riesgos.jpg" class="img-responsive" alt="">
		</div>
	</form>
</div>


<script>
	$(document).ready(function(){
		
	});
</script>