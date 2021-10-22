<style>
    select {
        height: 34px!important;
    }
</style>
<div class="col-md-12">
    <h1>Cambio de ciudad
        <li class="fa fa-refresh fa-spin"></li>
    </h1>
    <hr>
</div>

{% if cambioOK is defined %}
<br>
<div class=" col-md-12 alert alert-info alert-dismissable">
    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
    <i class="fas fa-check"></i> La placa {{cambioOK}} fue cambiada de ciudad con exito.
</div>
{% endif %} {% if cambioKO is defined %}
<br>
<div class=" col-md-12 alert alert-danger alert-dismissable">
    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
    <i class="fas fa-ban"></i> La placa {{cambioKO}} no existe o está en la Base errada.
</div>
{% endif %}
<div class="col-md-12">
    <form action="{{url('SOATcoordinador/cambiociudad')}}" method="POST">
        <div class="col-md-2">
            <label for="">Placa:</label>
            <input type="text" name="placa" required class="form-control" placeholder="AAA000">
        </div>
        <div class="col-md-4">
            <label for="">Base origen:</label>
            <select name="ciudadO" id="ciudadO" class="form-control">
				<option value="">Seleccione...</option>
				{% for item in ciudades %}
					<option value="{{item.id}}">{{item.ciudad}}</option>
				{% endfor %}
			</select>
        </div>
        <div class="col-md-4">
            <label for="">Base destino:</label>
            <select name="ciudadD" required id="ciudadD" class="form-control">
				<option value="">Seleccione...</option>
			</select>
        </div>
        <div class="col-md-2" required style="margin-top: 5px;">
            <br>
            <button class="btn btn-primary btn-sm" type="button"><i class="fas fa-trash">/button>
        </div>
    </form>
</div>

<script>
    $(document).ready(function() {
        $('#ciudadO').change(function() {
            var ciudadO = $(this).val();
            var body = '<option value="">Seleccione...</option><option 		value="4">BUCARAMANGA</option><option value="3">CALI</option><option 					value="2">MEDELLÍN</option><option 					value="30">IBAGUÉ</option><option 					value="9">TUNJA</option>';
            if (ciudadO == 1) {
                var body = '<option value="">Seleccione...</option><option 		value="4">BUCARAMANGA</option><option value="3">CALI</option><option 					value="2">MEDELLÍN</option><option 					value="30">IBAGUÉ</option><option 					value="9">TUNJA</option><option 					value="19">NEIVA</option><option 					value="22">VILLAVICENCIO</option><option 					value="49">EJE CAFETERO</option>';
                $('#ciudadD').html(body);
            } else if (ciudadO == 2) {
                var body = '<option value="">Seleccione...</option><option value="1">BOGOTÁ</option><option value="4">BUCARAMANGA</option><option value="3">CALI</option><option 					value="30">IBAGUÉ</option><option 					value="9">TUNJA</option><option 					value="19">NEIVA</option><option 					value="22">VILLAVICENCIO</option><option 					value="49">EJE CAFETERO</option>';
                $('#ciudadD').html(body);
            } else if (ciudadO == 3) {
                var body = '<option value="">Seleccione...</option><option value="1">BOGOTÁ</option><option value="4">BUCARAMANGA</option><option value="2">MEDELLÍN</option><option 					value="30">IBAGUÉ</option><option 					value="9">TUNJA</option><option 					value="19">NEIVA</option><option 					value="22">VILLAVICENCIO</option><option 					value="49">EJE CAFETERO</option>';
                $('#ciudadD').html(body);
            } else if (ciudadO == 4) {
                var body = '<option value="">Seleccione...</option><option value="1">BOGOTÁ</option><option value="3">CALI</option><option value="2">MEDELLÍN</option><option 					value="30">IBAGUÉ</option><option 					value="9">TUNJA</option><option 					value="19">NEIVA</option><option 					value="22">VILLAVICENCIO</option><option 					value="49">EJE CAFETERO</option>';
                $('#ciudadD').html(body);
            } else if (ciudadO == 30) {
                var body = '<option value="">Seleccione...</option><option value="1">BOGOTÁ</option><option value="3">CALI</option><option value="2">MEDELLÍN</option><option 					value="4">BUCARAMANGA</option><option 					value="9">TUNJA</option><option 					value="19">NEIVA</option><option 					value="22">VILLAVICENCIO</option><option 					value="49">EJE CAFETERO</option>';
                $('#ciudadD').html(body);
            } else if (ciudadO == 9) {
                var body = '<option value="">Seleccione...</option><option value="1">BOGOTÁ</option><option value="3">CALI</option><option value="2">MEDELLÍN</option><option 					value="30">IBAGUÉ</option><option 					value="4">BUCARAMANGA</option><option 					value="19">NEIVA</option><option 					value="22">VILLAVICENCIO</option><option 					value="49">EJE CAFETERO</option>';
                $('#ciudadD').html(body);
            } else if (ciudadO == 19) {
                var body = '<option value="">Seleccione...</option><option value="1">BOGOTÁ</option><option value="3">CALI</option><option value="2">MEDELLÍN</option><option 					value="30">IBAGUÉ</option><option 					value="4">BUCARAMANGA</option><option 					value="9">TUNJA</option><option 					value="22">VILLAVICENCIO</option><option 					value="49">EJE CAFETERO</option>';
                $('#ciudadD').html(body);
            } else if (ciudadO == 22) {
                var body = '<option value="">Seleccione...</option><option value="1">BOGOTÁ</option><option value="3">CALI</option><option value="2">MEDELLÍN</option><option 					value="30">IBAGUÉ</option><option 					value="4">BUCARAMANGA</option><option 					value="9">TUNJA</option><option 					value="19">NEIVA</option><option 					value="49">EJE CAFETERO</option>';
                $('#ciudadD').html(body);
            } else if (ciudadO == 49) {
                var body = '<option value="">Seleccione...</option><option value="1">BOGOTÁ</option><option value="3">CALI</option><option value="2">MEDELLÍN</option><option 					value="30">IBAGUÉ</option><option 					value="4">BUCARAMANGA</option><option 					value="9">TUNJA</option><option 					value="19">NEIVA</option><option 					value="22">VILLAVICENCIO</option>';
                $('#ciudadD').html(body);
            } else {
                var body = '<option value="">Seleccione...</option>';
                $('#ciudadD').html(body);
            }
        });
    });
</script>