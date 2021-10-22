<style>
    select {
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
        width: 100%;
    }
    
    .panel {
        margin-bottom: 8 0px;
        background-color: #FFFFFF;
        border: 1px solid transparent;
        border-radius: 4px;
    }
    
    .panel-primary {
        border-color: #5095E2!important;
    }
    
    hr {
        height: 1px!important;
        background-color: silver;
    }
    
    input,
    select {
        border: 1px solid silver!important;
    }
    
    input {
        text-transform: uppercase;
    }
    
    .btn-primary {
        margin-top: 5px;
    }
</style>

<?php  
  header("Cache-Control: max-age=2592000"); //30days (60sec * 60min * 24hours * 30days)
?>

{% if vacio is defined %}
    <div class="alert alert-info alert-dismissable" id="exito">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> {{vacio}}
    </div>
{% endif %}

{% if guardo is defined %}
    <div class="alert alert-info alert-dismissable" id="exito">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> {{guardo}}
    </div>
{% endif %}

<div class="col-md-12">
    
    <h1>Asignación <i class="fas fa-user-check"></i></h1>
    <hr>
</div>

	

{% if getListadoAsignador is defined %}
    <div class="wrapper wrapper-content animated fadeInRight">
        <table class="table table-striped table-bordered table-condensed" id="tblAsignador" name="tblAsignador">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Fecha</th>
                    <th>Franja</th>
                    <th>Ciudad</th>
                    <th>Tipo</th>
                    <th>Cedula</th>
                    <th>Placa</th>
                    <th>Estado</th>
                    <th>Mensajero</th>
                    <th>Criterio</th>
                    <th>Observación</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                {% for item in getListadoAsignador %}                
                    <tr onclick="cambiarEstado(this);" onsubmit="enviar(this,event);">
                        <form action="{{url('asignador/guardarGestion')}}" id="enviarForm" name="enviarForm" method="POST">
                            <input type="hidden" value="{{item.tipoVenta_Id}}" id="tipoVenta_Id" name ="tipoVenta_Id">
                            <input type="hidden" value="{{item.ventaId}}" id="ventaId" name ="ventaId">
                            <input type="hidden" value="{{item.gestionExpedidorId}}" id="gestionExpedidorId" name ="gestionExpedidorId">
                            <input type="hidden" value="{{item.cedulaCliente}}" id="cedulaCliente" name ="cedulaCliente">
                            <input type="hidden" value="{{item.productoId}}" id="productoId" name ="productoId">        
                            <input type="hidden" value="" id="tipoVenta" name="tipoVenta">
                            <td>{{item.ventaId}}</td>
                            <td>{{item.fechaEntrega}}</td>
                            {% if item.franjaHoraria is 0 %}
								<td>AM</td>
									{% else %}
								<td>PM</td>
									{% endif %}	                           
                            <td>{{item.nombreCiudad}}</td>
                            <td>{{item.nombreProducto}}</td>
                            <td>{{item.cedulaCliente}}</td>
                            <td>{{item.placa}}</td>
                            <td>
                                <select name="estado" id="estado" required >
                                    <option value="">Seleccionar</option>
                                    {% for item in getEstadoAsignador %}
                                        <option value="{{item.estadoid}}"> {{item.nombre}}</option>
                                    {% endfor %}
                                </select>
                            </td>
                            <td>
                                <select name="mensajero" id="mensajero" disabled required>
                                    <option value="">Seleccionar</option>
                                    {% for item in motorizados %}
                                        <option value="{{item.usuarioId}}">{{ item.nombre }} {{ item.apellido }} </option>
                                    {% endfor %}
                                </select>
                            </td>
                            <td>
                                <select name="criterio" id="criterio" disabled required>
                                    <option value="">Seleccionar</option>
                                    {% for item in getCriteriosAsignador %}
                                        <option value="{{item.criterioId}}"> {{item.nombre}}</option>
                                    {% endfor %}
                                    
                                </select>
                            </td>
                            <td><textarea name="observacion" id="observacion" minlength="5" rows="2" cols="10 " ></textarea></td>
                            <td>
                                <button id="boton" type="submit" class="btn btn-primary">Asignar</button>
                            </td>                        
                        </form>                                    
                    </tr>
                {% endfor %}
            </tbody>
        </table>
        <!-- Boton cancelar y volver a atrás -->
        <div class="col-md-12 col-sm-12">
            <button 
                type="button" 
                id="btnCancelar" 
                name="btnCancelar" 
                class="btn btn-danger"
                onclick="limpiarFecha()"
            >	
                <i class="fas fa-long-arrow-alt-left"></i>					
            </button>
        </div><br><br>
    </div>
{% else %}
    <div class="row">
        <form action="{{url('asignador/index')}}" method="POST">
            <div class="col-lg-2"></div>
            <!--<div class="col-lg-3">
                <label for="fechaInicio">Fecha inicio:</label>
                <input type="date" name="fechaInicio" value="{{fechaInicial}}" class="form-control">
            </div>-->
            <div class="col-lg-3">
                <label for="fechaFinal">Fecha final:</label>
                <input type="date" name="fechaFinal" value="{{fechaFinal}}" class="form-control">
            </div><br>
            <div class="col-lg-2"><br>
                <button class="btn btn-primary form-control" id="btnGenerar" name="btnGenerar">Generar</button>
            </div>
        </form>
    </div>
{% endif %}

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js "></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    /*Función  para habilitar y desahabilitar select dependiendo del estado***/
    function cambiarEstado(selectEstado){
        let estado = $(selectEstado).find('select[id="estado"]');
        let criterio = $(selectEstado).find('select[id="criterio"]');
        let mensajero = $(selectEstado).find('select[id="mensajero"]');
        estado.on('change', () => {
            if (estado.val() != 5 ) {
                criterio.prop('disabled', false);
                mensajero.prop('disabled', true);
                criterio.val('');
                mensajero.val('16');
            } else {
                mensajero.prop('disabled', false);
                criterio.prop('disabled', true);
                mensajero.val('');
                criterio.val('');
            }

        });        
    }

  /**Funcion para validacion del campo observaciones antes de enviar la información*/
    function enviar(fila,evt){            
        let estado = $(fila).find('select[id="estado"]').val();        
        let observacion = $(fila).find('textarea[id="observacion"]').val();    
        let expresionRegular = /[A-Za-z0-9]/;
        console.log(estado);
        //evt.preventDefault();
        if(estado != 5){                                       
            if (!expresionRegular.test(observacion)){
                //console.log("Entro");
                evt.preventDefault();
                Swal.fire({
                    title: 'La observación no puede estar vacia',
                    showDenyButton: false,							
                    confirmButtonText: 'Aceptar',			
                });				
            }            
        }
    }

    /**Funcion para limpiar la variable del fitro de fecha de la sesion*/
    function limpiarFecha(){
		let url = "{{url('asignador/limpiarFecha')}}";  
		let parametros = {
			eliminarFecha: 'eliminarFecha'
		}			
		$.ajax({
			type: "POST",
			url: url,
			data: parametros,
			success: function(data){				
                console.log(data);
				let url2 = "{{url('asignador/index')}}";
				location.assign(url2);				
			}
		});	
	}


     $(document).ready(function() {
         /**Funcion para el manejo de la tabla**/
        $('#tblAsignador').DataTable({
            scrollX: true,
            pageLength: 10,
            responsive: true,
            dom: '<"html5buttons "B>lTfgitp',
            buttons: [],
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