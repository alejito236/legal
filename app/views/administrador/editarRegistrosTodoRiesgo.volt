<style>
	
@keyframes click-wave {
  0% {
    height: 40px;
    width: 40px;
    opacity: 0.35;
    position: relative;
  }
  100% {
    height: 200px;
    width: 200px;
    margin-left: -80px;
    margin-top: -80px;
    opacity: 0;
  }
}

.option-input {
  -webkit-appearance: none;
  -moz-appearance: none;
  -ms-appearance: none;
  -o-appearance: none;
  appearance: none;
  position: relative;
  top: 13.33333px;
  right: 0;
  bottom: 0;
  left: 0;
  height: 30px;
  width: 30px;
  transition: all 0.15s ease-out 0s;
  background: #cbd1d8;
  border: none;
  color: #fff;
  cursor: pointer;
  display: inline-block;
  margin-right: 0.5rem;
  outline: none;
  position: relative;
  z-index: 1000;
}

.option-input:checked {
  background: #40e0d0;
}
.option-input:checked::before {
  height: 30px;
  width: 30px;
  position: absolute;
  content: '✔';
  display: inline-block;
  font-size: 20.66667px;
  text-align: center;
  line-height: 30px;
}

.option-input.radio {
  border-radius: 50%;
}
.option-input.radio::after {
  border-radius: 50%;
}
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

	#hover :hover{
		box-shadow: 0 0.5em 0.5em -0.4em var(--hover);
  		transform: translateY(-0.25em);
	}
	
</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<br>
<!-- Nueva vista para el formulario de todo riesgo -->

{% if exitoGestion is defined %}
<br>
<div class="col-md-12">
	<div class="alert alert-info alert-dismissable" >
		<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
		<i class="fas fa-check"></i> Gestión Exitosa.
	</div>
