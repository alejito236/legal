<br>
<style>
    table{
        font-size: 14px;
    }    
    .label-default{

        background-color: #8EDE62 !important;
    }
    select{
        height: 3.5rem!important;
        
    } 
     
      
</style>
{% if error is defined %}
    <div class="alert alert-danger alert-dismissable" id="error">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> {{error}}
    </div>
{% endif %}

{% if errorP is defined %}
    <div class="alert alert-danger alert-dismissable" id="errorP">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> {{errorP}}
    </div>
{% endif %}

{% if exitoP is defined %}
    <div class="alert alert-info alert-dismissable" id="exitoP">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> {{exitoP}}
    </div>
{% endif %}

{% if guardo is defined %}
    <div class="alert alert-info alert-dismissable" id="guardo">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> {{guardo}}
    </div>
{% endif %}

{% if vacio is defined %}
    <div class="alert alert-danger alert-dismissable" id="vacio">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> {{vacio}}
    </div>
{% endif %}

{% if existe is defined %}
    <div class="alert alert-danger alert-dismissable" id="existe">
        <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
        <i class="fas fa-check"></i> {{existe}}
    </div>
{% endif %}

<div class="col-md-12">
    <h1>Expedicion <i class="far fa-id-card"></i></h1>
    <hr>
</div>
<br><br><br><br><br>
<div class=" col-lg-1 col-sm-12">
    <button 
        type="button" 
        id="btnRecargar" 
        name="btnRecargar" 
        class="btn btn-success"
        onClick="ejecutaProcedimientos();"
    >
        <i class="	fas fa-sync"></i> Recargar 
    </button>
</div>
<br><br><br>

{% if getListadoExpedidor is defined %}   
        <div class="wrapper wrapper-content animated fadeInRight">                
        <table class="table table-striped table-bordered table-hover dataTables-example" id="tblExpedidor" name="tblExpedidor">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Fecha Franja</th>
                    <th>Ciudad</th>
                    <th>Tipo</th>
                    <th>Cedula</th>
                    <th>Placa</th>
                    <th>Estado Presupuesto</th>
                    <th>Criterio Presupuesto</th>
                    <th>Observaciones</th>
                    <th>Estado</th>
                    <th># Poliza</th>
                    <th>Acción</th>
                </tr>
            </thead>
            <tbody>
                {% for item in getListadoExpedidor %}
                
                    <tr onclick="cambiarEstado(this);bloquearPoliza(this)" onsubmit="enviar(this,event);">
                        
                        <form action="{{url('expedidor/reagendar')}}"  method="POST" id="enviarForm" name="enviarForm">
                            <td>{{item.Id}}</td>
                            <input type="hidden" name="Id" value="{{item.Id}}">
                            <td>{{item.fecha}}</td>
                            <input type="hidden" name="ciudad" value="{{item.ciudad}}">
                            <td>{{item.ciudad}}</td>

                            <input type="hidden" id="producto" name="producto" value="{{item.productoId}}">
                            
                            <td id="Tipo">{{item.Tipo}}</td>
                            <input type="hidden" name="Tipo" value="{{item.Tipo}}">
                            <td>{{item.cedula}}</td>
                            <input type="hidden" name="cedula" value="{{item.cedula}}">
                            <td>{{item.placa}}</td>
                            <input type="hidden" name="placa" value="{{item.placa}}">                            
                            
                            <td>
                                <select name="estado" id="estado" class="form-control" style="width:130px" required >
                                    <option value="">Seleccionar</option>
                                    {% for item2 in getEstadopresupuesto %}
                                        <option value="{{item2.estadoid}}"> {{item2.nombre}}</option>
                                    {% endfor %}
                                </select>
                            </td>                            
                            <td>
                                <select class="form-control" name="criterio" id="criterio" style="width:130px" required disabled >
                                    <option value="">Seleccionar</option>
                                    {% for item2 in getCriteriosExpedidor %}
                                        <option value="{{item2.criterioId}}"> {{item2.nombre}}</option>
                                    {% endfor %}
                                    
                                </select>
                            </td>                            
                            <td>
                                <textarea class="form-control" name="Observaciones" id="Observaciones"  rows="2" cols="10" cols="12"></textarea>
                            </td>                            
                            <td>
                                <select name="Estado2" id="Estado2"  disabled style="width:130px" required >
                                    <option value="">Seleccionar</option>
                                    {% for item2 in getEstadoExpedidor %}
                                        <option value="{{item2.estadoid}}"> {{item2.nombre}}</option>
                                    {% endfor %}
                                </select>
                            </td>
                            {% if item.productoId is 1  %}
                                <td><input class="form-control" style="width:180px"  type="number" id="Poliza" name="Poliza" value="{{item.poliza}}" required ></td>
                            {% else %}
                                <td><input class="form-control" style="width:180" type="number" id="Poliza" name="Poliza" disabled ></td>
                            {% endif %}                            
                            <td>
                                <button 
                                    class="btn btn-primary" 
                                    id="btnGuardar" 
                                    name="btnGuardar"
                                    type="submit"                                
                                >   <i class="fas fa-save"></i>
                                </button>
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
    <div class="col-lg-12">
        <form action="{{url('expedidor/generar')}}" method="POST">
            <div class="col-lg-3">
                <label for="">Fecha inicio:</label>
                <input type="date" name="fechaInicio" value="{{fechaInicial}}" id="fechaInicio" class="form-control">
            </div>
            <div class="col-lg-3">
                <label for="">Fecha final:</label>
                <input type="date" name="fechaFinal" value="{{fechaFinal}}" id="fechaFinal"  class="form-control">
            </div>
            <div class="col-lg-2">
                <label for=""> <br></label>
                <button class="btn btn-primary form-control" id="btnFiltrar" name="btnFiltrar" value="generar" >Generar</button>
            </div>
        </form>
    </div>
{% endif %}
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>   
 /**Funcion para validacion del campo poliza en el formulario y observaciones antes de enviar la información*/
