<style>
	select{
		height: 33px!important;
	}
	.controls1 {
		background-color: #fff;
		border-radius: 2px;
		border: 1px solid transparent;
		box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
		box-sizing: border-box;
		font-family: Roboto;
		font-size: 15px;
		font-weight: 300;
		height: 29px;
		margin-left: 17px;
		margin-top: 10px;
		outline: none;
		padding: 0 11px 0 13px;
		text-overflow: ellipsis;
		width: 400px;
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
	.tab {
		overflow: hidden;
		border: 1px solid #ccc;
		background-color: #f1f1f1;
	}

	/* Style the buttons inside the tab */
	.tab button {
		background-color: inherit;
		float: left;
		border: none;
		outline: none;
		cursor: pointer;
		padding: 14px 16px;
		transition: 0.3s;
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
	
	#map {
		height: 500px;
		width: 100%;
	}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css">
<br>
<div class="wrapper ">
	<!-- Nueva vista para el formulario de Tarjetas -->


	{% if entregado is defined %}
	<br>
	<div class="alert alert-danger alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-ban"></i> La cedula {{entregado}} no se ha gestionado por el asesor.
    </div>
	{% endif %}
	{% if exito is defined %}
	<br>
	<div class="alert alert-info alert-dismissable" id="exito">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> La cedula {{exito}} fue registrada con exito en la Base de Datos.
    </div>
	{% endif %}
	
	{% if notFoundDB is defined %}
	<br>
	<div class="alert alert-danger alert-dismissable">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-ban"></i> La cedula {{notFoundDB}} no se encuenta en la Base de datos.
    </div>
	{% endif %}
	{% if otraCiudad is defined %}
	<br>
	<div class="alert alert-danger alert-dismissable" id="otraCiudad">
		<button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
		<i class="fas fa-ban"></i> La cedula existe en otra ciudad <b>{{otraCiudad}}</b>.
	</div>
	{% endif %}

	{% if dato is defined %}
	<!-- 	{% if !otraCiudad %} -->
		<!-- 	{% if !notFoundDB %} -->
	<form action="{{url('administrador/reagendar')}}" method="POST">
		<div id="Accion"  class="col-md-12 panel panel-primary">
						<input type="hidden" name="ciudad" value="{{dato.ciudad}}">
						<input type="hidden" name="cedula" value="{{dato.cedula}}">
						<input type="hidden" name="tarjeta" value="tarjeta">
			<br>
				<button 
					type="button" 
					class=" btn btn-primary pull-right" 
					
					onclick="location.href='editarRegistros'">
					VOLVER
				</button>
			<input type="hidden" value=" {{dato.id}}" name="id">
			<div class="col-md-12">
				<h1><i class="fas fa-address-card"></i><b> {{dato.nombreCliente}}</b></h1>
			</div>
			<div class="col-md-12">
				<h3 class="text-uppercase"><b>{{dato.email}} - CC {{dato.cedulaCliente}}</b></h3>
			</div>
			<!-- <div class="col-md-12">
				<h3>Fecha de Vencimiento: {{dato.fechaVigencia}}</h3>
			</div> -->
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-4">
				<label for="">Dirección del Cliente</label>
				<input type="text" name="direccionCliente"  readonly class="form-control" value="{{dato.direccionCliente}}" placeholder="Dirección">
			</div>
			<div class="col-md-4">
				<label for="">Teléfono</label>
				<input type="number" name="telefonoCliente" readonly class="form-control" value="{{dato.telefonoCliente}}" placeholder="Teléfono">
			</div>
			<div class="col-md-4">
				<label for="">Celular</label>
				<input type="number" name="celularCliente" readonly class="form-control" value="{{dato.celularCliente}}" placeholder="Celular">
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-12">
				<h1><i class="fas fa-car"></i> Información del Vehículo</h1>
			</div>
			<div class="col-md-6">

					<label for="" class="text-danger">Tipo Tarjeta</label>
					<input type="text" name="tipo" id="tipo" readonly value="{{dato.tipoNombre}}" class="form-control">
				</div>
			<div class="col-md-6">

				<label for="" class="text-danger">Cupo Tarjeta</label>
				<input type="number" name="cupo" id="cupo" readonly value="{{dato.cupo}}" class="form-control">
			</div>
			
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-12">
				<h1><i class="fas fa-check-square"></i> Estado</h1>
			</div>
			<div class="col-md-6">
					<!--Se modifico el select, ya que al registrar en el formulario Sac solo se tiene
					en cuenta Reagendar-->
					<select readonly name="tipificacion" id="tipificacion" class="form-control">
						<option value="90">REAGENDAR</option>
					</select>
			</div>
			<div class="col-md-6">
				<input type="text" readonly value="TARJETA NOVUS" class="form-control">
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<div id="agendamiento">
				<div class="col-md-12">
					<h1><i class="fas fa-calendar-check"></i> Agendamiento de Venta</h1>
				</div>
				<div class="col-md-12 well">
					<br>
					<br>
					<div class="col-md-6">
							<div class="col-md-4">
								<label for="">Perfil del cliente / Actividad economica (<label style="color: red;"> * </label>):</label>
							</div>
							<div class="col-md-8">
								<select name="actividadEconomica" id="actividadEconomica" class="form-control" required>
									<option value="">Seleccione..</option>
									<option value="EMPLEADO">EMPLEADO</option>
									<option value="INDEPENDIENTE">INDEPENDIENTE</option>
									<option value="TRANSPORTADOR">TRANSPORTADOR</option>
									<option value="RENTISTA CAPITAL">RENTISTA CAPITAL</option>
								</select>
							</div>
							<br>
							<br>
							<br>
					</div>
					<div class="col-md-6">
							<div class="col-md-4">
								<label for="">Estado Civil (<label style="color: red;"> * </label>):</label>
							</div>
							<div class="col-md-8">
								<select name="estadoCivil" id="estadoCivil" class="form-control" required>
									<option value="">Seleccione..</option>
									<option value="SOLTERO">SOLTERO</option>
									<option value="CASADO">CASADO</option>
									<option value="UNION LIBRE">UNION LIBRE</option>
									<option value="SEPARADO">SEPARADO</option>
									<option value="VIUDO">VIUDO</option>
								</select>
							</div>
							<br>
							<br>
							<br>
					</div>
					<div class="col-md-6">
							<div class="col-md-4">
								<label for="">Personas a cargo (<label style="color: red;"> * </label>):</label>
							</div>
							<div class="col-md-8">
								<select name="personasCargo" id="personasCargo" class="form-control" required>
									<option value="">Seleccione..</option>
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
							</div>
							<br>
							<br>
							<br>
					</div>
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="">Dirección de entrega (<label style="color: red;"> * </label>):</label>
						</div>
						<div class="col-md-8">
							<input type="text" name="direccionEntrega" id="direccionEntrega" value="{{dato.direccionEntrega}}" class="form-control" placeholder="Dirección de entrega" onkeydown="return false;" style="pointer-events: none; background-color: lightgray;"  required > <script type="text/javascript"> document.getElementById('direccionEntrega').style.cursor = "none"; </script> 
						</div>
						<br>
							<br>
							<br>
					</div>
					<div class="col-md-6">
							<div class="col-md-4">
								<label for="">Ultimo nivel de estudio terminado (<label style="color: red;"> * </label>):</label>
							</div>
							<div class="col-md-8">
								<select name="nivelEstudios" id="nivelEstudios" class="form-control" required>
									<option value="">Seleccione..</option>
									<option value="PRIMARIA">PRIMARIA</option>
									<option value="SECUNDARIA">SECUNDARIA</option>
									<option value="UNIVERSITARIO">UNIVERSITARIO</option>
									<option value="POSTGRADO">POSTGRADO</option>
									<option value="TECNICO">TECNICO</option>
									<option value="TECNOLOGO">TECNOLOGO</option>
									<option value="NINGUNO">NINGUNO</option>
								</select>
							</div>
							<br>
							<br>
							<br>
					</div>
					<div class="col-md-6">
							<div class="col-md-4">
								<label for="">Profesión / Ocupación u oficio (<label style="color: red;"> * </label>):</label>
							</div>
							<div class="col-md-8">
								<input type="text" name="profesion"  value="{{dato.profesion}}" class="form-control" placeholder="Profesión / Ocupación u oficio" required>
							</div>
							<br>
							<br>
							<br>
					</div>
					<div class="col-md-6">
							<div class="col-md-4">
								<label for="">Teléfono residencia (<label style="color: red;"> * </label>):</label>
							</div>
							<div class="col-md-8">
								<input type="number" min="1000000" max="3999999999" name="telefonoResidencia" value="{{dato.telefonoResidencia}}" class="form-control" placeholder="Teléfono residencia" required>
							</div>
							<br>
							<br>
							<br>
					</div>
					<div class="col-md-6">
							<div class="col-md-4">
								<label for="">Extensión:</label>
							</div>
							<div class="col-md-8">
								<input type="number" id="numero" name="extension" value="{{dato.extension}}" class="form-control" placeholder="Extensión">
							</div>
							<br>
							<br>
							<br>
					</div>

					<div class="col-md-6">
							<div class="col-md-4">
								<label for="">Total Activos (Vehiculos, inmuebles, maquinaria,etc) (<label style="color: red;"> * </label>):</label>
							</div>
							<div class="col-md-8">
								<input type="text" name="totalActivos"  onkeyup="format(this)" onchange="format(this)"  value="{{dato.totalActivos}}" class="form-control" placeholder="Total Activos (Vehiculos, inmuebles, maquinaria,etc)" required>
							</div>
							<br>
							<br>
							<br>
					</div>
					<div class="col-md-6">
							<div class="col-md-4">
								<label for="">Total Pasivos (Deudas financieras,otras deudas,etc) (<label style="color: red;"> * </label>)</label>
							</div>
							<div class="col-md-8">
								<input type="text" name="totalPasivos"  onkeyup="format(this)" onchange="format(this)"  value="{{dato.totalPasivos}}" class="form-control" placeholder="Total Pasivos (Deudas financieras,otras deudas,etc)" required>
							</div>
							<br>
							<br>
							<br>
							<br>
							<br>
					</div>
					<div class="col-md-12">
							<h1><i class="fas fa-address-card"></i> Titular de la tarjeta</h1>
						</div>
					<br>
					<br>
					<br>
					<br>
					<div class="col-md-6">
							<br>
						<label for="date-picker-1" class="control-label">Fecha Vigencia (<label style="color: red;"> * </label>):</label>
				
							<br>
						<div class="control-group">
		                    <div class="controls">
		                        <div class="input-group">
		                            <input id="date-picker-1" autocomplete="off" name="fechaVigencia" type="text" data-date-format="dd-mm-yyyy" class="date-picker-fechavigencia form-control" value="{{dato.fechaVigencia}}" placeholder="dd-mm-aaaa" required/>
		                            <label for="date-picker-1" class="input-group-addon btn"><span class="fa fa-calendar"></span>

		                            </label>
		                        </div>
		                    </div>
		                </div>
					</div>
					<div class="col-md-6">
							<br>
						<label for="date-picker-2" class="control-label">Fecha Entrega (<label style="color: red;"> * </label>):</label>
					
							<br>
						<div class="control-group">
		                    <div class="controls">
		                        <div class="input-group">
		                            <input id="date-picker-2" autocomplete="off" name="fechaEntrega" type="text" data-date-format="dd-mm-yyyy" class="date-picker-fechaentrega form-control" value="{{dato.fechaEntrega}}" placeholder="dd-mm-aaaa" required/>
		                            <label for="date-picker-2" class="input-group-addon btn"><span class="fa fa-calendar"></span>

		                            </label>
		                        </div>
		                    </div>
		                </div>
					</div>
					
					<div class="col-md-6">
							<br>
						<label for="">Localidad (<label style="color: red;"> * </label>):</label>
					
							<br>
						<select required name="localidad" id="localidad" class="form-control" required>
							<option value="">Seleccione..</option>
							{% for item in localidades %}
								<option value="{{item.id}}">{{item.localidad}}</option>
							{% endfor %}
						</select>
					</div>
					<div class="col-md-6">
							<br>
						<label for="">Barrio (<label style="color: red;"> * </label>):</label>
						<select required name="barrio" id="barrio" class="form-control">
							{% if barrio is defined %}
								<option value="{{barrio.id}}" selected>{{barrio.barrio}}</option>
							{% else %}
								<option value="">Seleccione..</option>
							{% endif %}
						</select>
					</div>
				
					<div class="col-md-6">
							<br>
						<label for="">Momento del día (<label style="color: red;"> * </label>):</label>
					
							<br>
						<select required name="momentoDia" id="momentoDia" class="form-control" required>
							<option value="">Seleccione..</option>
							<option value="AM">AM</option>
							<option value="PM">PM</option>
						</select>
					</div>

					<div class="col-md-6">
							<br>
						<label for="">Indicaciones de dirección (<label style="color: red;"> * </label>):</label>
					
							<br>
						<textarea name="indicacionDireccion" id="" cols="82" rows="5" required>{{dato.indicacionDireccion}}</textarea>
						<input  name="nombreCliente" type="hidden" value="{{dato.nombreCliente}}" />
						<input  name="cedulaCliente" type="hidden" value="{{dato.cedulaCliente}}" />
					</div>

					<div class="col-md-12">
						<h1><i class="fas fa-address-card"></i> Asistencia </h1>
					</div>
					<br>
					<br>
					<br>
					<br>
					<div class="col-md-6">
						<br>
						<label for="">Asistencia:</label>
					
				
						<select required name="asistencia" id="asistencia" class="form-control">
							<option value="">Seleccione..</option>
							<option value="TIPO 1">TIPO 1</option>
							<option value="TIPO 2">TIPO 2</option>
							<option value="TIPO 3">TIPO 3</option>
							<option value="NO">NO</option>
						</select>
					</div>

					<div class="col-md-6">
						<br>
						<label for="">Placa </label>
						<br>
						<div class="row">
							<div class="col-md-2">
								<input type="text" name="placa1" id="placa1" maxlength="1"  class="form-control placa" placeholder="A" value=""  onkeypress="return soloLetras(event)"  onkeyup="javascript:this.value=this.value.toUpperCase();">
							</div>
							<div class="col-md-2">
								<input type="text" name="placa2" id="placa2"  maxlength="1"  class="form-control placa" placeholder="A" value=""  onkeypress="return soloLetras(event)"  onkeyup="javascript:this.value=this.value.toUpperCase();">
							</div>
							<div class="col-md-2">
								<input type="text" name="placa3" id="placa3" maxlength="1"  class="form-control placa" placeholder="A" value=""  onkeypress="return soloLetras(event)" onkeyup="javascript:this.value=this.value.toUpperCase();">
							</div>
							<div class="col-md-2">
								<input type="text" name="placa4" id="placa4" maxlength="1"  class="form-control placa" placeholder="1" size="10" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
							</div>
							<div class="col-md-2">
								<input type="text" name="placa5" id="placa5" maxlength="1"  class="form-control placa" placeholder="1" size="10" onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>
							</div>
							<div class="col-md-2">
								<input type="text" name="placa6" id="placa6" maxlength="1"  class="form-control placa" placeholder="1" value=""  onkeyup="javascript:this.value=this.value.toUpperCase();">
							</div>
						</div>
					</div>
		

					
				</div>
				<!-- inicia direcion generda -->
				<div class="col-md-12">
					<button style="margin: 2% 0" class="btn btn-info form-control pull-right ver-dir"
						type="button">Confirmar
						dirección</button>
					<button style="margin: 2% 0" class="btn btn-info form-control pull-right ocu-dir"
						type="button">Ocultar
						dirección</button>

					<!-- form de la direccion empieza aqui -->
					<div class="col-md-12 ubicacion">
						<div class="tab">
							<button type="button" class="tablinks GoogleB">Google maps</button>
							<button type="button" class="tablinks GeneradaB">Dirección Generada</button>
							<button type="button" class="tablinks manualB">Dirección Manual</button>
						</div>
						<div class="col-md-12 vr-google">
							<br>
							<div id="floating-panel">
								<div class="col-md-3">
									<input class=" form-control" id="address" type="textbox"
										value="Carrera 56 # 9 -09">
								</div>
								<div class="col-md-3">
									<input class="btn btn-info form-control" id="submit" type="button" value="Buscar">
								</div>
								<br>
							</div>
							<br>
							<br>
							<div id="map"></div>
						</div>

						<div id="Tokyo" class="tabcontent vr-manual">
							<div class="col-md-12">
								<br>
								<br>
							</div>
							<div class="col-md-6">
								<label> Carrera 56 # 9 -09, bogota</label>
								<div class="col-md-4">
									<label>Ejemplo</label>
									<label for="">Dirección de entrega:</label>
								</div>
								<div class="col-md-8">
									<input type="text" class="form-control direccionManual"  placeholder="Dirección de entrega">
								</div>
								<br>
								<br>
								<br>
							</div>
						</div>
						<div class="col-md-12 vr-Generada">
							<br>
							<br>
							<div>
								<select name="drtipo-dirrecion" id="drtipo-dirrecion" class="form-control">
									<option value="">--</option>
									<option value="Pueblo">Pueblo</option>
									<option value="Ciudad">Ciudad</option>
									<option value="Carretera">Carretera</option>
								</select>
								<br>
								<br>
							</div>

							<div class="Ciudad">
								<div class="col-md-12">
									<label>Ejemplo(*)</label>
									<br>
									<br>
								</div>
								<div class="row">
									<div style=" padding:0px 0px" class="col-md-1">
										<label style="text-align: center;">DG(*)</label>
										<select style="padding:0px 0px" name="dirprop_tipovia"
											id="dirprop_tipovia" class="form-control"
											onchange="TIPO();CAMBIO()">
											<!--;TIPO()  -->
											<option value="">--</option>
											<option value="CLL">CLL</option>
											<option value="KR">CR</option>
											<option value="DG">DG</option>
											<option value="TR">TR</option>
											<option value="AV CLL.">AV CLL.</option>
											<option value="AV CR.">AV CR.</option>
											<option value="AV">AV</option>
											<option value="AUTOPISTA">AUTOPISTA</option>
											<option value="CIRCUNVALAR">CIRCUNVALAR</option>
											<option value="MANZANA">MANZANA</option>
											<option value="VIA">VIA</option>
										</select>
									</div>
									<div class="col-md-2 ver-nom">
										<label>norte(*)</label>
										<input style="padding:0px 0px" type="" name="dirprop_nomvia"
											id="dirprop_nomvia" class="form-control" placeholder=""
											onchange="CAMBIO()">
									</div>
									<div style="padding:0px 0px" class="col-md-2 vr-manzana">
										<label style="text-align: center;">LOTE(*)</label>
										<select style="padding:0px 0px" name="dirprop_tipoman"
											id="dirprop_tipoman" class="form-control" onchange="CAMBIO()">
											<!--;TIPO()  -->
											<option value="">--</option>
											<option value="SECTOR">SECTOR</option>
											<option value="LOTE">LOTE</option>
											<option value="INTERIOR">INTERIOR</option>
										</select>
									</div>
									<div class="col-md-1">
										<label>84(*)</label>
										<input style="padding:0px 0px" type="number" name="dirprop_numvia"
											id="dirprop_numvia" class="form-control" placeholder=""
											onchange="CAMBIO()">
									</div>
									<div class="col-md-2 vr-manzana">
										<label>EL TREBOL CASA 5(*)</label>
										<input style="padding:0px 0px" type="" name="dirprop_nommuni"
											id="dirprop_nommuni" class="form-control" placeholder=""
											onchange="CAMBIO()">
									</div>
									<div style="padding:0px 0px" class="col-md-1 ver-general">
										<label>B</label>
										<select style="padding:0px 0px" name="dirprop_apevia"
											id="dirprop_apevia" class="form-control" onchange="CAMBIO()">
											<option value="">--</option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
											<option value="E">E</option>
											<option value="F">F</option>
											<option value="G">G</option>
											<option value="H">H</option>
											<option value="I">I</option>
											<option value="J">J</option>
											<option value="K">K</option>
											<option value="L">L</option>
											<option value="M">M</option>
											<option value="N">N</option>
											<option value="O">O</option>
											<option value="P">P</option>
											<option value="Q">Q</option>
											<option value="R">R</option>
											<option value="S">S</option>
											<option value="T">T</option>
											<option value="U">U</option>
											<option value="V">V</option>
											<option value="W">W</option>
											<option value="X">X</option>
											<option value="Y">Y</option>
											<option value="Z">Z</option>
										</select>
									</div>
									<div style="padding:0px 0px" class="col-md-1 ver-general">
										<label>BIS</label>
										<input type="checkbox" value="" name="dirprop_bis" id="dirprop_bis"
											onclick="BIS()" onchange="CAMBIO()" class="form-control">
									</div>
									<div style="padding:0px 0px" class="col-md-1 ver-general" id="bisval"
										name="bisval">
										<label>A</label>
										<select name="dirprop_bisl" id="dirprop_bisl" class="form-control"
											onchange="CAMBIO()">
											<option value="">--</option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
											<option value="E">E</option>
											<option value="F">F</option>
											<option value="G">G</option>
											<option value="H">H</option>
											<option value="I">I</option>
											<option value="J">J</option>
											<option value="K">K</option>
											<option value="L">L</option>
											<option value="M">M</option>
											<option value="N">N</option>
											<option value="O">O</option>
											<option value="P">P</option>
											<option value="Q">Q</option>
											<option value="R">R</option>
											<option value="S">S</option>
											<option value="T">T</option>
											<option value="U">U</option>
											<option value="V">V</option>
											<option value="W">W</option>
											<option value="X">X</option>
											<option value="Y">Y</option>
											<option value="Z">Z</option>
										</select>
									</div>
									<div class="col-md-1 ver-general">
										<label>SUR</label>
										<br>
										<label>E</label> <input type="checkbox" value="" name="dirprop_oriviaE"
											class="dirprop_oriviaE" id="dirprop_orivia" onclick="ESTE1()"
											onchange="CAMBIO()">
										<br>
										<label>S</label> <input type="checkbox" value="" name="dirprop_oriviaS"
											class="dirprop_oriviaS" id="dirprop_orivia" onclick="SUR1()"
											onchange="CAMBIO()">
									</div>
									<div class="col-md-1 ver-general">
										<label>No.8(*)</label>
										<input style="padding:0px 0px" type="number" name="dirprop_numcruce"
											id="dirprop_numcruce" class="form-control" placeholder=""
											onchange="CAMBIO()">
									</div>
									<div class="col-md-1 ver-general">
										<label>B</label>
										<select style="padding:0px 0px" name="dirprop_apecruce"
											id="dirprop_apecruce" class="form-control" onchange="CAMBIO()">
											<option value="">--</option>
											<option value="A">A</option>
											<option value="B">B</option>
											<option value="C">C</option>
											<option value="D">D</option>
											<option value="E">E</option>
											<option value="F">F</option>
											<option value="G">G</option>
											<option value="H">H</option>
											<option value="I">I</option>
											<option value="J">J</option>
											<option value="K">K</option>
											<option value="L">L</option>
											<option value="M">M</option>
											<option value="N">N</option>
											<option value="O">O</option>
											<option value="P">P</option>
											<option value="Q">Q</option>
											<option value="R">R</option>
											<option value="S">S</option>
											<option value="T">T</option>
											<option value="U">U</option>
											<option value="V">V</option>
											<option value="W">W</option>
											<option value="X">X</option>
											<option value="Y">Y</option>
											<option value="Z">Z</option>
										</select>
									</div>
									<div style="padding:0px 0px" class="col-md-1 ver-general">
										<label>62</label>
										<input style="padding:0px 0px" type="number" name="dirprop_oricruce"
											id="dirprop_oricruce" class="form-control" placeholder=""
											onchange="CAMBIO()" maxlength="3">
									</div>
									<div class="col-md-1 ver-general">
										<label>ESTE</label>
										<br>
										<label>E</label> <input type="checkbox" value="" name="dirprop_numplaca"
											class="dirprop_numplacaE" id="dirprop_numplaca" onclick="ESTE()"
											onchange="CAMBIO()">
										<br>
										<label>S</label> <input type="checkbox" value="" name="dirprop_numplaca"
											class="dirprop_numplacaS" id="dirprop_numplaca" onclick="SUR()"
											onchange="CAMBIO()">
									</div>
									<div style="padding:0px 0px" class="col-md-2">
										<label style="text-align: center;">BOGOTA(*)</label>
										<select style="padding:0px 0px" name="dirprop_tipociu"
											id="dirprop_tipociu" class="form-control" onchange="CAMBIO()">
											<!--;TIPO()  -->
											<option value="">--</option>
											{% for item in ciudades %}
											<option value="{{item.ciudad}}">{{item.ciudad}}</option>
											{% endfor %}
											<option value="SOACHA">SOACHA</option>
											<option value="CUNDINAMARCA">CUNDINAMARCA</option>
										</select>
									</div>
								</div>
							</div>
							<div class="row Pueblo">
								<div class="col-md-1">

								</div>
								<div class="col-md-2">
									<label style="text-align: center;">DG(*)</label>
									<select style="padding:0px 0px" name="dirprop_tipoviaP"
										id="dirprop_tipoviaP" class="form-control" onchange="CAMBIOP()">
										<!--;TIPO()  -->
										<option value="">--</option>
										<option value="CLL">CLL</option>
										<option value="KR">CR</option>
										<option value="DG">DG</option>
										<option value="TR">TR</option>
									</select>
								</div>
								<div class="col-md-1">
									<label>84(*)</label>
									<input style="padding:0px 0px" type="number" name="dirprop_numviaP"
										id="dirprop_numviaP" class="form-control" placeholder=""
										onchange="CAMBIOP()">
								</div>
								<div class="col-md-1">
									<label>B</label>
									<select style="padding:0px 0px" name="dirprop_apeviaP" id="dirprop_apeviaP"
										class="form-control" onchange="CAMBIOP()">
										<option value="">--</option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="E">E</option>
										<option value="F">F</option>
										<option value="G">G</option>
										<option value="H">H</option>
										<option value="I">I</option>
										<option value="J">J</option>
										<option value="K">K</option>
										<option value="L">L</option>
										<option value="M">M</option>
										<option value="N">N</option>
										<option value="O">O</option>
										<option value="P">P</option>
										<option value="Q">Q</option>
										<option value="R">R</option>
										<option value="S">S</option>
										<option value="T">T</option>
										<option value="U">U</option>
										<option value="V">V</option>
										<option value="W">W</option>
										<option value="X">X</option>
										<option value="Y">Y</option>
										<option value="Z">Z</option>
									</select>
								</div>
								<div class="col-md-1">
									<label>No.8(*)</label>
									<input style="padding:0px 0px" type="number" name="dirprop_numcruceP"
										id="dirprop_numcruceP" class="form-control" placeholder=""
										onchange="CAMBIOP()">
								</div>
								<div class="col-md-1">
									<label>B</label>
									<select style="padding:0px 0px" name="dirprop_apecruceP"
										id="dirprop_apecruceP" class="form-control" onchange="CAMBIOP()">
										<option value="">--</option>
										<option value="A">A</option>
										<option value="B">B</option>
										<option value="C">C</option>
										<option value="D">D</option>
										<option value="E">E</option>
										<option value="F">F</option>
										<option value="G">G</option>
										<option value="H">H</option>
										<option value="I">I</option>
										<option value="J">J</option>
										<option value="K">K</option>
										<option value="L">L</option>
										<option value="M">M</option>
										<option value="N">N</option>
										<option value="O">O</option>
										<option value="P">P</option>
										<option value="Q">Q</option>
										<option value="R">R</option>
										<option value="S">S</option>
										<option value="T">T</option>
										<option value="U">U</option>
										<option value="V">V</option>
										<option value="W">W</option>
										<option value="X">X</option>
										<option value="Y">Y</option>
										<option value="Z">Z</option>
									</select>
								</div>
								<div class="col-md-1">
									<label>62</label>
									<input style="padding:0px 0px" type="number" name="dirprop_oricruceP"
										id="dirprop_oricruceP" class="form-control" placeholder=""
										onchange="CAMBIOP()" maxlength="3">
								</div>
								<div class="col-md-2">
									<label style="text-align: center;">MESITAS(*)</label>
									<select style="padding:0px 0px" name="dirprop_ciudadP" id="dirprop_ciudadP"
										class="form-control" onchange="CAMBIOP()">
										<!--;TIPO()  -->
										<option value="">--</option>
										{% for item in ciudades %}
											<option value="{{item.ciudad}}">{{item.ciudad}}</option>
											{% endfor %}
										<option value="SOACHA">SOACHA</option>
									</select>
								</div>
							</div>

							<div class="row Carretera">
								<div class="col-md-2">
									<label style="text-align: center;">KILOMETRO(*)</label>
									<select style="padding:0px 0px" name="dirprop_tipoviaC"
										id="dirprop_tipoviaC" class="form-control" onchange="CAMBIOC()">
										<!--;TIPO()  -->
										<option value="">--</option>
										<option value="KILOMETRO">KILOMETRO</option>
										<option value="VIA">VIA</option>
										<option value="VEREDA">VEREDA</option>
									</select>
								</div>
								<div class="col-md-1">
									<label>62</label>
									<input style="padding:0px 0px" type="number" name="dirprop_numC"
										id="dirprop_numC" class="form-control" placeholder=""
										onchange="CAMBIOC()" maxlength="3">
								</div>
								<div class="col-md-2">
									<label>Calera</label>
									<input style="padding:0px 0px" type="text" name="dirprop_PuebloC"
										id="dirprop_PuebloC" class="form-control" placeholder=""
										onchange="CAMBIOC()">
								</div>
								<div class="col-md-2">
									<label style="text-align: center;">VIA(*)</label>
									<select style="padding:0px 0px" name="dirprop_tipoCar" id="dirprop_tipoCar"
										class="form-control" onchange="CAMBIOC()">
										<!--;TIPO()  -->
										<option value="">--</option>
										<option value="KILOMETRO">KILOMETRO</option>
										<option value="VIA">VIA</option>
										<option value="VEREDA">VEREDA</option>
									</select>
								</div>
								<div class="col-md-1">
									<label>62</label>
									<input style="padding:0px 0px" type="number" name="dirprop_numCA"
										id="dirprop_numCA" class="form-control" placeholder=""
										onchange="CAMBIOC()" maxlength="3">
								</div>
								<div class="col-md-2">
									<label>Calera</label>
									<input style="padding:0px 0px" type="text" name="dirprop_PuebloCa"
										id="dirprop_PuebloCa" class="form-control" onchange="CAMBIOC()"
										placeholder="">
								</div>
								<div class="col-md-2">
									<label style="text-align: center;">MESITAS(*)</label>
									<select style="padding:0px 0px" name="dirprop_loca" id="dirprop_loca"
										class="form-control" onchange="CAMBIOC()">
										<!--;TIPO()  -->
										<option value="">--</option>
										{% for item in ciudades %}
										<option value="{{item.ciudad}}">{{item.ciudad}}</option>
										{% endfor %}
										<option value="SOACHA">SOACHA</option>
									</select>
								</div>
							</div>
							<div class="col-md-3">
								
							</div>
							<div class="col-md-6">
								<br><br>
								<label>Dirección Generada: <span style="color:red;"><sup>*</sup></span> </label>
								<input type="text" name="direccion" id="direccionGenerada" required
									class="form-control" placeholder="Dirección" readonly="readonly">
							</div>

						</div>
					</div>
					<!-- termina aqui -->
	
			</div>
			<button type="submit" class="btn btn-primary form-control">Guardar</button>
			<br>
			<br>
		</div>
	</form>
	<!-- {% endif %} -->
	<!-- {% endif %} -->
	{% endif %}
</div>



<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9BN2M2d6aJIlUvMEFe6s7p2NNDrXd0do&callback=initMap">
	</script>
<script>

	
	function soloLetras(e) {
		key = e.keyCode || e.which;
		tecla = String.fromCharCode(key).toLowerCase();
		letras = " áéíóúabcdefghijklmnñopqrstuvwxyz";
		especiales = [8, 37, 39, 46];

		tecla_especial = false
		for (var i in especiales) {
			if (key == especiales[i]) {
				tecla_especial = true;
				break;
			}
		}

		if (letras.indexOf(tecla) == -1 && !tecla_especial)
			return false;
	}
	/// api  de  google

	//iniciar
	function initMap() {
		var map = new google.maps.Map(document.getElementById('map'), {
			center: { lat: 4.628583, lng: -74.112000 },
			zoom: 13
		});
		var geocoder = new google.maps.Geocoder();

		document.getElementById('submit').addEventListener('click', function () {
			geocodeAddress(geocoder, map);
		});
	}
	// geolocalizacion
	function geocodeAddress(geocoder, resultsMap) {
		var address = document.getElementById('address').value + " Colombia";
		geocoder.geocode({ 'address': address }, function (results, status) {
			if (status === 'OK') {
				resultsMap.setCenter(results[0].geometry.location);
				document.getElementById("direccionEntrega").value = address;
				var marker = new google.maps.Marker({
					map: resultsMap,
					position: results[0].geometry.location
				});
			} else {
				$('.GeneradaB').show();
				alert('dirrecion no encontrada ' + address);
			}
		});
	}
</script>
{% if dato is defined %}
	<script>
		var ciudad = '{{dato.ciudad}}';
		var cedula = '{{dato.cedula}}';
		var localidad = '{{dato.localidad}}';
		var actividadEconomica = '{{dato.actividadEconomica}}';
		var estadoCivil = '{{dato.estadoCivil}}';
		var personasCargo = '{{dato.personasCargo}}';
		var nivelEstudios = '{{dato.nivelEstudios}}';
		var barrio = '{{dato.barrio}}';
		var momentoDia = '{{dato.momentoDia}}';
		var asistencia = '{{dato.asistencia}}';
		var placa = '{{dato.placa}}';
		
		$('#placa1').val(placa[0]);
		$('#placa2').val(placa[1]);
		$('#placa3').val(placa[2]);
		$('#placa4').val(placa[3]);
		$('#placa5').val(placa[4]);
		$('#placa6').val(placa[5]);
		$('#asistencia').val(asistencia);
		$('#ciudad').val(ciudad);
		$('#cedula').val(cedula);
		$('#actividadEconomica').val(actividadEconomica);
		$('#estadoCivil').val(estadoCivil);
		$('#personasCargo').val(personasCargo);
		$('#nivelEstudios').val(nivelEstudios);
		$('#localidad').val(localidad);
		//$('#barrio').val(barrio);
		$('#momentoDia').val(momentoDia);
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
<!-- {% if notFoundDB is defined %} -->
<script>

	$("#notFoundDB").show();


</script>
<!-- {% endif %} -->


 {% if exito is defined  %}
<script>

	$("#Accion").hide();

</script>
{% endif %}


{% if entregado is defined %}
<script>
$("#otraCiudad").hide();
</script>

{% endif %}

<script type="text/javascript">

var input=  document.getElementById('numero');
input.addEventListener('input',function(){
	if (this.value.length > 3) 
		this.value = this.value.slice(0,3); 
	})

$('#asistencia').change(function(e){

	if(	$('#asistencia').val() != 'NO'){
		
		$('.placa').attr('required', true);
	}else{
		$('.placa').removeAttr('required');

	}
});
function format(input){
	var num = input.value.replace(/\./g,"");
	if(!isNaN(num)){
		num = num.toString().split("").reverse().join("").replace(/(?=\d*\.?)(\d{3})/g,'$1.');
		num = num.split("").reverse().join("").replace(/^[\.]/, "");
		input.value = num;
	}else{ alert("Solo se permiten numeros");
		input.value = input.value.replace(/[^\d\.]*/g,"");
	}
}

$('#agendamiento').show();
$('#volverLlamar').hide();




//funcion para traer el barrio dependiendo la localidad
	$("#localidad").change(function(e) {
		//console.log("entro");
		var url = "{{url('administrador/editarRegistrosTarjeta')}}";
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
				//console.log(body);
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
	

</script>
<script>
	$('.vr-manzana').hide();
	// $('#agendamiento').find('input,select,textarea').attr('required', 'true');
	$('#volverLlamar').hide();
	$('.ocu-dir').hide();
	$('.ubicacion').hide();
	$('.Ciudad').hide();
	$('.Pueblo').hide();
	$('.Carretera').hide();
	$('.vr-Generada').hide();
	$('.vr-manual').hide();
	$('.manualB').hide();
	$('.GeneradaB').hide();
	$('.vr-google').hide();
	$('.dirprop_nomvia').hide();
	$('.ver-nom').hide();

	
	$('.direccionManual').keyup(function () {
		var direccionManual = $(this).val();
		document.getElementById("direccionEntrega").value = direccionManual+ " Colombia" ;;
	});

	//combox de direcion generda para la visualizacion 
	$('#drtipo-dirrecion').change(function () {
		var drtipo = $(this).val();
		$('.GeneradaB').show();
		$('.manualB').show();
		if (drtipo == 'Ciudad') {
			$('.Ciudad').show();
			$('.Pueblo').hide();
			$('.Carretera').hide();
			document.getElementById("direccionGenerada").value = '';
			document.getElementById("direccionEntrega").value = '';
		}
		if (drtipo == 'Pueblo') {
			$('.Ciudad').hide();
			$('.Pueblo').show();
			$('.Carretera').hide();
			document.getElementById("direccionGenerada").value = '';
			document.getElementById("direccionEntrega").value = '';
		}
		if (drtipo == 'Carretera') {
			$('.Ciudad').hide();
			$('.Pueblo').hide();
			$('.Carretera').show();
			document.getElementById("direccionGenerada").value = '';
			document.getElementById("direccionEntrega").value = '';

		}
	});
	//funcionpara habilitar direccion manual ciudad
	$("#dirprop_tipociu").change(function (e) {
		var direccion = $("#direccionGenerada").val();
		direccion = direccion +',Colombia';
        direccion = encodeURIComponent(direccion);
    	var url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + direccion + "&key=AIzaSyA9BN2M2d6aJIlUvMEFe6s7p2NNDrXd0do";
		var response = file_get_contents(url); 
        var json = JSON.parse(response);
    	if(json['results'] == " "){
			$('.manualB').show();
			alert("No se encuentra la direccion ingresada");
        }else{
            var lat = json['results'][0]['geometry']['location']['lat'];
            var lng = json['results'][0]['geometry']['location']['lng'];
		}
		e.preventDefault();
	});
	//funcionpara habilitar direccion manual pueblo
	$("#dirprop_ciudadP").change(function (e) {
		var direccion = $("#direccionGenerada").val();
		direccion = direccion +',Colombia';
        direccion = encodeURIComponent(direccion);
    	var url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + direccion + "&key=AIzaSyA9BN2M2d6aJIlUvMEFe6s7p2NNDrXd0do";
		var response = file_get_contents(url); 
        var json = JSON.parse(response);
    	if(json['results'] == " "){
			$('.manualB').show();
			alert("No se encuentra la direccion ingresada");
        }else{
            var lat = json['results'][0]['geometry']['location']['lat'];
            var lng = json['results'][0]['geometry']['location']['lng'];
		}
		e.preventDefault();
	});
	//funcionpara habilitar direccion manual pueblo
	$("#dirprop_loca").change(function (e) {
		var direccion = $("#direccionGenerada").val();
		direccion = direccion +',Colombia';
        direccion = encodeURIComponent(direccion);
    	var url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + direccion + "&key=AIzaSyA9BN2M2d6aJIlUvMEFe6s7p2NNDrXd0do";
		var response = file_get_contents(url); 
        var json = JSON.parse(response);
    	if(json['results'] == " "){
			$('.manualB').show();
			alert("No se encuentra la direccion ingresada");
        }else{
            var lat = json['results'][0]['geometry']['location']['lat'];
            var lng = json['results'][0]['geometry']['location']['lng'];
		}
		e.preventDefault();
	});
	function file_get_contents( url ) { // Reads entire file into a string
    var req = null;
    try { req = new ActiveXObject("Msxml2.XMLHTTP"); } catch (e) {
        try { req = new ActiveXObject("Microsoft.XMLHTTP"); } catch (e) {
            try { req = new XMLHttpRequest(); } catch(e) {}
        }
    }
    if (req == null) throw new Error('XMLHttpRequest not supported');
    req.open("GET", url, false);
    req.send(null);
    return req.responseText;
}

	//inicio de panel de control
	$('.GeneradaB').click(function () {
		$('.vr-Generada').show();
		$('.vr-google').hide();
		$('.vr-manual').hide();
		$('.manualB').show();
	});
	$('.GoogleB').click(function () {
		$('.vr-Generada').hide();
		$('.vr-google').show();
		$('.vr-manual').hide();
	});
	$('.manualB').click(function () {
		$('.vr-Generada').hide();
		$('.vr-google').hide();
		$('.vr-manual').show();
	});
	//fin del panel de control
	$('.ver-dir').click(function () {
		$('.ubicacion').show();
		$('.ocu-dir').show();
		$('.ver-dir').hide();
	});

	$('.ocu-dir').click(function () {
		$('.ubicacion').hide();
		$('.ocu-dir').hide();
		$('.ver-dir').show();
	});

</script>

<script>
	$('.dirprop_oriviaE').attr('disabled', 'true');
	$('.dirprop_numplacaS').attr('disabled', 'true');

	$('.dirprop_oriviaS').attr('disabled', 'true');
	$('.dirprop_numplacaE').attr('disabled', 'true');
	document.getElementById("dirprop_bisl").disabled = true;
	//direcion ciudad para definir el  tipo con visibilidad
	function TIPO() {

		$('#dirprop_apevia').removeAttr('required');
		$('#dirprop_bis').removeAttr('required');
		$('#dirprop_bisl').removeAttr('required');
		$('#dirprop_orivia').removeAttr('required');
		$('#dirprop_apecruce').removeAttr('required');
		$('#dirprop_numplaca').removeAttr('required');
		$('.ver-general').show();
		$('.ver-nom').hide();
		$('.vr-manzana').hide();
		document.getElementById("dirprop_tipovia").value;
		console.log(document.getElementById("dirprop_tipovia").value)


		if (document.getElementById("dirprop_tipovia").value == 'CLL') {
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
		if (document.getElementById("dirprop_tipovia").value == 'KR') {
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
		if (document.getElementById("dirprop_tipovia").value == 'DG') {
			$('.dirprop_oriviaE').prop('checked', false);
			$('.dirprop_numplacaS').prop('checked', false);
			$('.dirprop_oriviaE').attr('disabled', 'true');
			$('.dirprop_numplacaS').attr('disabled', 'true');

			document.getElementById("dirprop_orivia").value = ' ';
			document.getElementById("dirprop_numplaca").value = ' ';

			$('.dirprop_oriviaS').attr('disabled', false);
			$('.dirprop_numplacaE').attr('disabled', false);
		}
		if (document.getElementById("dirprop_tipovia").value == 'TR') {
			$('.dirprop_oriviaS').prop('checked', false);
			$('.dirprop_numplacaE').prop('checked', false);
			$('.dirprop_oriviaS').attr('disabled', 'true');
			$('.dirprop_numplacaE').attr('disabled', 'true');

			document.getElementById("dirprop_orivia").value = ' ';
			document.getElementById("dirprop_numplaca").value = ' ';

			$('.dirprop_oriviaE').attr('disabled', false);
			$('.dirprop_numplacaS').attr('disabled', false);

		}
		if (document.getElementById("dirprop_tipovia").value == 'AV CLL.') {
			$('.dirprop_oriviaE').prop('checked', false);
			$('.dirprop_numplacaS').prop('checked', false);
			$('.dirprop_oriviaE').attr('disabled', 'true');
			$('.dirprop_numplacaS').attr('disabled', 'true');

			document.getElementById("dirprop_orivia").value = ' ';
			document.getElementById("dirprop_numplaca").value = ' ';

			$('.dirprop_oriviaS').attr('disabled', false);
			$('.dirprop_numplacaE').attr('disabled', false);

		}
		if (document.getElementById("dirprop_tipovia").value == 'AV CR.') {
			$('.dirprop_oriviaS').prop('checked', false);
			$('.dirprop_numplacaE').prop('checked', false);
			$('.dirprop_oriviaS').attr('disabled', 'true');
			$('.dirprop_numplacaE').attr('disabled', 'true');

			document.getElementById("dirprop_orivia").value = ' ';
			document.getElementById("dirprop_numplaca").value = ' ';

			$('.dirprop_oriviaE').attr('disabled', false);
			$('.dirprop_numplacaS').attr('disabled', false);

		}
		if (document.getElementById("dirprop_tipovia").value == 'AV') {
			$('.dirprop_oriviaS').prop('checked', false);
			$('.dirprop_numplacaE').prop('checked', false);
			$('.dirprop_oriviaS').attr('disabled', false);
			$('.dirprop_numplacaE').attr('disabled', false);
			$('.ver-nom').show();;
		}
		if (document.getElementById("dirprop_tipovia").value == 'VIA') {
			$('.dirprop_oriviaS').prop('checked', false);
			$('.dirprop_numplacaE').prop('checked', false);
			$('.dirprop_oriviaS').attr('disabled', false);
			$('.dirprop_numplacaE').attr('disabled', false);
			$('.ver-nom').show();
		}
		if (document.getElementById("dirprop_tipovia").value == 'AUTOPISTA') {
			$('.dirprop_oriviaS').prop('checked', false);
			$('.dirprop_numplacaE').prop('checked', false);
			$('.dirprop_oriviaS').attr('disabled', false);
			$('.dirprop_numplacaE').attr('disabled', false);
			$('.ver-nom').show();
		}
		if (document.getElementById("dirprop_tipovia").value == 'MANZANA') {
			$('.dirprop_oriviaS').attr('disabled', 'true');
			$('.dirprop_numplacaE').attr('disabled', 'true');
			$('.ver-general').hide();
			$('.ver-nom').show();
			$('.vr-manzana').show();

		}


	}


	function ESTE1() {

		$('.dirprop_oriviaE').attr('checked', true);
		if ($('.dirprop_oriviaE').is(':checked')) {
			document.getElementById("dirprop_orivia").value;
			console.log("ESTE")
			$('.dirprop_oriviaS').attr('disabled', 'true');
			$('.dirprop_numplacaE').attr('disabled', 'true');
		} else {

			document.getElementById("dirprop_orivia").value;
			console.log("nel")
			$('.dirprop_oriviaS').attr('disabled', false);
			$('.dirprop_numplacaE').attr('disabled', false);
		}
	}

	function SUR1() {

		$('.dirprop_oriviaS').attr('checked', true);
		if ($('.dirprop_oriviaS').is(':checked')) {
			document.getElementById("dirprop_orivia").value = 'SUR';
			console.log("SUR")
			$('.dirprop_oriviaE').attr('disabled', 'true');
			$('.dirprop_numplacaS').attr('disabled', 'true');

		} else {

			document.getElementById("dirprop_orivia").value = ' ';
			console.log("nel")
			$('.dirprop_oriviaE').attr('disabled', false);
			$('.dirprop_numplacaS').attr('disabled', false);
		}
	}

	function ESTE() {

		$('.dirprop_numplacaE').attr('checked', true);
		if ($('.dirprop_numplacaE').is(':checked')) {
			document.getElementById("dirprop_numplaca").value;
			console.log("ESTE")


		} else {

			document.getElementById("dirprop_numplaca").value;
			console.log("nel")

		}
	}

	function SUR() {

		$('.dirprop_numplacaS').attr('checked', true);
		if ($('.dirprop_numplacaS').is(':checked')) {
			document.getElementById("dirprop_numplaca").value = 'SUR';
			console.log("SUR")

		} else {

			document.getElementById("dirprop_numplaca").value = ' ';
			console.log("nel")

		}


	}

	function BIS() {


		$('#dirprop_bis').attr('checked', true);
		if ($('#dirprop_bis').is(':checked')) {
			document.getElementById("dirprop_bis").value = 'BIS';
			console.log("BIS")
			document.getElementById("dirprop_bisl").disabled = false;

		} else {

			document.getElementById("dirprop_bis").value = ' ';
			document.getElementById("dirprop_bisl").disabled = true;
			document.getElementById("dirprop_bisl").value = ' ';
		}

	}
	//funcion para la direcion de la ciudad  se dividio
	//asi ya que si no tocaba jugar con la visibilidad movimiento 
	//option de cada elemento
	function CAMBIO() {
		var tipociu = document.getElementById("dirprop_tipociu").value;
		var tipvia = document.getElementById("dirprop_tipovia").value;
		var numvia = document.getElementById("dirprop_numvia").value;
		var nomvia = document.getElementById("dirprop_nomvia").value;
		var nommun = document.getElementById("dirprop_nommuni").value;
		var tipoman = document.getElementById("dirprop_tipoman").value;
		var apevia = document.getElementById("dirprop_apevia").value;
		var bis = document.getElementById("dirprop_bis").value;
		var bisl = document.getElementById("dirprop_bisl").value;
		var orivia = document.getElementById("dirprop_orivia").value;
		var numcrz = document.getElementById("dirprop_numcruce").value;
		var apecrz = document.getElementById("dirprop_apecruce").value;
		var oricrz = document.getElementById("dirprop_oricruce").value;
		var numplaca = document.getElementById("dirprop_numplaca").value;
		dir = tipvia;
		if (nomvia != '') {
			dir = dir + ' ' + nomvia
		}
		if (tipoman != '') {
			dir = dir + ' ' + tipoman
		}
		if (numvia != '') {
			dir = dir + ' ' + numvia
		}
		if (nommun != '') {
				dir = dir + ' ' + nommun
			}
		if (apevia != '') {
			dir = dir + ' ' + apevia
		}
		if (bis != '') {
			dir = dir + ' ' + bis
		}
		if (bisl != '') {
			dir = dir + ' ' + bisl
		}
		if (orivia != '') {
			dir = dir + ' ' + orivia
		}
		if (numcrz != '') {
			dir = dir + ' # ' + numcrz
		}
		if (apecrz != '') {
			dir = dir + ' ' + apecrz
		}
		if (oricrz != '') {
			dir = dir + ' - ' + oricrz
		}
		if (numplaca != '') {
			dir = dir + ' ' + numplaca
		}
		if (tipociu != '') {
			dir = dir + ' ' + tipociu
		}
		document.getElementById("direccionGenerada").value = dir;
		document.getElementById("direccionEntrega").value = dir;
	}
	//pueblo
	function CAMBIOP() {

		var tipviaP = document.getElementById("dirprop_tipoviaP").value;
		var numviaP = document.getElementById("dirprop_numviaP").value;
		var apeviaP = document.getElementById("dirprop_apeviaP").value;
		var numcrzP = document.getElementById("dirprop_numcruceP").value;
		var apecrzP = document.getElementById("dirprop_apecruceP").value;
		var oricrzP = document.getElementById("dirprop_oricruceP").value;
		var ciudadP = document.getElementById("dirprop_ciudadP").value;

		dir = tipviaP + ' ';
		if (numviaP != '') {
			dir = dir + ' ' + numviaP
		}
		if (apeviaP != '') {
			dir = dir + ' ' + apeviaP
		}
		if (numcrzP != '') {
			dir = dir + ' # ' + numcrzP
		}
		if (apecrzP != '') {
			dir = dir + ' ' + apecrzP
		}
		if (oricrzP != '') {
			dir = dir + ' - ' + oricrzP
		}
		if (ciudadP != '') {
			dir = dir + ' ' + ciudadP
		}
		console.log
		document.getElementById("direccionGenerada").value = dir;
		document.getElementById("direccionEntrega").value = dir;
	}
	//carretera
	function CAMBIOC() {

		var tipviaC = document.getElementById("dirprop_tipoviaC").value;
		var numviaC = document.getElementById("dirprop_numC").value;
		var apeviaC = document.getElementById("dirprop_PuebloC").value;
		var tipoCar = document.getElementById("dirprop_tipoCar").value;
		var numC = document.getElementById("dirprop_numCA").value;
		var PuebloCa = document.getElementById("dirprop_PuebloCa").value;
		var ciudadP = document.getElementById("dirprop_loca").value;

		dir = tipviaC + ' ';
		if (numviaC != '') {
			dir = dir + ' ' + numviaC
		}
		if (apeviaC != '') {
			dir = dir + ' ' + apeviaC
		}
		if (tipoCar != '') {
			dir = dir + ' ' + tipoCar
		}
		if (numC != '') {
			dir = dir + ' ' + numC
		}
		if (PuebloCa != '') {
			dir = dir + ' - ' + PuebloCa
		}
		if (ciudadP != '') {
			dir = dir + ' ' + ciudadP
		}
		document.getElementById("direccionGenerada").value = dir;
		document.getElementById("direccionEntrega").value = dir;

	}

</script>