</div>
{% endif %}


	{% if exitoIns is defined %}
	<br>
	<div class="alert alert-info alert-dismissable" >
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> La placa {{exitoIns}}. Ya aprobó la inspección.
    </div>
	{% endif %}
	{% if notFoundDB is defined %}
	<br>
	<div class="alert alert-danger alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-ban"></i> La placa {{notFoundDB}} no se encuenta en la Base de datos.
    </div>
	{% endif %}
	{% if otraCiudad is defined %}
	<br>
	<div class="alert alert-danger alert-dismissable" id="otraCiudad">
		<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
		<i class="fas fa-ban"></i> La placa existe en otra ciudad <b>{{otraCiudad}}</b>.
	</div>
	{% endif %}

	{% if dato is defined %}
	

	
	<!-- 	{% if !otraCiudad %} -->
	<!-- 	{% if !notFoundDB %} -->
	<!-- 	{% if !exito %} -->
	<form action="{{url('administrador/reagendar')}}" method="POST">
		<input type="hidden" value="{{dato.id}}" name="id">
		<input type="hidden" value="todoriesgo" name="todoriesgo">
		
		<div id="Accion"  class="col-md-12 panel panel-primary">
		<br>
				<button 
					type="button" 
					class=" btn btn-primary pull-right" 
					
					onclick="location.href='editarRegistros'">
					VOLVER
				</button>
			<div class="col-md-12">
				<h1><i class="fas fa-address-card"></i><b> {{dato.nombreCliente}}  </b></h1>
			</div>
			<div class="col-md-12">
				<h3 class="text-uppercase"><b> Cedula: {{dato.cedulaCliente}} - Placa: {{dato.placa}} </b></h3>
			</div>
			<div class="col-md-12">
				<h3>Fecha de Vencimiento Poliza: {{dato.fechaVencimiento}} </h3>
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-4">
				<label for="">Departamento (<label style="color: red;"> * </label>):</label>
				<select required name="departamento" id="departamento" class="form-control" required>
						<option value="">Seleccione..</option>	
						{% for item3 in departamentos %}
						<option id="item3" value="{{item3.id}}">{{item3.departamento}}</option>
						{% endfor %}
				</select>
				
			</div>
			<div class="col-md-4">
				<label for="">Ciudad (<label style="color: red;"> * </label>):</label>
				<select required name="ciudad" id="ciudad" class="form-control" required>
					{% for item2 in ciudades %}
					<option id="item2" value="{{item2.id}}">{{item2.ciudad}}</option>
					{% endfor %}
				</select>
			</div>
		
			<br>	
			<br>
			<div class="col-md-4">
				<label for="">Teléfono (<label style="color: red;"> * </label>)</label>
				<input type="number" name="telefonoCliente" class="form-control" min="1000000" max="3999999999" value="{{dato.telefonoCliente}}" placeholder="Teléfono"required>
				
					
				<br>
			</div>
			<div class="col-md-4">
				<label for="">Celular (<label style="color: red;"> * </label>)</label>
				<input type="number" name="celularCliente" class="form-control" min="3000000000" max="3999999999" value="{{dato.celularCliente}}" placeholder="Celular" required>
				<br>
				<br>
			</div>
			<div class="col-md-4">
				<label for="">Correo (<label style="color: red;"> * </label>)</label>
				<input type="email" name="correoCliente" class="form-control" value="{{dato.correoCliente}}" placeholder="Correo" required>
			


				<br>
				<br>
			</div>
			<div class="col-md-4">
				<label for="">Dirección del Cliente (<label style="color: red;"> * </label>)</label>
				<input type="text" name="direccionCliente" class="form-control" value="{{dato.direccionCliente}}" placeholder="Dirección" required>
				<br>
				<br>
			</div>
			<div class="col-md-4">
				<label for="">Genero (<label style="color: red;"> * </label>):</label>
				<select name="genero" id="genero" class="form-control" required>
					<option value="">Seleccione..</option>
					<option value="FEMENINO">FEMENINO</option>
					<option value="MASCULINO">MASCULINO</option>
				</select>
				<br>
				<br>
			</div>
			<div class="col-md-4">
				<label for="">Zona de circulación (<label style="color: red;"> * </label>)</label>
				<input type="text" name="zonaCirculacion" class="form-control"  placeholder="Zona de circulación" required onkeyup="javascript:this.value=this.value.toUpperCase();" value="{{dato.zonaCirculacion}}" required>
				<br>
			</div>
			
			<div class="col-md-4">
				<label for="date-picker-1" class="control-label">Fecha Nacimiento (<label style="color: red;"> * </label>):</label>
				<div class="control-group">
					<div class="controls">
						<div class="input-group">
							<input id="date-picker-1" autocomplete="off" name="fechaNacimiento" data-date-format="dd-mm-yyyy" type="text" class="date-picker-fechanacimiento form-control" value="{{dato.fechaNacimiento}}" placeholder="dd-mm-aaaa" required/>
							<label for="date-picker-1" class="input-group-addon btn"><span class="fa fa-calendar"></span>
							</label>
						</div>
					</div>
				</div>
			</div>	
			<div class="col-md-12">
				<hr>
			</div>

			<div class="col-md-12">
				<h1><i class="fas fa-hand-holding-usd"></i> Poliza  </h1>
			</div>
			<div class="col-md-6">
				<br>
				<label for="">Vigencia de la Poliza (<label style="color: red;"> * </label>):</label>
				<select name="vigenciaPoliza" id="vigenciaPoliza" class="form-control" required>
					<option value="">Seleccione..</option>
					<option value="SI">SI</option>
					<option value="NO">NO</option>
				</select>
				<br>
				<br>
			</div>
			<div class="col-md-6">
				<br>
				<label for="date-picker-4">Fecha Vencimiento POLIZA (<label style="color: red;"> * </label>)</label>
				<div class="control-group">
					<div class="controls">
						<div class="input-group">
							<input id="date-picker-4" autocomplete="off" name="fechaVencimiento" type="text" data-date-format="dd-mm-yyyy" class="date-picker form-control" placeholder="dd-mm-aaaa"  value="{{dato.fechaVencimiento}}" required/>
							<label for="date-picker-4" class="input-group-addon btn"><span class="fa fa-calendar"></span>
							</label>
						</div>
					</div>
				</div>
				<br>
				<br>
			</div>	
			<br>
			<div id="tipoInspeccion">
				<br>
				<div class="col-md-4">
					<label for="date-picker-3">Tipo de Inspección (<label style="color: red;"> * </label>):</label>
					<select name="inspeccion" id="inspeccion" class="form-control" required>
						<option value="">Seleccione..</option>
						<option value="INSPECCIÓN DOMICILIARIA">INSPECCIÓN DOMICILIARIA</option>
						<option value="INSPECCIÓN CDA">INSPECCIÓN CDA</option>
					</select>
					<br>
				</div>
			</div>
			<div id="centroInspeccion">
				<br>
				<div class="col-md-4">
					<!-- Button list modal CDA-->			
					<label for="date-picker-3">Centro de Inspección  (<label style="color: red;"> * </label>):  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalAbandonedCart" style="padding: 1px 30px;"><i class="fas fa-warehouse"></i></button></label>
					<input type="text" name="" class="form-control" id="nombreinspeccion" value="{% if item is defined %}{{item.nombre}}{% endif %}" placeholder="Centro de inspeccion" onkeydown="return false;" style=" background-color: lightgray;" > <script type="text/javascript"> document.getElementById('nombreinspeccion').style.cursor = "none"; </script>
					{% for item in data3 %}	
					<input type="hidden" name="centroInspeccion" value="{% if dato is defined %}{{dato.centroInspeccion}}{% endif %}" id="idinspeccion">
					{% endfor %}
				</div>
			</div> 
			<br>
			 <div id="fechaInspeccion">
				<br>
				<div class="col-md-4">
					<label for="date-picker-2" class="control-label">Fecha de Inspección (<label style="color: red;"> * </label>):</label>
					<div class="control-group">
						<div class="controls">
							<div class="input-group">
								<input  autocomplete="off" name="fechaInspeccion"  type="text" data-date-format="dd-mm-yyyy" value="{{dato.fechaInspeccion}}" class="date-picker form-control" placeholder="dd-mm-aaaa" required/>
								<label for="date-picker-2" class="input-group-addon btn"><span class="fa fa-calendar"></span>
								</label>
							</div>
						</div>
					</div>
					<br>
					<br>
				</div>
			</div> 
			<div id="tipoDocumentacion">
				<div class="col-md-12">
					<hr>
				</div>
				<br>
				<div class="col-md-4">
					<label for="date-picker-3">Tipo de Documentación (<label style="color: red;"> * </label>):</label>
					<select name="documentacion" id="documentacion" class="form-control" required>
						<option value="">Seleccione..</option>
						<option value="DOCUMENTACIÓN DIGITAL">DOCUMENTACIÓN DIGITAL</option>
						<option value="DOCUMENTACIÓN FISICA">DOCUMENTACIÓN FISICA</option>
						<option value="DOCUMENTACIÓN RECAUDO">DOCUMENTACIÓN RECAUDO</option>
					</select>
					<br>
				</div>
				<div class="col-md-4">
					<label for="date-picker-2" class="control-label">Fecha de Recaudo (<label style="color: red;"> * </label>):</label>
					<div class="control-group">
						<div class="controls">
							<div class="input-group">
								<input id="date-picker-2" autocomplete="off" name="fechaRecaudo" type="text" data-date-format="dd-mm-yyyy" value="{{dato.fechaRecaudo}}" class="date-picker form-control" placeholder="dd-mm-aaaa" required/>
								<label for="date-picker-2" class="input-group-addon btn"><span class="fa fa-calendar"></span>
								</label>
							</div>
						</div>
					</div>
				
				</div>
				<div class="col-md-4">
					<label for="">Momento del día (<label style="color: red;"> * </label>):</label>
					<select name="franjaRecaudo" id="franjaRecaudo" class="form-control" required>
						<option value="">Seleccione..</option>
						<option value="AM">AM</option>
						<option value="PM">PM</option>
					</select>
					<br>
				</div>
			</div>

			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-12">
				<h1><i class="fas fa-car"></i> Información del Vehiculo </h1>
			</div>
			<br>
			<div class="col-md-4">
			<label for="">Clase de Vehículo (<label style="color: red;"> * </label>):</label>
				<select name="claseVehiculo" id="clase" class="form-control" required>
					<option value="">Seleccione...</option>
					{% for item in clase %}
						<option value="{{item.iidCV}}">{{item.snombreCV}}</option>
					{% endfor %}
				</select>
			</div>	
			<br>
			<div class="col-md-4">
				<div class="col-md-4">	
					<label for="">Modelo (<label style="color: red;"> * </label>):</label>
				</div>
				<div class="col-md-12">
						<input type="text" required name="modelo" class="date-picker-modelo form-control" placeholder="Modelo Vehículo" value="{{dato.modelo}}">
				</div>
			</div>
			<br>
			
			<div class="col-md-4">
		
				<label for="">Marca (<label style="color: red;"> * </label>):</label>
				<select name="marca" id="marcas" class="form-control" required>
					<option value="">Seleccione..</option>
						{% for item3 in marcas %}
					<option id="item3" value="{{item3.idmarcaV}}">{{item3.NombremarcaV}}</option>
					{% endfor %}
				</select>
			</div>
			<br>
			<br>
			<br>
			<div class="col-md-4">
				<input type="hidden" name="placa" value="{{dato.placa}}" class="form-control" placeholder="Placa">
			</div>
			<br>
			<br>
			<br>
			<div class="col-md-12">
				<hr>
			</div>
			<div>
				<div class="col-md-12">
					<h1><i class="fas fa-check-square"></i> Estado</h1>
				</div>
				<div class="col-md-4">
					<label class="text-danger">Producto:</label>
					<input type="hidden"  name="tipificacion" id="tipificacion" value="{{dato.tipificacion}}" class="form-control"  readonly="" >
					<input type="text" name="tipoVenta" value="TODO RIESGO" class="form-control"  readonly="">
				</div>
				
				<div class="col-md-4">
					<label for="">Tipo de persona (<label style="color: red;"> * </label>):</label>
					<select name="tipoPersona" id="tipoPersona" class="form-control" required>
						<option value="">Seleccione..</option>
						<option value="PERSONA NATURAL">PERSONA NATURAL</option>
						<option value="PERSONA JURIDICA">PERSONA JURIDICA</option>
					</select>					
				</div>
				<div class="col-md-4" id="divcedula" name="divcedula">
						<label class="text-danger" name="labelcedulaTitular" id="labelcedulaTitular" style="display:none">Identificación:</label>
						<input type="text" name="cedulaTitular" id="cedulaTitular" class="form-control"  value="{{dato.cedulaCliente}}" style="display:none">
				</div>
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<div class="emitir">
				<div class="col-md-12">
					<h1><i class="fas fa-thumbs-up"></i> Emitir  </h1>
				</div>
				<div class="col-md-6">
					<br>
					<label for="date-picker-4">Fecha Vigencia (<label style="color: red;"> * </label>)</label>
					<div class="control-group">
						<div class="controls">
							<div class="input-group">
								<input id="date-picker-4" required autocomplete="off" name="fechaVigencia" type="text" data-date-format="dd-mm-yyyy" class="date-picker form-control" placeholder="dd-mm-aaaa" value="{{dato.fvigenciaTr}}" />
								<label for="date-picker-4" class="input-group-addon btn"><span class="fa fa-calendar"></span>
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<br>
					<label for="">Aseguradora para Emisión (<label style="color: red;"> * </label>):</label>
					<select  name="aseguradora" required id="aseguradoras" class="form-control" >
						<option value="">Seleccione..</option>	
							{% for item3 in aseguradoras %}
						<option id="item3" value="{{item3.id}}">{{item3.aseguradora}}</option>
							{% endfor %}
					</select>
					<br>
					<br>
				</div>

				<div class="col-md-6">
					<label for="">Numero Poliza </label>
					<input type="text"  name="numeroPoliza" class="form-control" value="{{dato.numeroPoliza}}" placeholder="Número Poliza"  onkeyup="javascript:this.value=this.value.toUpperCase();">
				</div>

				<div class="col-md-6">
					<label for="">Prima </label>
					<input type="number"  name="prima" class="form-control" value="{{dato.prima}}" placeholder="Prima"  onkeyup="javascript:this.value=this.value.toUpperCase();">
				</div>
				<br>
			</div>
				<div class="col-md-12">
				<hr>
				</div>
			<div id="agendamiento">
					<div class="col-md-12">
					<h1><i class="fas fa-calendar-check"></i> Agendamiento de Venta</h1>
				</div>
				<div class="col-md-12">	
				<br>
				</div>
				<div class="col-md-12 well">
					<br>
					<h3 class="text-center">Detalles de Venta</h3>
					<br>
					<div class="col-md-6">
						<label for="">Valor Poliza (<label style="color: red;"> * </label>)</label>
						<input type="text" required onkeyup="format(this)" onchange="format(this)" name="valorPoliza" value="{{dato.valorPoliza}}" class="form-control number" placeholder="Valor Poliza">
						<br>
						<br>
					</div>
					<div class="col-md-6">
						<label for="">Forma de pago  (<label style="color: red;"> * </label>):</label>
						<select name="formaPago" id="formaPago" class="form-control" required>
							<option value="">Seleccione..</option>
							<option value="3">EFECTIVO</option>
							<option value="6">FINANCIADO</option>
							<option value="2">TARJETA CRÉDITO</option>
							<option value="1">TARJETA DÉBITO</option>
							<option value="5">TARJETA NOVUS</option>
						</select>
						<br>
					</div>
					<div class="col-md-12">
						<div class="col-md-6" id="div-3">
							<label class="text-danger">Valor Poliza Con Descuento (<label style="color: red;"> * </label>)</label>
							<input type="text" required name="valorPolizaDescuento" value="{{dato.valorDescuento}}"  onkeyup="format(this)" onchange="format(this)" id="valorPolizaDescuento" placeholder="Solo si aplica" class="form-control number">
							<br>
							<br>
						</div>
					</div> 
					<div class="col-md-12" id="div-4">
						<div class="col-md-4">
							<br>
							<label class="text-danger">Medio de financiación (<label style="color: red;"> * </label>)</label>
							<select name="medioFinanciacion" id="medioFinanciado" class="form-control" required>
								<option value="">Seleccione..</option>
								<option value="PICHINCHA">PICHINCHA</option>
								<option value="CREDIVALORES">CREDIVALORES</option>
								<option value="FINESA">FINESA</option>
								<option value="CREDIMAPFRE">CREDIMAPFRE</option>
								<option value="FINANSEGURO">FINANSEGURO</option>
								<option value="BOLIVAR">BOLIVAR</option>
							</select>
							<br>
							<br>
					</div>
					<div class="col-md-4">
							<br>
							<label class="text-danger">Valor de cuota (<label style="color: red;"> * </label>)</label>
							<input type="text" required name="valorCuota" value="{{dato.valorCuota}}" onkeyup="format(this)" onchange="format(this)" id="valorCuota" placeholder="Solo si aplica" class="form-control number">
							<br>
							<br>
					</div>
					<div class="col-md-4">
							<br>
							<label class="text-danger">Número de cuotas (<label style="color: red;"> * </label>)</label>
							<select name="numeroCuota" id="numeroCuota" class="form-control" required>
								<option value="">Seleccione..</option>
								<option value="3 CUOTAS">3 CUOTAS</option>
								<option value="4 CUOTAS">4 CUOTAS</option>
								<option value="5 CUOTAS">5 CUOTAS</option>
								<option value="6 CUOTAS">6 CUOTAS</option>
								<option value="7 CUOTAS">7 CUOTAS</option>
								<option value="8 CUOTAS">8 CUOTAS</option>
								<option value="9 CUOTAS">9 CUOTAS</option>
								<option value="10 CUOTAS">10 CUOTAS</option>
							</select>
							<br>
							<br>
						</div>
					</div>
					<br><br><br><br><br><br>
					<!-- <div class="col-md-12" id="cedulaTitular">
						<label for="">Cedula :</label>
						<input type="text" name="cedulaTitular"  value="{{dato.cedulaTitular}}" class="form-control" placeholder="Nombre">
						<br>
						<br>
						<br>
					</div> -->
					<div class="col-md-4">
						<label for="">Nombre Empresa (<label style="color: red;"> * </label>):</label>
						<input type="text" name="nombreTitular" value="{{dato.nombreTitular}}" class="form-control" placeholder="Nombre" required>
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-4">
						<label for="">Dirección Empresa (<label style="color: red;"> * </label>):</label>
						<input type="text" name="direccionTitular" value="{{dato.direccionTitular}}" class="form-control" placeholder="Dirección" required>	
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-4">
						<label for="">Telefono Empresa (<label style="color: red;"> * </label>):</label>
						<input type="number" name="telefonoTitular"  value="{{dato.telefonoTitular}}" class="form-control" placeholder="Telefono" required>
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-4">
						<label for="" >Prenda (<label style="color: red;"> * </label>)</label>
						<input type="text" name="prenda" id="prenda"  value="{{dato.prenda}}" class="form-control" placeholder="Prenda" required>
						
					</div>
					<div class="col-md-4">
						<label for="">Estado Civil (<label style="color: red;"> * </label>):</label>
						<select name="estadoCivil" id="estadoCivil" class="form-control" required>
							<option value="">Seleccione..</option>
							<option value="SOLTERO(A)">SOLTERO(A)</option>
							<option value="CASADO(A)">CASADO(A)</option>
							<option value="UNION LIBRE">UNION LIBRE</option>
							<option value="SEPARADO(A)">SEPARADO(A)</option>
							<option value="VIUDO(A)">VIUDO(A)</option>
						</select>
						<br>	
					</div>
					<div class="col-md-4">
						<label for="">Actividad economica (<label style="color: red;"> * </label>):</label>
						<select name="actividadEconomica" id="actividadEconomica" class="form-control" required>
							<option value="">Seleccione..</option>
							<option value="EMPLEADO(A)">EMPLEADO(A)</option>
							<option value="INDEPENDIENTE">INDEPENDIENTE</option>
							<option value="TRANSPORTADOR(A)">TRANSPORTADOR(A)</option>
							<option value="RENTISTA CAPITAL">RENTISTA CAPITAL</option>
							<option value="OTRO(A)">OTRO(A)</option>
						</select>
						<br><br><br>
						<div class="col-md-12" id="Otro">
							<label for="">Cual (<label style="color: red;"> * </label>):</label>
							<input type="text" required class="form-control" onkeypress="return soloLetras(event)" name="actividadEconomicaOtro" value="{{dato.actividadEconomica}}" id="actividad">
							<br>
							<br>
						</div>
					</div>
					<div class="col-md-4">
						<label for="">Cargo (<label style="color: red;"> * </label>): </label>
						<input type="text" name="cargo"  value="{{dato.cargo}}" class="form-control" placeholder="Cargo" required>
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-4">
						<label for="">Profesión / Ocupación u oficio (<label style="color: red;"> * </label>):</label>
						<input type="text" name="profesion" required value="{{dato.profesion}}" class="form-control" placeholder="Profesión / Ocupación u oficio">
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-4">
						<label for=""> Ingresos  (<label style="color: red;"> * </label>):</label>
						<input type="text" required name="ingresos"  onkeyup="format(this)" onchange="format(this)"  value="{{dato.ingresos}}" class="form-control" placeholder=" Ingresos ">
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-4">
						<label for="">Egresos  (<label style="color: red;"> * </label>):</label>
						<input type="text" required name="egresos"  onkeyup="format(this)" onchange="format(this)"  value="{{dato.egresos}}" class="form-control" placeholder="Egresos">
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-4">
						<label for="">Total Activos (Vehiculos, inmuebles, maquinaria,etc) (<label style="color: red;"> * </label>):</label>
						<input type="text" name="totalActivos" required onkeyup="format(this)" onchange="format(this)"  value="{{dato.totalActivos}}" class="form-control" placeholder="Total Activos (Vehiculos, inmuebles, maquinaria,etc)">
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-4">
						<label for="">Total Pasivos (Deudas financieras,otras deudas,etc) (<label style="color: red;"> * </label>)</label>
						<input type="text" name="totalPasivos" required onkeyup="format(this)" onchange="format(this)"  value="{{dato.totalPasivos}}" class="form-control" placeholder="Total Pasivos (Deudas financieras,otras deudas,etc)">
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-6">
						<label for="">Patrimonio (<label style="color: red;"> * </label>):</label>				
						<input type="text" name="patrimonio" required value="{{dato.patrimonio}}" class="form-control" placeholder="Patrimonio">				
						
					</div>
					<div class="col-md-6">
						<label for="">Momento del día (<label style="color: red;"> * </label>):</label>
						<select name="momentoDia" id="momentoDia" class="form-control" required>
							<option value="">Seleccione..</option>
							<option value="AM">AM</option>
							<option value="PM">PM</option>
						</select>
						<br>
						
					</div>
						<div class="col-md-6">
								<br>
								<br>
							<label>Dirección Entrega (<label style="color: red;"> * </label>): </label>
							<input type="text" name="direccionEntrega" id="direccionEntrega" required class="form-control" value="{{dato.direccionEntrega}}" placeholder="Dirección de entrega">
						</div>
					<!-- termina aqui -->
					<div class="col-md-6">
						<br><br>
						<label for="date-picker-2" class="control-label">Fecha Entrega (<label style="color: red;"> * </label>):</label>
							<div class="control-group">
								<div class="controls">
									<div class="input-group">
										<input id="date-picker-2" required autocomplete="off" name="fechaEntrega" data-date-format="dd-mm-yyyy"  value="{{dato.fechaEntrega}}" type="text" class="date-picker-fechaentrega form-control" placeholder="dd-mm-aaaa" />
										<label for="date-picker-2" class="input-group-addon btn"><span class="fa fa-calendar"></span>
								</label>
							</div>
						</div>
					</div>
					<br>
					<br>
					</div>
					<div class="col-md-6">
						<label for="">Localidad (<label style="color: red;"> * </label>):</label>
						<select name="localidad" id="localidad" class="form-control" required>
							<option value="">Seleccione..</option>
							{% for item in localidades %}
								<option value="{{item.id}}">{{item.localidad}}</option>
							{% endfor %}
						</select>
					<br>
					<br>
					</div>
					<div class="col-md-6">
							<label for="">Barrio (<label style="color: red;"> * </label>):</label>
							<select name="barrio" id="barrio" class="form-control" required>
							{% if barrio is defined %}
								<option value="{{barrio.id}}" selected>{{barrio.barrio}}</option>
							{% else %}
								<option value="">Seleccione..</option>
							{% endif %}
							</select>
						<br>
						<br>
					</div>
					<div class="col-md-6">
						<br>
						<label for="">Indicaciones de dirección (<label style="color: red;"> * </label>):</label>
						<br><br>
						<div class="col-md-6">
							<textarea name="indicacionDireccion" required id="" cols="60" rows="5">{{dato.indicacionDireccion}}</textarea>
						</div>
						<br><br>
					</div>
					<div class="col-md-6">
						<br>
						<label for="">Observaciones (<label style="color: red;"> * </label>):</label>
						<br><br>
						<div class="col-md-6">
						<textarea name="observaciones" required id="" cols="60" rows="5">{{dato.observaciones}}</textarea>
						<input  name="nombreCliente" type="hidden" value="{{dato.nombreCliente}}" />
						<input  name="cedulaCliente" type="hidden" value="{{dato.cedulaCliente}}" />
						<!-- <input  name="fechaVencimiento" type="hidden" value="{{dato.fechaVencimiento}}" /> -->
						<input type="hidden" name="placa" value="{{dato.placa}}">
						<input type="hidden" name="inspeccionAprobada" value="{{dato.inspeccionAprobada}}">
						<input type="hidden" name="docRecibidos" value="{{dato.docRecibidos}}">
						</div>
						<br><br>
					</div>
					<br>
					<div class="col-md-4">
							<br><br>
								<h3>Maneja recursos publicos (<label style="color: red;"> * </label>)</h3>
		
							<div>
								<label style="	margin: 4px 10px 0;">
								<input type="radio" id="recursosPublicosSi"  class="option-input radio" name="recursosPublicos" value="SI" required/>
								SI
								</label>
								<label>
								<input type="radio" id="recursosPublicosNo"  class="option-input radio" name="recursosPublicos" value="NO" required/>
								NO
								</label>
								<br><br><br>
							</div>
						</div>

						<div class="col-md-4">
							<br><br>

							<h3>Ejerce algun grado de poder publico (<label style="color: red;"> * </label>)</h3>
							<div>
								<label style="	margin: 4px 10px 0;">
								<input type="radio" id="poderPublicoSi" class="option-input radio" name="poderPublico" value="SI" required/>
								SI
								</label>
						
								<label>
								<input type="radio" id="poderPublicoNo" class="option-input radio" name="poderPublico" value="NO" required/>
								NO
								</label>
								
								<br><br><br>
							</div>
						</div>
						<div class="col-md-4">
							<br><br>

							<h3>Goza de reconocimiento publico (<label style="color: red;"> * </label>)</h3>
							<div>
								<label style="	margin: 4px 10px 0;">
								<input type="radio" id="reconocimientoPublicoSi" class="option-input radio" name="reconocimientoPublico" value="SI" required/>
								SI
								</label>
								<label>
								<input type="radio" id="reconocimientoPublicoNo" class="option-input radio" name="reconocimientoPublico"  value="NO" required/>
								NO
								</label>
								<br><br><br>
							</div>
						</div>
						<div class="col-md-6">
							<br><br>

							<h3>Realiza operaciones en moneda extranjera (<label style="color: red;"> * </label>)</h3>
							<div>
								<label style="	margin: 4px 10px 0;">
								<input type="radio" id="monedaExtranjeraSi" class="option-input radio" name="monedaExtranjera" value="SI" required/>
								SI
								</label>
								<label>
								<input type="radio" id="monedaExtranjeraNo" class="option-input radio" name="monedaExtranjera" value="NO" required/>
								NO
								</label>
								<br><br><br>
							</div>
						</div>
						<div class="col-md-6" id="fondosProvienen">
							<br><br>

							<h3>El origen de sus fondos provienen de (<label style="color: red;"> * </label>)</h3>
							<label style="	margin: 4px 10px 0;">
								<input type="radio" id="fondosProvienenEmp" class="option-input radio"  name="fondosProvienen" value="Mi salario como empleado" required/>
								Mi salario como empleado
							</label>
							<label>
								<input type="radio" id="fondosProvienenInd" class="option-input radio" name="fondosProvienen" value="Mis ingresos como independiente" required/>
								Mis ingresos como independiente
							</label>
				
							<br>
							<br>
							<br>
							<br>
							<br>
						</div>
				</div>
				<button style="margin: 2% 0" class="btn btn-info form-control pull-right ver-dir" type="button">Confirmar dirección</button>
				<button style="margin: 2% 0" class="btn btn-info form-control pull-right ocu-dir" type="button">Ocultar dirección</button>
				<div class="col-md-12 ubicacion">
					<br><br>
					<iframe src="https://lupap.com/" width="1250" height="790" frameborder="1" scrolling="auto">

					</iframe>
				</div>
			</div>
			<button type="submit" class="btn btn-primary form-control">Guardar</button>
			<br>
			<br>
		</div>
	</form>
	<!-- {% endif %} -->
	<!-- {% endif %} -->
	<!-- {% endif %} -->		
