<style>
    select{
        height: 33px!important;
    }
</style>
<!-- Nueva vista para el formulario de Soat -->
<hr>
{% if hecho is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> Datos actualizados con exito.
        </div>
    </div>
{% endif %}




{% if dato is defined %}
    <form action="{{url('administrador/reagendar')}}" method="POST">
		<div id="Accion"  class="col-md-12 panel panel-primary">
						<input type="hidden" name="ciudad" value="{{dato.ciudad}}">
						<input type="hidden" name="placa" value="{{dato.placa}}">
						<input type="hidden" value="soat" name="soat">
			<input type="hidden" value=" {{dato.id}}" name="id">
			<br>
				<button 
					type="button" 
					class=" btn btn-primary pull-right" 
					
					onclick="location.href='editarRegistros'">
					VOLVER
				</button>
			
			<div class="col-md-12">
				<h1><i class="fas fa-address-card"></i><b> {{dato.nombreCliente}}</b></h1>
                
			</div>
			<div class="col-md-12">
				<h3 class="text-uppercase"><b>{{dato.placa}} - CC {{dato.cedulaCliente}}</b></h3>
			</div>
			<div class="col-md-12">
				<h3>Fecha de Vencimiento: {{dato.fechaVigencia}}</h3>
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<div class="col-md-4">
				<label for="">Dirección del Cliente</label>
				<input type="text" name="direccionCliente" readonly onkeyup="javascript:this.value=this.value.toUpperCase();" class="form-control" value="{{dato.direccionCliente}}" placeholder="Dirección" min="3000000000" max="3999999999">
			</div>
			<div class="col-md-4">
				<label for="">Teléfono</label>
				<input type="number" name="telefonoCliente" readonly class="form-control" value="{{dato.telefonoCliente}}" placeholder="Teléfono" min="1000000" max="3999999999">
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
			<div class="col-md-4">
				<label for="">Clase de Vehículo (<label style="color: red;"> * </label>)</label>
				<select name="claseVehiculo" id="claseVehiculo" class="form-control" required>
					<option value="">Seleccione...</option>
					{% for item in clase %}
						<option value="{{item.iidCV}}">{{item.snombreCV}}</option>
					{% endfor %}
				</select>
			</div>	
			<div class="col-md-4">
				<label for="">Cilindraje</label>
				<select name="cilindraje" id="cilindraje" class="form-control">
					<option value="">Seleccione..</option>
					{% for item in cilindro %}
						<option value="{{item['id']}}">{{item['cilindraje']}}</option>
					{% endfor %}
				</select>
			</div>
			<div class="col-md-4">

				<label for="" class="text-danger">Valor SOAT</label>
				<input type="number" name="valorSoat" id="valorSoat" readonly value="{% if valorSoat is defined %}{{dato.valorSoat}}{% else %}{{item.valorSoat}}{% endif %}" class="form-control">
			</div>
			<div class="col-md-12">
				<hr>
			</div>
			<!-- <div class="col-md-12">
				<h1><i class="fas fa-check-square"></i> Estado</h1>
			</div> -->
			<!-- <div class="col-md-6">
					<!--Se modifico el select, ya que al registrar en el formulario Sac solo se tiene
					en cuenta Reagendar
					<select readonly name="tipificacion" id="tipificacion" class="form-control">
						<option value="78">REAGENDAR</option>
					</select>
			</div> -->
			<!-- <div class="col-md-6">
				<input type="text" readonly value="SOAT" class="form-control">
			</div> -->
			
			<div id="agendamiento">
				<div class="col-md-12">
					<h1><i class="fas fa-calendar-check"></i> Agendamiento de Venta</h1>
				</div>
				<div class="col-md-12 well">
					<div class="col-md-4">
						<label for="">Forma de pago (<label style="color: red;"> * </label>):</label>
					</div>
					<div class="col-md-8">
						<div class="col-md-8">
							<select required name="formaPago" id="formaPago" class="form-control">
								<option value="">Seleccione..</option>
								<option value="3">EFECTIVO</option>
								<option value="4">PAGO EN LÍNEA</option>
								<option value="2">TARJETA CRÉDITO</option>
								<option value="1">TARJETA DÉBITO</option>
								<option value="5">TARJETA NOVUS</option>
								<option value="9">PAGO AUTOMÁTICO</option>
							</select>
							<br>
							<div id="pai">
								<div id="div-3">
									<label class="text-danger">Valor SOAT Con Descuento</label>
									<input style="margin: 2%" type="text" name="valorSoatDescuento" id="valorSoatDescuento" placeholder="Solo si aplica" readonly class="form-control">
								</div>
							</div>
							<!-- Codigo que se agrega -->
							<div id="pai2">
								<div id="div-tarjeta" style = "padding-bottom: 30px;">
									<label class="text-danger">Seleccione una tarjeta</label>
									<select name="tarjetaPago" id="tarjeta" class="form-control">
										<option value="">Seleccione..</option>
										{% for tarjeta in tarjetas %}
											<option value="{{ tarjeta.id }}">{{ tarjeta.tarjeta }}</option>
										{% endfor %}
									</select>
								</div>
							</div>
							<div id="pai2">
								<div id="div-cuotas" style = "padding-bottom: 30px;">
									<label class="text-danger">Seleccione el número de cuotas</label>
									<select name="cuotasPago" id="cuotas" class="form-control">
										<option value="1">1</option>
										{% for i in 2..36 %}
											<option value="{{ i }}">{{ i }}</option>
										{% endfor %}
									</select>
								</div>
							</div>
							<!-- Fin codigo que se agrega -->
						</div>
					</div>
					<br>
					<br>
					<br>
					<h3 class="text-center">Titular del SOAT</h3>
					<br>
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="">Nombre (<label style="color: red;"> * </label>):</label>
						</div>
						<div class="col-md-8">
							<input type="text" name="nombreTitular" value="{{dato.nombreTitular}}" class="form-control" onkeypress="return soloLetras(event)" onkeyup="javascript:this.value=this.value.toUpperCase();" placeholder="Nombre">
						</div>
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="">Cédula (<label style="color: red;"> * </label>):</label>
						</div>
						<div class="col-md-8">
							<input type="number" name="cedulaTitular" value="{{dato.cedulaTitular}}" class="form-control" placeholder="Cédula" min="0">
						</div>
						<br>
						<br>
						<br>
					</div>
					 <div class="col-md-6">
						<div class="col-md-4">
							<label for="">Dirección:</label>
						</div>
						<div class="col-md-8">
							<input type="text" name="direccionTitular" value="{{dato.direccionTitular}}" class="form-control" onkeyup="javascript:this.value=this.value.toUpperCase();" placeholder="Dirección">
						</div>
						<br>
						<br>
						<br>
					</div> 
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="">Teléfono (<label style="color: red;"> * </label>):</label>
						</div>
						<div class="col-md-8">
							<input type="number" name="telefonoTitular" value="{{dato.telefonoTitular}}" class="form-control" placeholder="Teléfono" min="1000000" max="3999999999">
						</div>
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="date-picker-1" class="control-label">Fecha Vigencia (<label style="color: red;"> * </label>):</label>
						</div>
						<div class="col-md-8">
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
						<br>
						<br>
						<br>
					</div>
					
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="">Localidad (<label style="color: red;"> * </label>):</label>
						</div>
						<div class="col-md-8">
							<select required name="localidad" id="localidad" class="form-control">
								<option value="">Seleccione..</option>
								{% for item in localidades %}
									<option value="{{item.id}}">{{item.localidad}}</option>
								{% endfor %}

                                
							</select>
						</div>
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="">Barrio (<label style="color: red;"> * </label>):</label>
						</div>
						<div class="col-md-8">
							<select required name="barrio" id="barrio" class="form-control">
								{% if barrio is defined %}
									<option value="{{barrio.id}}" selected>{{barrio.barrio}}</option>
								{% else %}
									<option value="">Seleccione..</option>
								{% endif %}
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
							<input type="text" name="direccionEntrega" value="{{dato.direccionEntrega}}" class="form-control" onkeyup="javascript:this.value=this.value.toUpperCase();" placeholder="Dirección de entrega" id ="direccionEntrega" onkeydown="return false;" style="pointer-events: none; background-color: lightgray;"  required > <script type="text/javascript"> document.getElementById('direccionEntrega').style.cursor = "none"; </script>
						</div>
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="">Momento del día (<label style="color: red;"> * </label>):</label>
						</div>
						<div class="col-md-8">
							<select required name="momentoDia" id="momentoDia" class="form-control">
								<option value="">Seleccione..</option>
								<option value="AM">AM</option>
								<option value="PM">PM</option>
							</select>
						</div>
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="date-picker-2" class="control-label">Fecha Entrega (<label style="color: red;"> * </label>):</label>
						</div>
						<div class="col-md-8">
							<div class="control-group">
								<div class="controls">
									<div class="input-group">
										<input id="date-picker-2" autocomplete="off" name="fechaEntrega" type="text" data-date-format="dd-mm-yyyy" class="date-picker-fechaentrega form-control" value="{{dato.fechaEntrega}}" placeholder="dd-mm-aaaa" />
										<label for="date-picker-2" class="input-group-addon btn"><span class="fa fa-calendar"></span>
	
										</label>
									</div>
								</div>
							</div>
						</div>
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="">Email (<label style="color: red;"> * </label>):</label>
						</div>
						<div class="col-md-8">
							<input type="email" name="email" class="form-control" value="{{dato.email}}" placeholder="Email">
						</div>
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="">Indicaciones de dirección (<label style="color: red;"> * </label>):</label>
						</div>
						<div class="col-md-8">
							<textarea onkeyup="javascript:this.value=this.value.toUpperCase();" name="indicacionDireccion" id="" cols="39" rows="5">{{dato.indicacionDireccion}}</textarea>
							<input  name="nombreCliente" type="hidden" value="{{dato.nombreCliente}}" />
							<input  name="cedulaCliente" type="hidden" value="{{dato.cedulaCliente}}" />
						</div>
					
						
					</div>
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="">Gopass (<label style="color: red;"> * </label>):</label>
						</div>
						<div class="col-md-8">
							<select required name="gopass" id="gopass" class="form-control">
								<option value="">Seleccione..</option>
								<option value="SI">SI</option>
								<option value="NO">NO</option>
							</select>
						</div>
						<br>
						<br>
						<br>
					</div>
					<div class="col-md-6">
						<div class="col-md-4">
							<label for="">Asistencia:</label>
						</div>
						<div class="col-md-8">
							<select required name="asistencia" id="asistencia" class="form-control">
								<option value="">Seleccione..</option>
								<option value="TIPO 1">TIPO 1</option>
								<option value="TIPO 2">TIPO 2</option>
								<option value="TIPO 3">TIPO 3</option>
								<option value="NO">NO</option>
							</select>
						</div>
						<br>
						<br>
						<br>
					</div>
				</div>
				<!-- <div class="col-md-4">
					<iframe src="https://lupap.com/" width="500" height="790" frameborder="1" scrolling="auto">

					</iframe>
				</div> -->
	
			</div>
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
								<input class="btn btn-info form-control" id="submit" type="button"
									value="Buscar">
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
							<label> Carrera 56 # 9 -09</label>
							<div class="col-md-4">
								<label>Ejemplo</label>
								<label for="">Dirección de entrega:</label>
							</div>
							<div class="col-md-8">
								<input type="text"
									class="form-control direccionManual"  placeholder="Dirección de entrega">
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
			<button type="submit" class="btn btn-primary form-control">Guardar</button>
			<br>
			<br>
		</div>
	</form>
{% endif %}



<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>

{% if datoSoat is defined %}
    {% for item in datoSoat %}
<script>
    var tipificacion = '{{item.tipificacion}}';
    var asistencia = '{{item.asistencia}}';
    var gopass = '{{item.gopass}}';
    var iidusergestionSoat = '{{item.iidusergestionSoat}}';
    $('#tipificacion').val(tipificacion);
    $('#asistencia').val(asistencia);
    $('#gopass').val(gopass);
    $('#iidusergestionSoat').val(iidusergestionSoat);
</script>
    {% endfor %}
{% endif %}

{% if datoSoat is defined %}
    {% for item in datoSoat %}
<script>
    var usuario_gestion = '{{item.usuario_gestion}}';
    $('#usuario_gestion').val(usuario_gestion);
</script>
    {% endfor %}
{% endif %}

<script>

    $(document).ready(function(){

        $('.dataTables-example').DataTable({
            pageLength: 10,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            buttons: [
                {extend: 'excel', title: 'Registros'},
                {extend: 'pdf', title: 'Registros'},

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
		$("#div-3").hide();
		$("#div-tarjeta").hide();
		$("#div-cuotas").hide();
		var clase = '{{dato.claseVehiculo}}';
		var cilindraje = '{{dato.cilindraje}}';
		var ciudad = '{{dato.ciudad}}';
		var placa = '{{dato.placa}}';
		var formaPago = '{{ dato.formaPago}}';
		var tarjeta = '{{dato.tarjetaPago}}';
		var cuotas = '{{dato.cuotasPago}}';
		var localidad = '{{dato.localidad}}';
		var barrios = '{{dato.barrio}}';
		var momentoDia = '{{dato.momentoDia}}';
		var gopass = '{{dato.gopass}}';
		var asistencia = '{{dato.asistencia}}';
		$('#claseVehiculo').val(clase);
		$('#cilindraje').val(cilindraje);
		$('#ciudad').val(ciudad);
		$('#placa').val(placa);
		$('#formaPago').val(formaPago);
		$('#asistencia').val(asistencia);

		/*Se pone el valor de los selects en 0 en caso de que esten nullos en la bd*/
		if(tarjeta != 0){
			$('#tarjeta').val(tarjeta);
		}
		else{
			$('#tarjeta').val(0);
		}
		if(cuotas != 0){
			$('#cuotas').val(cuotas);
		}
		else{
			$('#cuotas').val(0);
		}

		/*Si tarjetaPago es igual a 0 entonces cuotas pago tambien deberia serlo para que concuerde la informacion */
		if($('#tarjeta').val() == 0){
			$('#cuotas').val(0);
		}
		$('#formaPago option[value="'+ formaPago +'"]').attr('selected',true)
		if($('#formaPago').val() == 9){
			$('#div-tarjeta').show('slow');
			$('#div-cuotas').show('slow');
			/*$('#tarjeta').attr('required', 'true');
			$('#cuotas').attr('required', 'true');*/
			if($('#tarjeta').val() == 3){
				var valor = $('#valorSoat').val();
				var descuento = Number(valor) * 0.03;

				// alert(descuento)

				if (descuento > 20000) {
					$("#valorSoatDescuento").val(Number(valor) - 20000);
				}
				else {
					$("#valorSoatDescuento").val(Number(valor) * 0.97);
				}
				$('#div-3').show('slow');
			}
		}
		$('#localidad').val(localidad);
		// $('#barrio').val(barrio);
		$('#momentoDia').val(momentoDia);
		$('#gopass').val(gopass);
		if($('#tarjeta').val() == 3){
			$("#div-3").show('slow');
		}
		
	</script>
{% endif %}
{% if dato is defined %}
<script>
	$("#otraCiudad").hide();
	$("#Accion").show();
	

</script>
{% endif %}
{% if notFoundDB is defined  %}
<script>

	$("#Accion").hide();
console.log("Entro2");
</script>
{% endif %}
{% if entregado is defined  %}
<script>
	$("#otraCiudad").hide();
console.log("Entro3");

</script>
{% endif %}

<script type="text/javascript">


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

//funcion para traer el cilindraje
$("#claseVehiculo").change(function(e) {
		var cilindraje =  $("#cilindraje").val();
		$("#valorSoat").val('');
       	var url = "{{url('administrador/editarRegistrosSoat')}}";
       	var parametros = {
       		"claseCC" : $('#claseVehiculo').val()
       	}
       $.ajax({
            type: "POST",
            url: url,
            data: parametros,
            success: function(data){
            	var body;
				body = JSON.parse(data);
				console.log(body);
				

                var option = '<option value="">Seleccione..</option>';
                for (var i = 0; i < body.length; i++) {
			        option+= '<option value="' + body[i]['id'] + '">' + body[i]['cilindraje']+ '</option>';

			    }
			    $('#cilindraje').html(option);
				if ($("#claseVehiculo").val() == 18 || $("#claseVehiculo").val() == 19 ){
					$('#cilindraje').prop('required', false);
				} else{
					$('#cilindraje').prop('required', true);
				}
            }
        });
     	e.preventDefault();
   	});

   	//funcion para traer el valor del cilindraje
	$("#cilindraje").change(function(e) {
		var cilindraje =  $("#cilindraje").val();
       	var url = "{{url('administrador/editarRegistrosSoat')}}";
       	$("#valorSoat").val('');
       	var parametros = {
       		"valorCC" : $('#cilindraje').val()
       	}
       $.ajax({
            type: "POST",
            url: url,
            data: parametros,
            success: function(data){

            	var body = JSON.parse(data);
            	//console.log(data);
                var valor = body[0]['valor'];
			    $('#valorSoat').val(valor);
            }
        });
     	e.preventDefault();
   	});

	//funcion para traer el barrio
	$("#localidad").change(function(e) {

	var url = "{{url('administrador/editarRegistrosSoat')}}";
	var parametros = {
		"localidad2" : $('#localidad').val()
	}
	$.ajax({
	type: "POST",
	url: url,
	data: parametros,
	success: function(data){
		//console.log(data);
		var body = JSON.parse(data);

		var option = '<option value="">Seleccione..</option>';
		for (var i = 0; i < body.length; i++) {
			option+= '<option value="' + body[i]['id'] + '">' + body[i]['barrio']+ '</option>';

		}
		$('#barrio').html(option);
		$('#barrio').prop('required', true);
	}
	});
	e.preventDefault();
	});
	
// Fecha de entrega
	// $(".date-picker-fechaentrega").datepicker({
	// 	beforeShowDay:function(Date){
    //     var curr_date = Date.getDate();
    //     var curr_month = Date.getMonth()+1;
    //     var curr_year = Date.getFullYear();        
    //     var curr_date='0'+curr_month+'-'+curr_date+'-'+curr_year;        
        
    //     if (forbidden.indexOf(curr_date)>-1) return false;        
	// 	},
	// 	startDate: inicio,
	// 	endDate: fin
	// });
	// Fecha de vigencia
	$(".date-picker-fechavigencia").datepicker({
		startDate: '+1d'
	});
	// Fecha de vencimiento del soat
	$(".date-picker").datepicker({
		startDate: '0d'
	});
	
	/*window.onload = function() {
		alert( "Handler for .select() called." );
	};
	$( "#formaPago" ).select(function() {
		alert( "Handler for .select() called." );
	});	*/

	$("#formaPago").on('change', function () {
		var selectDescuento = $(this).val();
		var valor = $('#valorSoat').val();
		var descuento = Number(valor) * 0.03;
		console.log(selectDescuento);

		// alert(descuento)

		if (descuento > 20000) {
			$("#valorSoatDescuento").val(Number(valor) - 20000);
		}
		else {
			$("#valorSoatDescuento").val(Number(valor) * 0.97);
		}

		if (selectDescuento == 5) {
			$("#div-3").show('slow');
			$("#div-tarjeta").hide();
			$("#div-cuotas").hide();
			$('#tarjeta').val(0);
			$('#cuotas').val(0);
			$('#tarjeta').removeAttr('required');
			$('#cuotas').removeAttr('required');
			/*$("#tarjeta").hide().prop('required',false);
			$("#cuotas").hide().prop('required',false);*/
			$('#valorSoat').val(Number(descuento));
			$('#valorSoat').val(Number(valor));
		} else if (selectDescuento == 1) {
			$("#div-3").hide();
			$("#div-tarjeta").hide();
			$("#div-cuotas").hide();
			$('#tarjeta').val(0);
			$('#cuotas').val(0);
			$('#tarjeta').removeAttr('required');
			$('#cuotas').removeAttr('required');
			$('#valorSoatDescuento').val("");
			$('#valorSoat').val(Number(valor));
		} else if (selectDescuento == 2) {
			$("#div-3").hide();
			$("#div-tarjeta").hide();
			$("#div-cuotas").hide();
			$('#tarjeta').val(0);
			$('#cuotas').val(0);
			$('#tarjeta').removeAttr('required');
			$('#cuotas').removeAttr('required');
			$('#valorSoatDescuento').val("");
			$('#valorSoat').val(Number(valor));
		} else if (selectDescuento == 3) {
			$("#div-3").hide();
			$("#div-tarjeta").hide();
			$("#div-cuotas").hide();
			$('#tarjeta').val(0);
			$('#cuotas').val(0);
			$('#tarjeta').removeAttr('required');
			$('#cuotas').removeAttr('required');
			$('#valorSoatDescuento').val("");
			$('#valorSoat').val(Number(valor));
		} else if (selectDescuento == 4) {
			$("#div-3").hide();
			$("#div-tarjeta").hide();
			$("#div-cuotas").hide();
			$('#tarjeta').val(0);
			$('#cuotas').val(0);
			$('#tarjeta').removeAttr('required');
			$('#cuotas').removeAttr('required');
			$('#valorSoatDescuento').val("");
			$('#valorSoat').val(Number(valor));
		} else if (selectDescuento == 9) {
			$("#tarjeta").val("");
			$("#div-tarjeta").show('slow');
			$("#div-cuotas").hide();
			$('#tarjeta').attr('required' , 'true');
			$('#cuotas').attr('required' , 'true');
			//$("#cuotas").hide().prop('required',false);
			$("#div-3").hide();
			$('#valorSoatDescuento').val("");
			$('#valorSoat').val(Number(valor));
		}
		else {
			$("#div-3").hide();
			$("#div-tarjeta").hide();
			$("#div-cuotas").hide();
			$('#tarjeta').val(0);
			$('#cuotas').val(0);
			$('#tarjeta').removeAttr('required');
			$('#cuotas').removeAttr('required');
		}

	});

	$("#tarjeta").on('change', function () {
		var selectDescuento = $(this).val();
		var valor = $('#valorSoat').val();
		var descuento = Number(valor) * 0.03;

		// alert(descuento)

		if (descuento > 20000) {
			$("#valorSoatDescuento").val(Number(valor) - 20000);
		}
		else {
			$("#valorSoatDescuento").val(Number(valor) * 0.97);
		}

		if (selectDescuento == 3) {
			$("#div-cuotas").show('slow');
			$("#cuotas").val(1);
			$("#div-3").show('slow');
			$('#valorSoat').val(Number(descuento));
			$('#valorSoat').val(Number(valor));
		} else if (selectDescuento == 1) {
			$("#div-cuotas").show('slow');
			$("#cuotas").val(1);
			$("#div-3").hide();
			$('#valorSoatDescuento').val("");
			$('#valorSoat').val(Number(valor));
		} else if (selectDescuento == 2) {
			$("#div-cuotas").show('slow');
			$("#cuotas").val(1);
			$("#div-3").hide();
			$('#valorSoatDescuento').val("");
			$('#valorSoat').val(Number(valor));
		}
		else {
			$("#div-3").hide();
			$("#div-cuotas").hide();
		}

	});
</script>

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9BN2M2d6aJIlUvMEFe6s7p2NNDrXd0do&callback=initMap">
	</script>
<script>
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
<script type="text/javascript">

		// Direccion generada 
	
		$('.vr-manzana').hide();
		$('#agendamiento').find('input,select,textarea').attr('required', 'true');
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
			$('.GoogleB').show();
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
		$('#tarjeta').removeAttr('required');
		$('#cuotas').removeAttr('required');
	
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
		}
	
	</script>