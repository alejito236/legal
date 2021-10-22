<style>
    select{
        height: 33px!important;
    }
</style>

<hr><hr>
<!-- Nueva vista para el formulario de colfondos -->
{% if hecho is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> Datos actualizados con exito.
        </div>
    </div>
{% endif %}
<hr><hr>
{% if dato is defined %}

		<br><br>
		<form action="{{url('administrador/reagendar')}}" method="POST">
			<div id="gestion" class="col-md-12 panel " style="background-color: #f8f8f8;">
				<input type="hidden" value="{{dato.id}}" name="id">
                <input type="hidden" value="{{dato.tipificacion}}" name="tipificacion">
                <input type="hidden" value="colfondos" name="colfondos">
				<input type="hidden" name="primerNombre" class="form-control" value="{{dato.primerNombre}}"
					placeholder="Dirección">
				<input type="hidden" name="segundoNombre" class="form-control" value="{{dato.segundoNombre}}"
					placeholder="Dirección">
				<input type="hidden" name="primerApellido" class="form-control" value="{{dato.primerApellido}}"
					placeholder="Dirección">
				<input type="hidden" name="segundoApellido" class="form-control" value="{{dato.segundoApellido}}"
					placeholder="Dirección">
				<input type="hidden" name="fechaExpedicion" class="form-control" value="{{dato.fechaExpedicion}}"
					placeholder="Dirección">
				<input type="hidden" name="cedula" class="form-control" value="{{dato.cedula}}"
					placeholder="Dirección">
				<input type="hidden" name="ciudadExpedicion" class="form-control" value="{{dato.ciudadExpedicion}}"
					placeholder="Dirección">
				<br><br>
				
				<button 
					type="button" 
					class=" btn btn-primary pull-right" 
					
					onclick="location.href='editarRegistros'">
					VOLVER
				</button>
				<div style="color: #265a80;" class="col-md-6">
					<h3>NOMBRE COMPLETO </h3>
				</div>
				<div style=" text-transform: uppercase;color: #265a80;" class="col-md-6">
					<h3>{{dato.primerNombre}} {{dato.segundoNombre}} {{dato.primerApellido}}
						{{dato.segundoApellido}} CC
						{{dato.cedula}} </h3>
				</div>

				<!-- <div style="color: #265a80;" class="col-md-6">
					<h3>CIUDAD DE EXPEDICIÓN</h3>
				</div>
				<div style=" text-transform: uppercase;color: #265a80;" class="col-md-6">
					<h3>{{dato.ciudadExpedicion}} </h3>
				</div> -->

				<!-- <div style="color: #265a80;" class="col-md-6">
					<h3>FECHA DE EXPEDICIÓN</h3>
				</div>
				<div style=" text-transform: uppercase;color: #265a80;" class="col-md-6">
					<h3>{{dato.fechaExpedicion}}</h3>
				</div> -->
				<!-- <br><br>
				<div class="col-md-6">
					<br>
					<label for="">Tipificación</label>
				</div>

				<div id="one" class="col-md-6">
					<br>
					<select name="tipificacion" required id="tipificacion" class="form-control sel">
						<option value="">Seleccione..</option>
						<option value="119">REAGENDAMIENTO</option>
					</select>
					<br><br>
				</div> -->
				<br><br>
				<br><br>
                <div id="agendamiento">
					<div class="panel-body" style="background-color: #ffffff;">
						<div class="col-md-12">
							<h3 class="titulos text-center" style="color: #265a80; font-size: 20px;">
								<strong>Datos básicos del afiliado..</strong>
							</h3>
							<br>
						</div>
						<div class="row">
							<div class="col-md-2">
								<label for="">Primer Nombre</label>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" value="{{dato.primerNombre}}" readonly=""
									name="primerNombre" id="primerNombre">
							</div>
							<div class="col-md-2">
								<label>Segundo Nombre</label>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" value="{{dato.segundoNombre}}" readonly=""
									name="segundoNombre" id="segundoNombre">
							</div>
						</div>
						<div class="row">
							<br>
							<div class="col-md-2">
								<label for="">Primer Apellido</label>
							</div>

							<div class="col-md-4">
								<input type="text" class="form-control" value="{{dato.primerApellido}}" readonly=""
									name="primerApellido" id="primerApellido">
							</div>
							<div class="col-md-2">
								<label>Segundo Apellido</label>
							</div>
							<div class="col-md-4">
								<input type="text" class="form-control" value="{{dato.segundoApellido}}" readonly=""
									name="segundoApellido" id="segundoApellido">
							</div>
						</div>
						<div class="row">
							<br>
							<div class="col-md-2">
								<label>Estado Civil: <span style="color:red;"><sup>*</sup></span></label>
							</div>
							<div class="col-md-4">
								<select name="estadoCivil" id="estadoCivil" class="form-control">
									<option value="">Seleccione..</option>
									<option value="Soltero(a)">Soltero(a)</option>
									<option value="Union libre">Union libre</option>
									<option value="Casado(a)">Casado(a)</option>
									<option value="Separado(a)">Separado(a)</option>
									<option value="Viudo(a)">Viudo(a)</option>
								</select>
							</div>
							<div class="col-md-2">
								<label>Direccion residencia<span style="color:red;"><sup>*</sup></span></label>
							</div>
							<div class="col-md-4">
								<input type="text" name="direccionResidencia" class="form-control"
									value="{{dato.direccionResidencia}}" placeholder="CAR 56 # 9 - 09">
							</div>
						</div>

						<div class="row">
							<br>
							<div class="col-md-2">
								<label>Contacto vicidial</label>
							</div>
							<div class="col-md-4">
								<input type="number" name="" class="form-control" value="{{dato.telefonoCliente}}" placeholder="" readonly>
							</div>
							<div class="col-md-2">
								<label>Ciudad Residencia<span style="color:red;"><sup>*</sup></span></label>
							</div>
							<div class="col-md-4">
								<select name="ciudadResidencia" id="ciudadResidencia" class="form-control">
									<option>SELECCIONE...</option>
									{% for item1 in ciudades %}
									<option value="{{item1.id}}">{{item1.ciudad}}</option>
									{% endfor %}
								</select>
							</div>
						</div>

						<div class="row">
							<br>
							<div class="col-md-2">
								<label>Celular </label>
							</div>
							<div class="col-md-4">
								<input type="number" name="celularCliente" class="form-control"
									value="{{dato.celularCliente}}" readonly>
							</div>
							<div class="col-md-2">
								<label>Email <span style="color:red;"><sup>*</sup></span></label>
							</div>
							<div class="col-md-4">
								<input type="email" name="correoCliente" class="form-control"
									value="{{dato.correoCliente}}" placeholder="NOTIENE@NOTIENE.COM" >
							</div>
						</div>

						<div class="row">
							<br>
							<div class="col-md-2">
								<label>Telefono Laboral: <span style="color:red;"><sup>*</sup></span></label>
							</div>
							<div class="col-md-4">
								<input type="number" name="telefonoLaboral" class="form-control"
									value="{{dato.telefonoLaboral}}" placeholder="3333333333">
							</div>
							<div class="col-md-2">
								<label>Edad: <span style="color:red;"><sup>*</sup></span></label>
							</div>
							<!-- <div class="col-md-4">
								<input type="text" name="edad" class="form-control"
									value="{{dato.edad}}" placeholder="18">
							</div> -->
							<div class="col-md-4">
								<input type="text" 
									name="edad" 
									id="edad" 
									onchange="validaEdad()" 
									required class="form-control edad"
									value="{{dato.edad}}" placeholder="18">
							</div>

						</div>

						<div class="row">
							<br>
							<div class="col-lg-2">
								<label>Codigo OTP: <span style="color:red;"><sup>*</sup></span></label>
							</div>
							<div class="col-lg-4">
								<input type="number" name="codigo_otp" class="form-control" value="{{dato.codigo_otp}}" onchange="validaCodigoOTP()" id="codigo_otp">
							</div>
							<div class="col-lg-2">
								<label>Ciudad Registro: <span style="color:red;"><sup>*</sup></span></label>
							</div>
							<div class="col-lg-4"> 
								<select class="form-control" id="ciudadRegistro" name="ciudadRegistro">
									{% if ciudad is defined %}
										<option value="{{ciudad.id}}" selected>{{ciudad.ciudad}}</option>
									{% else %}
										<option value="0">Seleccione..</option>
									{% endif %}
								</select> 
							</div>
						</div>
						<div class="row">
							<br>
							<div class="col-md-2">
								<label>Fecha Expedicion </label>
							</div>
							<div class="col-md-4">
								<input required type="date" name="fechaExpedicion" class="form-control"
									value="{{dato.fechaExpedicion}}" id="fechaExpedicion">
							</div>
							
						</div>
						<div class="col-md-12">
							<hr>
							<br>
						</div>
						<!-- <div class="col-lg-10">
							<br>
							<label>Ocupa o ha ocupado un cargo politico, un cargo de servidor publico, o un cargo
								como
								representante legal de una organizacion internacional(*); o se trata de una persona
								que
								goza de reconocimiento publico?</label>

						</div>
						<div class="col-lg-2">
							<select id="cargoPolitico"  disabled="true" name="cargoPolitico" class="form-control" > 
								{% if dato.cargoPolitico=="SI" %}
								<option value="Si" selected>Si</option>
									{% else %}
								<option value="No" selected>No</option>
								{%endif%}
							</select></div>
						<div class="col-md-12">
							<hr>
						</div> -->
					</div>
					<br>
					<br>
					<div class="panel-body" style="background-color: #ffffff;">
						<div class="col-md-12 text-center" style="color: #265a80; font-size: 20px;">
							<strong>Información financiera del afiliado</strong>
							<br>
						</div>
						<div class="col-md-12">
							<hr>
						</div>
						<div class="col-md-2">
							<label for="">IBC: <span style="color:red;"><sup>*</sup></span></label>
						</div>
						<div class="col-md-4">
							<select name="ingresos" id="ingresos" class="form-control">
								<option value="">Seleccione...</option>
								<option value="Menores a $ 1 millon" >Menores a $ 1 millon</option>
								<option value="Entre $ 1 y $ 3 millones" >Entre $ 1 y $ 3 millones</option>
								<option value="4 millones o mas" >4 millones o mas</option>
							</select>
							<br>
						</div>

						<div class="col-md-2">
							<label>Tipo de Afiliado: <span style="color:red;"><sup>*</sup></span></label>
						</div>
						<div class="col-md-4">
							<select name="tipoAfiliacion" id="tipoAfiliacion" class="form-control">
								<option value="">Seleccione..</option>
								<option value="Dependiente">Dependiente</option>
								<option value="Voluntario">Voluntario</option>
								<option value="Independiente">Independiente</option>
								<option value="Cooperado">Cooperado</option>
								<option value="Independiente afiliado por agremiación o asociación">Independiente afiliado por agremiación o asociación</option>
							</select>
							<br>
						</div>
						<br>
						<div class="col-md-12">
							<hr>
						</div>
					</div>
					<br>
					<br>
					<div class="panel-body" style="background-color: #ffffff;">
						<div class="col-md-12 text-center" style="color: #265a80; font-size: 20px;">

							<strong> Datos basicos del empleador Y/O del vinculo laboral</strong>
							<br>
						</div>
						<br>
						<br>
						<br>
						<br>
						<div class="col-md-2">
							<label>Razon Social <span style="color:red;"><sup>*</sup></span></label>
						</div>
						<div class="col-md-4">
							<input type="text" name="razonSocial" class="form-control"
								value="{{dato.razonSocial}}" placeholder="razonSocial">
						</div>
						<div class="col-md-2">
							<label>NIT <span style="color:red;"><sup>*</sup></span></label>
						</div>
						<div class="col-md-4">
							<input type="number" name="nit" class="form-control" value="{{dato.nit}}"
								placeholder="NIT Empresa">
						</div>
						<br>
						<div class="col-lg-2">
							<br>
							<label>Genero </label>
						</div>
						<div class="col-lg-4">
							<br>
							<select id="genero" name="genero" class="form-control">
								<option value="">Seleccione</option>
									<option value="F">F</option>
									<option value="M">M</option>
							</select> 
						</div> 
						<div class="col-lg-2">
							<br>
							<label>Salario o ingreso mensual(IBC)$ <span style="color:red;"><sup>*</sup></span></label>
						</div>
						<div class="col-lg-4">
							<br>
							<input type="text" id="salarioMensual" name="salarioMensual" onkeypress='return event.charCode >= 48 && event.charCode <= 57' onchange="formatoNicho(this)" onkeypress="return alpha(event)" value="{{dato.salarioMensual}}" class="form-control">
						</div>						
						
						<div class="col-md-12">
							<hr>
						</div>
					</div>
					<br>
					<br>
					<div class="panel-body" style="background-color: #ffffff;">
						<div class="col-md-12 text-center" style="color: #265a80; font-size: 20px;">
							<strong>Registros de ruta</strong>
							<br>
						</div>
						<div class="col-md-12">
							<hr>
						</div>
						<div class="col-lg-3">
							<label>Indicaciones de dirección <span style="color:red;"><sup>*</sup></span></label>
						</div>
						<div class="col-lg-9">
							<textarea class="form-control" style="border: 3px solid #e5e6e7;" name="indicacionesDireccion">{{dato.indicacionesDireccion}}</textarea> 
						</div>
					</div>
					<div class="col-md-8">
						<input type="hidden" id="numero" name="" class="form-control" placeholder="Extensión">
					</div>

					
					<br>
					
				</div>
				<button type="submit" class="btn btn-primary form-control">Guardar Información</button>
			</div>

	</div>
	</form>
	{% endif %}

<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>

{% if dato is defined %}

	<script>
		var cedula = '{{dato.cedula}}';
		var estadoCivil = '{{dato.estadoCivil}}';
		var ingresos = '{{dato.ingresos}}';
		var tipoAfiliacion = '{{dato.tipoAfiliacion}}';
		var ciudadResidencia = '{{dato.ciudadResidencia}}';
		var genero = '{{dato.genero}}';
		var fechaExpedicion = '{{dato.fechaExpedicion}}';
		$('#fechaExpedicion').val(fechaExpedicion);
        $('#cedula').val(cedula);
		$('.cedula').val(cedula);
		$('#estadoCivil').val(estadoCivil);
		$('#ingresos').val(ingresos);
		$('#tipoAfiliacion').val(tipoAfiliacion);
		$('#ciudadResidencia').val(ciudadResidencia);
		$('#genero').val(genero);

	</script>
	{% endif %}


{% if dato is defined %}
<script>

	$("#otraCiudad").hide();
	$("#Accion").show();

</script>
{% endif %}
<!-- {% if otraCiudad is defined %} -->
<script>

	$("#otraCiudad").show();


</script>
<!-- {% endif %} -->

{% if dato is defined %}
<script>

	$("#notFoundDB").hide();
	$("#Accion").show();

</script>
{% endif %}
{% if notFoundDB is defined %}
<script>

	$("#gestion").hide();


</script>
{% endif %}


 {% if exito is defined  %}
<script>

	$("#gestion").hide();

</script>
{% endif %}


{% if entregado is defined %}
<script>
$("#otraCiudad").hide();
</script>

{% endif %}
{% if userCreate is defined %}
	<script>
		$('#notFound').hide();
	</script>
	{% endif %}


	{% if userContact is defined %}
	<script>
		$('#gestion').hide();
	</script>
	{% endif %}

	{% if userCreate is defined %}
	<script>
		$('#gestion').hide();
	</script>
	{% endif %}

	<script>
		function validaCodigoOTP(){
			var codigo = document.getElementById("codigo_otp").value;
			//console.log(codigo.length)
			if(codigo.length <= 5 || codigo.length >= 17){
				alert('ingrese un código de mínimo 6 caracteres y máximo 16 caracteres');
				document.getElementById("codigo_otp").value = '';
			}
		}

		function validaEdad(){
			console.log("Entro");
			var edad = $('.edad').val();
			var genero = $('#genero').val();
		
			if((edad <= 51 && genero == 'M') || (edad <= 47 && genero == 'F')){
				
			}else{
				alert('La edad es muy superior a los estandares de vinculación');
				document.getElementById("edad").value = '';
			}
		}
	</script>

	<script type="text/javascript">
		

		function alpha(e) { var k; document.all ? k = e.keyCode : k = e.which; return ((k > 64 && k < 91) || (k > 96 && k < 123) || k == 8 || k == 32 || (k >= 48 && k <= 57)); } 

		function formatoNicho(input){

			var num = input.value.replace(/\./g,"");
			var nicho = $('#nicho').val();
		
			if(nicho == '' && num >= 1316000){
				num = num.toString().split("").reverse().join("").replace(/(?=\d*\.?)(\d{3})/g,'$1.');
				num = num.split("").reverse().join("").replace(/^[\.]/, "");
				input.value = num;
			}else if(nicho == ''){
				alert("El valor debe ser mayor 1.316.000");
				input.value = '';
			}else if(nicho == 'NICHO 1' && num >= 1316000){
				num = num.toString().split("").reverse().join("").replace(/(?=\d*\.?)(\d{3})/g,'$1.');
				num = num.split("").reverse().join("").replace(/^[\.]/, "");
				input.value = num;
			}else if(nicho == 'NICHO 1'){
				alert("El valor debe ser mayor 1.316.000");
				input.value = '';
			}else if(nicho == 'NICHO 2' && num >= 1755606){
				num = num.toString().split("").reverse().join("").replace(/(?=\d*\.?)(\d{3})/g,'$1.');
				num = num.split("").reverse().join("").replace(/^[\.]/, "");
				input.value = num;
			}else if(nicho == 'NICHO 2'){
				alert("El valor debe ser mayor 1.755.606");
				input.value = '';
			}else if(nicho == 'NICHO 3' && num >= 3511212){
				num = num.toString().split("").reverse().join("").replace(/(?=\d*\.?)(\d{3})/g,'$1.');
				num = num.split("").reverse().join("").replace(/^[\.]/, "");
				input.value = num;
			}else if(nicho == 'NICHO 3'){ 
				alert("El valor debe ser mayor 3.511.212");
				input.value = '';
			}
		}

		

		var input = document.getElementById('numero');
		input.addEventListener('input', function () {
			if (this.value.length > 3)
				this.value = this.value.slice(0, 3);
		});


		function format(input) {
			var num = input.value.replace(/\./g, "");
			if (!isNaN(num)) {
				num = num.toString().split("").reverse().join("").replace(/(?=\d*\.?)(\d{3})/g, '$1.');
				num = num.split("").reverse().join("").replace(/^[\.]/, "");
				input.value = num;
			}

			else {
				alert("Solo se permiten numeros");
				input.value = input.value.replace(/[^\d\.]*/g, "");
			}
		}

		//funcion para traer la ciudad de registros
		
		$("#ciudadResidencia").change(function(e) {
		console.log("Entro1");
			var ciudadResidencia = $('#ciudadResidencia').val();
			if(ciudadResidencia == 1){
				var departamento = 56;
			}else if(ciudadResidencia == 2){
				var departamento = 2;
			}else if(ciudadResidencia == 3){
				var departamento = 53;
			}else if(ciudadResidencia == 4){
				var departamento = 50;
			}else if(ciudadResidencia == 5){
				var departamento = 4;
			}else if(ciudadResidencia == 8){
				var departamento = 6;
			}else if(ciudadResidencia == 9){
        var departamento = 7;
      }else if(ciudadResidencia == 10){
        var departamento = 8;
      }else if(ciudadResidencia == 19){
        var departamento = 40;
      }else if(ciudadResidencia == 26){
        var departamento = 47;
      }else if(ciudadResidencia == 27){
        var departamento = 48;
      }else if(ciudadResidencia == 30){
        var departamento = 52;
      }

			var url = "{{url('administrador/editarRegistrosColfondos')}}";
			var parametros = {
				"ciudad" : departamento
			}
			$.ajax({
			type: "POST",
			url: url,
			data: parametros,
			success: function(data){
				
				var body = JSON.parse(data);
				console.log(body)
				var option = '<option>Seleccione..</option>';
				for (var i = 0; i < body.length; i++) {
					option+= '<option value="' + body[i]['id'] + '">' + body[i]['ciudad']+ '</option>';

				}
				$('#ciudadRegistro').html(option);
			}
		});
		e.preventDefault();
		});

		
		// Fecha de vencimiento del soat
		$(".date-picker").datepicker({
			startDate: '0d'
		});
</script>