</div>
	{% endif %}
</div>
	
	  <!-- Modal: modalAbandonedCart-->
	  <div class="modal fade right" id="modalAbandonedCart" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
		aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document" style="    width: 60%;">
		  <!--Content-->
		  <div class="modal-content">
			<!--Header-->
			<div class="modal-header">
			  <p class="heading">CENTRO DE INSPECCIÓN
			  </p>
	  
			  <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="    margin: -3% 0;">
				<span aria-hidden="true" class="white-text">&times;</span>
			  </button>
			</div>
	  
			<!--Body-->
			<div class="modal-body">
	  
			  <div class="row">
				<div class="col-3">
				  <p></p>
				  <p class="text-center"><i class="fas fa-car-side fa-4x"></i></p>
				</div>
				<div class="col-9">
						<p>Seleccioná el centro de inspección donde el cliente desea ir </p>
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
									<th>Ciudad CDA</th>
									<th>Direccion CDA</th>
									<th>Telefono CDA</th>
									<th>Horarios CDA</th>
									<th>Nombre CDA</th>
									<th>Select</th>
								</tr>
								</thead>
								<tbody>
								{% if data2 is empty %}
									No hay datos
								{% else %}
									{% for item in data2 %}
										
										<tr class="gradeX">
											<td>{{item.num}}</td>
											<td>{{item.ciudad}}</td>
											<td>{{item.direccion}}</td>
											<td>{{item.telefono}}</td>
											<td>{{item.horario}}</td>
											<td>{{item.nombre}}</td>
											<td class="text-center">
												<div id="centroInspeccion">
													<input type="hidden" name="edit" value="edit">
													<input type="hidden" name="centroInspeccion" value="{{item.id}}" id="idcda">
													<input type="hidden" name="" value="{{item.nombre}}" id="nombrecda">
													<button data-dismiss="modal" name="centroInspeccion" type="radio" class="idcentroInspeccion btn btn-info"><i class="far fa-hand-pointer fa-2x"></i></button>
												</div>
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
						<div class="modal-footer justify-content-center" style="margin-bottom: -8%">
								<a type="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">Cerrar</a>
							  </div>
							</div>
					</div>
			  </div>
			</div>
	  
			<!--Footer-->
		  <!--/.Content-->
		</div>
	  </div>
	  <!-- Modal: modalAbandonedCart-->

	   <!-- Modal: modalAbandonedCart-->
	   <div class="modal fade right" id="modalAbandonedCart1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
	   aria-hidden="true" data-backdrop="false">
	   <div class="modal-dialog modal-side modal-bottom-right modal-notify modal-info" role="document" style="    width: 60%;">
		 <!--Content-->
		 <div class="modal-content">
		   <!--Header-->
		   <div class="modal-header">
			 <p class="heading">HISTORICO DE LA PLACA
			 </p>
	 
			 <button type="button" class="close" data-dismiss="modal" aria-label="Close" style="    margin: -3% 0;">
			   <span aria-hidden="true" class="white-text">&times;</span>
			 </button>
		   </div>
	 
		   <!--Body-->
		   <div class="modal-body">
	 
			 <div class="row">
			   <div class="col-3">
				 <p></p>
				 <p class="text-center"><i class="far fa-address-book fa-4x"></i></p>
			   </div>
			   <!-- <div class="col-9">
					   <p>Seleccioná el centro de inspección donde el cliente desea ir </p>
					 </div> -->
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
									<th>Tipificacion</th>
									<th>Fecha Gestión</th>
									<th>Usuario Gestión</th>
									<th>Cliente</th>
									<th>Cedula Cliente</th>
									<th>Tipo Documentación</th>
							   </tr>
							   </thead>
							   <tbody>
							   {% if historico is empty %}
								   No hay datos
							   {% else %}
								   {% for item in historico %}
									   
									   <tr class="gradeX">
										   <td>{{item.num}}</td>
										   <td>{{item.tipificacion}}</td>
										   <td>{{item.fechaVenta}}</td>
										   <td>{{item.asesor}}</td>
										   <td>{{item.cliente}}</td>
										   <td>{{item.cedula}}</td>
										   <td>{{item.documentacion}}</td>
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
					   <div class="modal-footer justify-content-center" style="margin-bottom: -8%">
							   <a type="button" class="btn btn-outline-info waves-effect" data-dismiss="modal">Cerrar</a>
							 </div>
						   </div>
				   </div>
			 </div>
		   </div>
	 
		   <!--Footer-->
		 <!--/.Content-->
	   </div>
	 </div>
	 <!-- Modal: modalAbandonedCart-->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>


