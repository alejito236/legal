
<style>


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

<div class="row">

    <div class="col-md-12">


        <div class="panel bg-gray">
            <div class="panel-body">
            <div class="btn-group">


                <a href="" class="btn btn-default">Asignación</a>
                <a href="" class="btn btn-default">Distribución</a>
                <a href="" class="btn btn-default">Gestionar</a>
                <a href="" class="btn btn-default">Ver</a>
                <a href="" class="btn btn-default">Auditar</a>
                <a href="" class="btn btn-default">Requrimiento de informacion</a>


            </div>


            <H3  style="margin: 10px 0px 20px 0px;">  <img src="{{url('public/img/icono.png')}}" height="25px" style="margin-top: -10px;" > <span > INFORMACIÓN CARGA LABORAL</span></H3>
            <div class="panel">
                <div class="panel-body" style="margin-top: 20px;">
                         
                    <div class="col-md-3 col-md-offset-9">
        
                            
                          
                          </div>
                          
                    <table id="dt" class="table table-responsive table-bordered table-striped">
                        <thead class="bg-primary">
                            <tr>
                                <th style="color: #fff !important;"> ID</th>
                                <th style="color: #fff !important;"> ID Entidad  </th>
                                <th style="color: #fff !important;"> Nombre y Apellidos </th>
                                <th style="color: #fff !important;"> N° de Estudios</th>
                                <th style="color: #fff !important;"> Estado</th>
                                <th style="color: #fff !important;"> Acción</th>


                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>saas</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                            </tr>
                            <tr>
                                <td>saas</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                            </tr>
                            <tr>
                                <td>saas</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                            </tr>
                            <tr>
                                <td>saas</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                            </tr>
                            <tr>
                                <td>saas</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                                <td>w</td>
                            </tr>
                        </tbody>
                    </table>

                    <div class="row">
                        <div class="col-md-4 col-md-offset-9">
                            <button class="btn btn-primary " style="width: 100px;" data-toggle="modal" data-target="#exampleModal" >Guardar</button> &nbsp; &nbsp;
                            <button class="btn btn-primary" style="width: 100px;" >Cancelar</button>&nbsp;
                        </div>
                    </div>
                    </div>
                    </div>
        
        </div>

    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="border-radius: 80px!important;">
    <div class="modal-dialog" role="document" >
      <div class="modal-content"style="border-radius: 20px!important;" >
        
          <img src="{{url('public/img/pop-up-Novus-Legal-2.png')}}" width='100%' height='150px' alt="" style="border-top-left-radius: 20px 20px!important; border-top-right-radius: 20px 20px!important; margin-left: 0px; margin: top -20px !important;" >
          <img src="{{url('public/img/Logo-login.png')}}" width='150px' alt="" style="margin-left: 0px;position:fixed; top: 30px; right: 10px;" >        
        
        <div class="modal-body">
          <h3>Se ha generado la asignación del caso exitosamente</h3>
          <img src="{{url('public/img/check.png')}}" width='50px' alt="" style="margin-left: 0px;position:fixed; bottom: 80px; right: 60px;" >        
        </div>
        <div class="modal-footer">
        
          <button type="button" class="btn btn-primary" style="float: left;font-size: 16px;">Guardar</button>
        </div>
      </div>
    </div>
  </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js "></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
     $('#dt').DataTable({
        "paging":   true,
        "language": {
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
    /*Función  para habilitar y desahabilitar select dependiendo del estado***/
    function cambiarEstado(selectEstado) {
        let estado = $(selectEstado).find('select[id="estado"]');
        let criterio = $(selectEstado).find('select[id="criterio"]');
        let mensajero = $(selectEstado).find('select[id="mensajero"]');
        estado.on('change', () => {
            if (estado.val() != 5) {
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
    function enviar(fila, evt) {
        let estado = $(fila).find('select[id="estado"]').val();
        let observacion = $(fila).find('textarea[id="observacion"]').val();
        let expresionRegular = /[A-Za-z0-9]/;
        console.log(estado);
        //evt.preventDefault();
        if (estado != 5) {
            if (!expresionRegular.test(observacion)) {
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
    function limpiarFecha() {
        let url = "{{url('asignacion/limpiarFecha')}}";
        let parametros = {
            eliminarFecha: 'eliminarFecha'
        }
        $.ajax({
            type: "POST",
            url: url,
            data: parametros,
            success: function (data) {
                console.log(data);
                let url2 = "{{url('asignacion/index')}}";
                location.assign(url2);
            }
        });
    }


    $(document).ready(function () {
        /**Funcion para el manejo de la tabla**/
        $('#tblAsignacion').DataTable({
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