function enviar(fila,evt){        
    let producto = $(fila).find('input[id="producto"]').val();
    let estado = $(fila).find('select[id="Estado2"]').val();    
    let estadoPres = $(fila).find('select[id="estado"]').val();
    let observacion = $(fila).find('textarea[id="Observaciones"]').val();    
    let expresionRegular = /[A-Za-z0-9]/;

    if(estadoPres != 28 && estado != 2){
        if(producto == 1){  
            let poliza = $(fila).find('input[id="Poliza"]').val();
            if (poliza <0 || poliza.length < 13 || poliza.length >15 ){
                evt.preventDefault();
                //console.log("Entro");
                Swal.fire({
                    title: 'El número de la poliza debe ser mayor a 13 caracteres, menor a 15 ',
                    showDenyButton: false,							
                    confirmButtonText: 'Aceptar',			
                });				
            }                
        }            
        
    }else{
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

/*Función  para habilitar y desahabilitar select dependiendo del estado**/
    function cambiarEstado(selectEstado){        
        let estado = $(selectEstado).find('select[id="estado"]');
        let criterio = $(selectEstado).find('select[id="criterio"]');
        let Estado2 = $(selectEstado).find('select[id="Estado2"]');
        let Poliza = $(selectEstado).find('input[id="Poliza"]');
        let producto = $(selectEstado).find('input[id="producto"]');
        

        estado.on('change', () => {
            console.log(estado.val());
            if (estado.val() != 28  ) {                
                Estado2.prop('disabled', false);
                Poliza.prop('disabled', true);
                criterio.prop('disabled', true);
                criterio.val('');
                Estado2.val('');
                //Poliza.val('');
            
            } 
            else {
                Estado2.prop('disabled', true);
                Poliza.prop('disabled', true);
                criterio.prop('disabled', false);
                Estado2.val('');
                //Poliza.val('');
                criterio.val('');
            }

        });        
    }
    /*Función  para habilitar y desahabilitar poliza dependiendo del estado**/
    function bloquearPoliza(selectEstado){        
        let estado = $(selectEstado).find('select[id="estado"]');
        let Estado2 = $(selectEstado).find('select[id="Estado2"]');
        let Poliza = $(selectEstado).find('input[id="Poliza"]');
        let producto = $(selectEstado).find('input[id="producto"]');
        Estado2.on('change', () => {
            console.log('estado2',Estado2.val());
            if (Estado2.val() != 2  && producto.val()!=2) {                
                
                Poliza.prop('disabled', false);
                //Poliza.val('');
            }else {
                console.log(Estado2)                
                Poliza.prop('disabled', true);
               
               
                //Poliza.val('');
               
            }

        });        
    }

    /**Funcion para limpiar la variable del fitro de fecha de la sesion*/
    function limpiarFecha(){
		let url = "{{url('expedidor/limpiarFecha')}}";  
		let parametros = {
			eliminarFecha: 'eliminarFecha'
		}			
		$.ajax({
			type: "POST",
			url: url,
			data: parametros,
			success: function(data){				
                console.log(data);
				let url2 = "{{url('expedidor/generar')}}";
				location.assign(url2);
			}
		});	
	}   

    function ejecutaProcedimientos(){
		let url = "{{url('expedidor/ejecutaProcedimientos')}}";  
		let parametros = {
			ejecutaProcedimientos: 'ejecutaProcedimientos'
		}			
		$.ajax({
			type: "POST",
			url: url,
			data: parametros,
			success: function(data){
				console.log(data);
				let url2 = "{{url('expedidor/generar?ejecutaP=')}}"+data;
				location.assign(url2);
                //console.log(url2);
				
			}
		});	
	}
    
    /**Se usa para no admitir fechas 2 días atras a la actual*/
    $("#fechaInicio").attr('min', '<?php echo date("Y-m-d",strtotime(date("Y-m-d")."- 2 days"));?>');
    $("#fechaFinal").attr('min', '<?php echo date("Y-m-d",strtotime(date("Y-m-d")."+ 1 days"));?>');


    $(document).ready(function() {

        /**Funcion para el manejo de la tabla**/
        $('#tblExpedidor').DataTable({         
            scrollX: true,
            pageLength: 5,
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
            }
        });
    });

    {% if vacio is defined %}
        setTimeout(()=>{
            $('#vacio').hide();
        },5000)        
    {% endif %}

    {% if error is defined %}
        setTimeout(()=>{
            $('#error').hide();
        },5000)        
    {% endif %}

    {% if guardo is defined %}
        setTimeout(()=>{
            $('#guardo').hide();
        },5000)        
    {% endif %}

    {% if existe is defined %}
        setTimeout(()=>{
            $('#existe').hide();
        },5000)        
    {% endif %}

    {% if errorP is defined %}
        setTimeout(()=>{
            $('#errorP').hide();
        },5000)        
    {% endif %}

    {% if exitoP is defined %}
        setTimeout(()=>{
            $('#exitoP').hide();
        },5000)        
    {% endif %}

</script>
</script>