{% if dato is defined %}

<script>
	var localidad = '{{dato.localidad}}';
	var barrio = '{{dato.idbarrio}}';
	var codigoCiudad = '{{dato.codigoCiudad}}';
	//console.log('ciudad {{dato.codigoCiudad}}');
	var departamento = '{{dato.departamento}}';	
	var estadoCivil = '{{dato.estadoCivil}}';
	var aseguradoras = '{{dato.aseguradora}}';
	var marcas = '{{dato.marca}}';
	if('{{dato.actividadEconomica}}' == 'EMPLEADO(A)'){
		var actividadEconomica = '{{dato.actividadEconomica}}';	
	}
	else if('{{dato.actividadEconomica}}' == 'INDEPENDIENTE'){
		var actividadEconomica = '{{dato.actividadEconomica}}';	
	}
	else if('{{dato.actividadEconomica}}' == 'TRANSPORTADOR(A)'){
		var actividadEconomica = '{{dato.actividadEconomica}}';	
	}
	else if('{{dato.actividadEconomica}}' == 'RENTISTA CAPITAL'){
		var actividadEconomica = '{{dato.actividadEconomica}}';	
	}
	else if('{{dato.actividadEconomica}}' != 'EMPLEADO(A)'){
		var actividadEconomica = 'OTRO(A)';
	}
	else if('{{dato.actividadEconomica}}' != 'INDEPENDIENTE'){
		var actividadEconomica = 'OTRO(A)';
	}
	else if('{{dato.actividadEconomica}}' != 'TRANSPORTADOR(A)'){
		var actividadEconomica = 'OTRO(A)';
	}
	else if('{{dato.actividadEconomica}}' != 'RENTISTA CAPITAL'){
		var actividadEconomica = 'OTRO(A)';
	}
	var clase = '{{dato.claseVehiculo}}';
	var tipoPersona = '{{dato.tipoPersona}}';
	var vigenciaPoliza = '{{dato.vigenciaPoliza}}';
	var genero = '{{dato.genero}}';
	var documentacion = '{{dato.documentacion}}';
	var franjaRecaudo = '{{dato.franjaRecaudo}}';
	
	var formaPago = '{{dato.formaPago}}';
	var momentoDia = '{{dato.momentoDia}}';
	var inspeccion = '{{dato.inspeccion}}';
	var tipoAgendamiento = '{{dato.tipoAgendamiento}}';
	var centroInspeccion = '{{dato.centroInspeccion}}';
	var numeroCuota = '{{dato.numeroCuota}}';
	var medioFinanciado = '{{dato.medioFinanciado}}';
	
	$('#localidad').val(localidad);
	
	$('#departamento').val(departamento);
	$('#ciudad').val(codigoCiudad);
	
	$('#estadoCivil').val(estadoCivil);
	$('#actividadEconomica').val(actividadEconomica);
	$('#clase').val(clase);
	$('#aseguradoras').val(aseguradoras);
	$('#marcas').val(marcas);
	$('#tipoPersona').val(tipoPersona);
	$('#vigenciaPoliza').val(vigenciaPoliza);
	$('#genero').val(genero);
	$('#documentacion').val(documentacion);
	$('#franjaRecaudo').val(franjaRecaudo);
	$('#barrio').val(barrio);
	$('#formaPago').val(formaPago);
	$('#momentoDia').val(momentoDia);
	$('#inspeccion').val(inspeccion);
	$('#tipoAgendamiento').val(tipoAgendamiento);
	$('#centroInspeccion').val(centroInspeccion);
	$('#numeroCuota').val(numeroCuota);
	$('#medioFinanciado').val(medioFinanciado);
	if('{{dato.vigenciaPoliza}}' == 'SI'){
		$('#inspeccion').removeAttr('required');
	}else if('{{dato.vigenciaPoliza}}' == 'NO'){
		$('#inspeccion').attr('required',true);
	}

	if('{{dato.formaPago}}' != 6){
		$('#medioFinanciado').removeAttr('required');
	}else if('{{dato.formaPago}}' == 6){
		$('#medioFinanciado').attr('required',true);
	}

	
</script>
{% endif %}


<script>
	$(document).ready(function(){

		$('.idcentroInspeccion').click(function(){
			var id = $(this).parent().find('#idcda').val();
			var nombre = $(this).parent().find('#nombrecda').val();

			$('#idinspeccion').val(id);
			$('#nombreinspeccion').val(nombre);
			// $('#nombreinspeccion').attr('required',true);

		});

		$('.dataTables-example').DataTable({
			pageLength: 10,
			responsive: true,
			dom: '<"html5buttons"B>lTfgitp',
			buttons: [
				{extend: 'excel', title: 'Usuarios'},
				{extend: 'pdf', title: 'Usuarios'},

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

 {% if exito is defined  %}
<script>

	$("#Accion").hide();

</script>
{% endif %}
 {% if notFoundDB is defined  %}
<script>

	$("#Accion").hide();

</script>
{% endif %}


<script type="text/javascript">	



	if(tipoPersona == 'PERSONA JURIDICA'){
		$('#cedulaTitular').hide();
		$('#labelcedulaTitular').hide();
		
	}else{
		$('#cedulaTitular').show();
		$('#labelcedulaTitular').show();
	}

	if(vigenciaPoliza == 'SI'){
		$('#date-picker-3').removeAttr('required');
		$('#tipoInspeccion').hide();
		$('#fechaInspeccion').hide();
		$('#centroInspeccion').hide();

	}
	else if(vigenciaPoliza == 'NO'){

		$('#tipoInspeccion').show('slow');
		$('#tipoDocumentacion').show('slow');
		$('#date-picker-3').attr('required', 'true');
		
	}
	else{
		$('#tipoDocumentacion').hide();
		$('#tipoInspeccion').hide();
	}

	if(inspeccion == 'INSPECCIÓN DOMICILIARIA'){
		$('#fechaInspeccion').show('slow');
		$('#fechaInspeccion').find('input,select,textarea').attr('required' , 'true');
		$('#date-picker-3').removeAttr('required');
		$('#centroInspeccion').hide();
		

	}
	else if(inspeccion == 'INSPECCIÓN CDA'){
		$('#fechaInspeccion').hide();
		$('#centroInspeccion').show('slow');
		$('#date-picker-3').attr('required', 'true');
		$('#centroInspeccion').find('input,select,textarea').removeAttr('required');
		$('#fechaInspeccion').show('slow');


	}
	else{
		$('#fechaInspeccion').hide();
		$('#centroInspeccion').hide();
	}

	if(formaPago == 5){
		$("#div-3").show('slow');
		$("#div-4").hide();
		$('#medioFinanciacion').removeAttr('required');
		$('#valorCuota').removeAttr('required');
		$('#numeroCuota').removeAttr('required');
	}else if(formaPago == 1){
		$("#div-3").hide();
		$("#div-4").hide();
		$('#valorPolizaDescuento').removeAttr('required');
		$('#medioFinanciacion').removeAttr('required');
		$('#valorCuota').removeAttr('required');
		$('#numeroCuota').removeAttr('required');
	}else if(formaPago == 2){
		$("#div-3").hide();
		$("#div-4").hide();
		$('#valorPolizaDescuento').removeAttr('required');
		$('#medioFinanciacion').removeAttr('required');
		$('#valorCuota').removeAttr('required');
		$('#numeroCuota').removeAttr('required');
	}else if(formaPago == 3){
		$("#div-3").hide();
		$("#div-4").hide();
		$('#valorPolizaDescuento').removeAttr('required');
		$('#medioFinanciacion').removeAttr('required');
		$('#valorCuota').removeAttr('required');
		$('#numeroCuota').removeAttr('required');
	}else if(formaPago == 6){
		$("#div-3").hide();
		$("#div-4").show('slow');
		$('#valorPolizaDescuento').removeAttr('required');
		$('#valorCuota').attr('required',true);
		$('#numeroCuota').attr('required',true);
	}
	else{
		$("#div-3").hide();
		$("#div-4").hide();
		$('#valorPolizaDescuento').removeAttr('required');
		$('#medioFinanciacion').removeAttr('required');
		$('#valorCuota').removeAttr('required');
		$('#numeroCuota').removeAttr('required');
	}

	if(actividadEconomica == 'OTRO(A)'){
		$('#Otro').show('slow');
	}
	else{
		$('#Otro').hide();
		$('#actividad').removeAttr('required');
	}

	//funcion para traer el barrio
	$("#departamento").change(function(e) {

		var url = "{{url('administrador/editarRegistrosTodoRiesgo')}}";
		var parametros = {
			"departamento2" : $('#departamento').val()
		}
		$.ajax({
			type: "POST",
			url: url,
			data: parametros,
			success: function(data){
				console.log(data);
				var body = JSON.parse(data);

				var option = '<option>Seleccione..</option>';
				for (var i = 0; i < body.length; i++) {
					option+= '<option value="' + body[i]['id'] + '">' + body[i]['ciudad']+ '</option>';

				}
				$('#ciudad').html(option);

			}
		});
		e.preventDefault();
	});

	
	//funcion para traer el barrio dependiendo la localidad
	$("#localidad").change(function(e) {

		var url = "{{url('administrador/editarRegistrosTodoRiesgo')}}";
		var parametros = {
			"localidad2" : $('#localidad').val()
		}
		$.ajax({
			type: "POST",
			url: url,
			data: parametros,
			success: function(data){
				var body;
				//console.log(data);
				body = JSON.parse(data);
				console.log(body);
				//body=data;
				var option = '<option value="">Seleccione..</option>';
				for (var i = 0; i < Object.keys(body).length; i++) {
					option+= '<option value="' + body[i]['id'] + '">' + body[i]['barrio']+ '</option>';

				}
				$('#barrio').html(option);
			}
		});
		e.preventDefault();
	});

	//console.log("Entro");



	// Fecha de entrega
	$(".date-picker-fechaentrega").datepicker({
		startDate: '0d'
	});
	// Fecha de vigencia
	$(".date-picker-fechavigencia").datepicker({
		// startDate: '+1d'
	});
	// Fecha de vencimiento del tr
	$(".date-picker").datepicker({
		// startDate: '0d'
	});
		// Fecha de nacimiento
		$(".date-picker-fechanacimiento").datepicker({
		endDate: '-18y'
	});

	$(".date-picker-modelo").datepicker({
		startDate: '-15Y',
		endDate: '+1Y',
		format: " yyyy",
        viewMode: "years", 
    	minViewMode: "years"
	});


	
	function format(input){
        var num = input.value.replace(/\./g,"");
        if(!isNaN(num)){
        num = num.toString().split("").reverse().join("").replace(/(?=\d*\.?)(\d{3})/g,'$1.');
        num = num.split("").reverse().join("").replace(/^[\.]/, "");
        input.value = num;
        }

        else{ alert("Solo se permiten numeros");
        input.value = input.value.replace(/[^\d\.]*/g,"");
        }
    }

		{% if dato.recursosPublicos == 'SI' %}

		$('#recursosPublicosSi').attr('checked', true);

		{% endif %}


		{% if dato.recursosPublicos == 'NO' %}

		$('#recursosPublicosNo').attr('checked', true);

		{% endif %}

		{% if dato.poderPublico == 'SI' %}

		$('#poderPublicoSi').attr('checked', true);

		{% endif %}


		{% if dato.poderPublico == 'NO' %}

		$('#poderPublicoNo').attr('checked', true);

		{% endif %}

		{% if dato.reconocimientoPublico == 'SI' %}

		$('#reconocimientoPublicoSi').attr('checked', true);

		{% endif %}


		{% if dato.reconocimientoPublico == 'NO' %}

		$('#reconocimientoPublicoNo').attr('checked', true);

		{% endif %}

		{% if dato.monedaExtranjera == 'SI' %}

		$('#monedaExtranjeraSi').attr('checked', true);

		{% endif %}


		{% if dato.monedaExtranjera == 'NO' %}

		$('#monedaExtranjeraNo').attr('checked', true);

		{% endif %}


		{% if dato.fondosProvienen == 'Mi salario como empleado' %}

		$('#fondosProvienenEmp').attr('checked', true);

		{% endif %}


		{% if dato.fondosProvienen == 'Mis ingresos como independiente' %}

		$('#fondosProvienenInd').attr('checked', true);

		{% endif %}

	// $('#agendamientoPnatural').hide();
	// $('#agendamientoPjuridica').hide();
	// $('#volverLlamar').hide();
	// $('.ocu-dir').hide();
	// $('.ubicacion').hide();
	// $('#agendamiento').hide();
	// $('#tipoInspeccion').hide();
	// $('#fechaInspeccion').hide();
	// $('#centroInspeccion').hide();
	// $('#tipoDocumentacion').hide();
	// // $('#Otro').hide();
	// $("#div-3").hide();
	// $("#div-4").hide();

	$('.ver-dir').click(function(){
		$('.ubicacion').show();
		$('.ocu-dir').show();
		$('.ver-dir').hide();
	});

	$('.ocu-dir').click(function(){
		$('.ubicacion').hide();
		$('.ocu-dir').hide();
		$('.ver-dir').show();
	});


	// Descuento de la Tarjeta Novus

	$("#formaPago").change(function(){
		var formaPago = $(this).val();
		if(formaPago == 5){
			$("#div-3").show('slow');
			$("#div-4").hide();
			$('#medioFinanciacion').removeAttr('required');
			$('#valorCuota').removeAttr('required');
			$('#numeroCuota').removeAttr('required');
			$('#medioFinanciado').removeAttr('required');
			$('#valorPolizaDescuento').attr('required',true);
		}else if(formaPago == 1){
			$("#div-3").hide();
			$("#div-4").hide();
			$('#valorPolizaDescuento').removeAttr('required');
			$('#medioFinanciacion').removeAttr('required');
			$('#valorCuota').removeAttr('required');
			$('#numeroCuota').removeAttr('required');
			$('#medioFinanciado').removeAttr('required');
		}else if(formaPago == 2){
			$("#div-3").hide();
			$("#div-4").hide();
			$('#valorPolizaDescuento').removeAttr('required');
			$('#medioFinanciacion').removeAttr('required');
			$('#valorCuota').removeAttr('required');
			$('#numeroCuota').removeAttr('required');
			$('#medioFinanciado').removeAttr('required');
		}else if(formaPago == 3){
			$("#div-3").hide();
			$("#div-4").hide();
			$('#valorPolizaDescuento').removeAttr('required');
			$('#medioFinanciacion').removeAttr('required');
			$('#valorCuota').removeAttr('required');
			$('#numeroCuota').removeAttr('required');
			$('#medioFinanciado').removeAttr('required');
		}else if(formaPago == 6){
			$("#div-3").hide();
			$("#div-4").show('slow');
			$('#valorPolizaDescuento').removeAttr('required');
			$('#valorCuota').attr('required',true);
			$('#numeroCuota').attr('required',true);
			$('#medioFinanciado').attr('required',true);
		}
		else{
			$("#div-3").hide();
			$("#div-4").hide();
			$('#valorPolizaDescuento').removeAttr('required');
			$('#medioFinanciacion').removeAttr('required');
			$('#valorCuota').removeAttr('required');
			$('#numeroCuota').removeAttr('required');
			$('#medioFinanciado').removeAttr('required');
		}

	});
	

	
	//funcion para traer el estado de la poliza
	$('#actividadEconomica').change(function(){

		var actividadEconomica = $(this).val();

		if(actividadEconomica == 'OTRO(A)'){
			$('#Otro').show('slow');
		}
		else{
			$('#Otro').hide();
			$('#actividad').removeAttr('required');
		}
		
	});
	

	
	//funcion para traer el estado de la poliza
	$('#vigenciaPoliza').change(function(){

		var vigenciaPoliza = $(this).val();
		if(vigenciaPoliza == 'SI'){
			$('#date-picker-3').removeAttr('required');
			$('#tipoInspeccion').hide();
			$('#fechaInspeccion').hide();
			$('#centroInspeccion').hide();
			$('#inspeccion').removeAttr('required');

		}
		else if(vigenciaPoliza == 'NO'){

			$('#tipoInspeccion').show('slow');
			$('#tipoDocumentacion').show('slow');
			$('#date-picker-3').attr('required', 'true');
			// $('#tipoDocumentacion').find('input,select,textarea').removeAttr('required');
			$('#inspeccion').attr('required',true);
		}
		else{
			$('#tipoDocumentacion').hide();
			$('#tipoInspeccion').hide();
			$('#fechaInspeccion').hide();
			$('#inspeccion').removeAttr('required');
		}
		
	});
	//funcion para traer datos segun el tipo de visita
	$('#inspeccion').change(function(){

		var inspeccion = $(this).val();
		if(inspeccion == 'INSPECCIÓN DOMICILIARIA'){
			$('#fechaInspeccion').show('slow');
			$('#fechaInspeccion').find('input,select,textarea').attr('required' , 'true');
			$('#date-picker-3').removeAttr('required');
			$('#nombreinspeccion').removeAttr('required');
			$('#centroInspeccion').hide();
			

		}
		else if(inspeccion == 'INSPECCIÓN CDA'){
		
			$('#fechaInspeccion').hide();
			$('#centroInspeccion').show('slow');
			$('#date-picker-3').attr('required', 'true');
			$('#centroInspeccion').find('input,select,textarea').removeAttr('required');
			$('#nombreinspeccion').attr('required',true);
			$('#fechaInspeccion').show('slow');


		}
		else{
			$('#fechaInspeccion').hide();
			$('#centroInspeccion').hide();
			$('#nombreinspeccion').removeAttr('required');

		}
		
		
	});



	$('#agendamiento').show();
	$('#volverLlamar').hide();
	$('#agendamientoPnatural').hide();
	$('#agendamientoPjuridica').hide();
	$('#tipoDocumentacion').hide();
	$('.ocu-dir').hide();
	$('.ubicacion').hide();
	$('#tipoDocumentacion').show();
		//funcion para traer datos segun el tipo de visita



	$('#tipoPersona').change(function(){
		console.log("Entro");

		var tipoPersona = $(this).val();

		if(tipoPersona == 'PERSONA NATURAL'){
			//console.log("Entro Natural");
			$('#cedulaTitular').show();
			$('#labelcedulaTitular').show();
			
			
		}
		else if(tipoPersona == 'PERSONA JURIDICA'){
			//console.log("Entro Juridica");
			$('#cedulaTitular').hide();
			$('#labelcedulaTitular').hide();

		}
		else{
			$('#cedulaTitular').hide();
			$('#labelcedulaTitular').hide();
		}
			
			
	});

</script>

<script>

	$('.dirprop_oriviaE').attr('disabled', 'true');
	$('.dirprop_numplacaS').attr('disabled', 'true');
	$('.dirprop_oriviaS').attr('disabled', 'true');
	$('.dirprop_numplacaE').attr('disabled', 'true');
	document.getElementById("dirprop_bisl").disabled = true;

	function TIPO(){

		document.getElementById ("dirprop_tipovia").value;
		console.log(document.getElementById ("dirprop_tipovia").value)
	

		if (document.getElementById ("dirprop_tipovia").value == 'CLL')
		{
			console.log("calle")

			$('.dirprop_oriviaE').prop('checked', false); 
			$('.dirprop_numplacaS').prop('checked', false); 
			$('.dirprop_oriviaE').attr('disabled', 'true');
			$('.dirprop_numplacaS').attr('disabled', 'true');

			document.getElementById("dirprop_orivia").value = ' ';
			document.getElementById("dirprop_numplaca").value = ' ';

				$('.dirprop_oriviaS').attr('disabled', false);
			$('.dirprop_numplacaE').attr('disabled', false);

		}
		if (document.getElementById ("dirprop_tipovia").value == 'KR')
		{
			console.log("carrera")
			$('.dirprop_oriviaS').prop('checked', false); 
			$('.dirprop_numplacaE').prop('checked', false); 
				$('.dirprop_oriviaS').attr('disabled', 'true');	
			$('.dirprop_numplacaE').attr('disabled', 'true');	

			document.getElementById("dirprop_orivia").value = ' ';
			document.getElementById("dirprop_numplaca").value = ' ';

				$('.dirprop_oriviaE').attr('disabled', false);
			$('.dirprop_numplacaS').attr('disabled', false);

		}
		if (document.getElementById ("dirprop_tipovia").value == 'DG')
		{
			$('.dirprop_oriviaE').prop('checked', false); 
			$('.dirprop_numplacaS').prop('checked', false); 
				$('.dirprop_oriviaE').attr('disabled', 'true');
			$('.dirprop_numplacaS').attr('disabled', 'true');

			document.getElementById("dirprop_orivia").value = ' ';
			document.getElementById("dirprop_numplaca").value = ' ';

				$('.dirprop_oriviaS').attr('disabled', false);
			$('.dirprop_numplacaE').attr('disabled', false);
		}
		if (document.getElementById ("dirprop_tipovia").value == 'TR')
		{
			$('.dirprop_oriviaS').prop('checked', false); 
			$('.dirprop_numplacaE').prop('checked', false); 
				$('.dirprop_oriviaS').attr('disabled', 'true');	
			$('.dirprop_numplacaE').attr('disabled', 'true');	

			document.getElementById("dirprop_orivia").value = ' ';
			document.getElementById("dirprop_numplaca").value = ' ';

				$('.dirprop_oriviaE').attr('disabled', false);
			$('.dirprop_numplacaS').attr('disabled', false);

		}
		if (document.getElementById ("dirprop_tipovia").value == 'AV CLL.')
		{
			$('.dirprop_oriviaE').prop('checked', false); 
			$('.dirprop_numplacaS').prop('checked', false); 
				$('.dirprop_oriviaE').attr('disabled', 'true');
			$('.dirprop_numplacaS').attr('disabled', 'true');

			document.getElementById("dirprop_orivia").value = ' ';
			document.getElementById("dirprop_numplaca").value = ' ';

				$('.dirprop_oriviaS').attr('disabled', false);
			$('.dirprop_numplacaE').attr('disabled', false);

		}
		if (document.getElementById ("dirprop_tipovia").value == 'AV CR.')
		{
			$('.dirprop_oriviaS').prop('checked', false); 
			$('.dirprop_numplacaE').prop('checked', false); 
				$('.dirprop_oriviaS').attr('disabled', 'true');	
			$('.dirprop_numplacaE').attr('disabled', 'true');	

			document.getElementById("dirprop_orivia").value = ' ';
			document.getElementById("dirprop_numplaca").value = ' ';
			
				$('.dirprop_oriviaE').attr('disabled', false);
			$('.dirprop_numplacaS').attr('disabled', false);

		}
	}


	function ESTE1(){

		$('.dirprop_oriviaE').attr('checked', true);
		if ( $('.dirprop_oriviaE').is(':checked') )
		{
			document.getElementById("dirprop_orivia").value = 'ESTE';
			console.log("ESTE")
			$('.dirprop_oriviaS').attr('disabled', 'true');
			$('.dirprop_numplacaE').attr('disabled', 'true');	
		}else{

			document.getElementById("dirprop_orivia").value = ' ';
			console.log("nel")
			$('.dirprop_oriviaS').attr('disabled', false);
			$('.dirprop_numplacaE').attr('disabled', false);	
		}
	}

	function SUR1(){

		$('.dirprop_oriviaS').attr('checked', true);
		if ($('.dirprop_oriviaS').is(':checked'))
		{
			document.getElementById("dirprop_orivia").value = 'SUR';
			console.log("SUR")		
			$('.dirprop_oriviaE').attr('disabled', 'true');	
			$('.dirprop_numplacaS').attr('disabled', 'true');	
		
		}else{

			document.getElementById("dirprop_orivia").value = ' ';
			console.log("nel")	
			$('.dirprop_oriviaE').attr('disabled', false);
			$('.dirprop_numplacaS').attr('disabled', false);
		}
	}

	function ESTE(){

		$('.dirprop_numplacaE').attr('checked', true);
		if ($('.dirprop_numplacaE').is(':checked')) 
		{
			document.getElementById("dirprop_numplaca").value = 'ESTE';
			console.log("ESTE")
			

		}else{

			document.getElementById("dirprop_numplaca").value = ' ';
			console.log("nel")
			
		}	
	}

	function SUR(){

		$('.dirprop_numplacaS').attr('checked', true);
		if ($('.dirprop_numplacaS').is(':checked')) 
		{
			document.getElementById("dirprop_numplaca").value = 'SUR';
			console.log("SUR")			

		}else{

			document.getElementById("dirprop_numplaca").value = ' ';
			console.log("nel")	
			
		}
	

	}

	function BIS(){


		$('#dirprop_bis').attr('checked', true);
		if ($('#dirprop_bis').is(':checked')) 
		{
			document.getElementById("dirprop_bis").value = 'BIS';
			console.log("BIS")
			document.getElementById("dirprop_bisl").disabled = false;

		}else{

			document.getElementById("dirprop_bis").value = ' ';
			console.log("nel")
			document.getElementById("dirprop_bisl").disabled = true;
			document.getElementById("dirprop_bisl").value = ' ';
		}
	
	}

	function CAMBIO()
	{

		var tipvia = document.getElementById ("dirprop_tipovia").value;
		
		var numvia = document.getElementById ("dirprop_numvia").value;
	
		var apevia = document.getElementById ("dirprop_apevia").value;
		
		var bis = document.getElementById ("dirprop_bis").value;
		
		var bisl = document.getElementById ("dirprop_bisl").value;

		var orivia = document.getElementById ("dirprop_orivia").value;
	
		var numcrz = document.getElementById ("dirprop_numcruce").value;
		
		var apecrz = document.getElementById ("dirprop_apecruce").value;
		
		var oricrz = document.getElementById ("dirprop_oricruce").value;
		
		var numplaca = document.getElementById ("dirprop_numplaca").value;
		
		dir = tipvia;

		if(numvia != ''){
			dir = dir+ ' '+numvia
		}
		if(apevia != ''){
			dir = dir+ ' '+apevia
		}
		if(bis != ''){
			dir = dir+ ' '+bis
		}
		if(bisl != ''){
			dir = dir+ ' '+bisl
		}
		if(orivia != ''){
			dir = dir+ ' '+orivia
		}
		if(numcrz != ''){
			dir = dir+ ' # '+numcrz
		}
		if(apecrz != ''){
			dir = dir+ ' '+apecrz
		}
		if(oricrz != ''){
			dir = dir+ ' - '+oricrz
		}
		if(numplaca != ''){
			dir = dir+ ' '+numplaca
		}
		
		document.getElementById("direccionEntrega").value = dir;
	}
</script>

