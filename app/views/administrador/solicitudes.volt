<style>
    select{
        height: 33px!important;
    }
</style>

{% if ok is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> Datos actualizados con exito.
        </div>
    </div>
{% endif %}

{% if habilitado is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> Los clientes se han habilitado para volver a cobrar.
        </div>
    </div>
{% endif %}
<br>
    <div class="row">

        <section class="container-fluid" id="section1">
            <br><br>
             <div class="container">
                 <div class="row">                   
                     <div class="col-sm-6 text-center form-js">
                         <div class="row">
                             <div class="col-sm-10 col-sm-offset-1 text-center">
                                 <input type="hidden" value="ENVIO EMAIL">
                                 <h3 style="color:#2252B2;">Envio de email</h3>
                                 <i style="color: #2252B2;"  class="fas fa-envelope fa-5x"></i>                                  
                             </div>
                         </div>
                     </div>
                     <div class="col-sm-6 text-center form-js">
                         <div class="row">
                             <div class="col-sm-10 text-center">
                                 <input type="hidden" value="PAGO EN LINEA">
                                 <h3 style="color:#3882FB;">Pago en linea</h3>
                                 <i style="color: #3882FB;" class="fas fa-money-check-alt fa-5x"></i>            
                             </div>
                         </div>
                     </div>                
                 </div>
                 <!--/row-->
                 <div class="row">
                     <br>
                 </div>
             </div>
             <!--/container-->
         </section>
        <!-- <div class="col-md-12">
            <form action="{{url('Segurostdccoordinador/editRedeban')}}" id="habilitar" method="POST">
                <input type="hidden" name="habilitar" value="habilitar">
                <div class="col-md-4">
                    <button type="button" class=" btn btn-danger demo3">Habilitar cobros</button>
                </div>
            </form>
        </div> -->
        <br>
        <br>
        <div>
    
            <div class="col-lg-2 form-js">
                <br>
                <input type="hidden" value="PAGO">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>Pagó</h5>
                        <div class="ibox-tools">
                            
                        </div>
                    </div>
                    <div class="ibox-content table-responsive" style="padding:0!important;">
                        <table class="table table-hover no-margins">
                            <thead>
                            </thead>
                            <tbody>
                            <tr>
                                <td><span class="label label-primary "><b>Cantidad:</b></span></td>
                                <td><h3>{{pago}}</h3></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-2 form-js">
                <br>
                <input type="hidden" value="ENVIADO">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>Enviadas</h5>
                        <div class="ibox-tools">
                            
                        </div>
                    </div>
                    <div class="ibox-content table-responsive" style="padding:0!important;">
                        <table class="table table-hover no-margins">
                            <thead>
                            </thead>
                            <tbody>
                            <tr>
                                <td><span class="label label-primary "><b>Cantidad:</b></span></td>
                                <td><h3>{{enviadas}}</h3></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-2 form-js">
                <br>
                <input type="hidden" value="COMPLETADO">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>Completadas</h5>
                        <div class="ibox-tools">
                            
                        </div>
                    </div>
                    <div class="ibox-content table-responsive" style="padding:0!important;">
                        <table class="table table-hover no-margins">
                            <thead>
                            </thead>
                            <tbody>
                            <tr>
                                <td><span class="label label-primary "><b>Cantidad:</b></span></td>
                                <td><h3>{{aprobadas}}</h3></td>
                            </tr>
                            </tbody>
                        </table>   
                    </div>
                </div>
            </div>
            
            <div class="col-lg-2 form-js">
                <br>
                <input type="hidden" value="RECHAZADA">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>Rechazadas</h5>
                        <div class="ibox-tools">
                            
                        </div>
                    </div>
                    <div class="ibox-content table-responsive" style="padding:0!important;">
                        <table class="table table-hover no-margins">
                            <thead>
                            </thead>
                            <tbody>
                            <tr>
                                <td><span class="label label-primary "><b>Cantidad:</b></span></td>
                                <td><h3>{{rechazadas}}</h3></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 form-js">
                <br>
                <input type="hidden" value="">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>Total</h5>
                        <div class="ibox-tools">
                            
                        </div>
                    </div>
                    <div class="ibox-content table-responsive" style="padding:0!important;">
                        <table class="table table-hover no-margins">
                            <thead>
                            </thead>
                            <tbody>
                            <tr>
                                <td><span class="label label-primary "><b>Cantidad:</b></span></td>
                                <td><h3>{{totalPeticiones}}</h3></td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    <div class="wrapper wrapper-content animated fadeInRight">
        <div class="reporte col-lg-12">
            <form action="{{url('administrador/reporteEnvioEmail')}}" target="_blank" method="POST">
                <!-- <input type="hidden" value="{{fechaInicial}}" id="fechaInicial" required name="fechaInicial" class="form-control">
                <input type="hidden" value="{{fechaFinal}}" id="fechaFinal" required name="fechaFinal" class="form-control"> -->
                <button class=" btn btn-primary pull-right ">Exportar Envio Email</button>
            </form>
            <br><br><br>
            <form action="{{url('administrador/reportePagoLinea')}}" target="_blank" method="POST">
                <!-- <input type="hidden" value="{{fechaInicial}}" id="fechaInicial" required name="fechaInicial" class="form-control">
                <input type="hidden" value="{{fechaFinal}}" id="fechaFinal" required name="fechaFinal" class="form-control"> -->
                <button class=" btn btn-primary pull-right ">Exportar Pagos en linea</button>
            </form>
            <br><br><br>
        </div>
        <br>
        <form action="{{url('administrador/editPeticion')}}" method="POST">
            <div class="col-lg-12">
                <div class="estatus">
                    <div class="col-md-3 col-md-offset-7">
                        <select name="estatus" required class="form-control">
                            <option value="">Seleccione..</option>
                            <option value="SU PETICION FUE ENVIADA">SU PETICION FUE ENVIADA</option>
                            <option value="FALTA INFORMACION">FALTA INFORMACION</option>
                            <option value="ENTREGA DE CORREO FALLIDA">ENTREGA DE CORREO FALLIDA</option>
                            <option value="PAGO RECHAZADO">PAGO RECHAZADO</option>
                            <option value="NO REALIZA PAGO">NO REALIZA PAGO</option>
                            <option value="PAGO APROBADO">PAGO APROBADO</option>
                            <option value="YA FUE CREADO POR OTRO ASESOR">YA FUE CREADO POR OTRO ASESOR</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button class=" btn btn-primary pull-right ">Actualizar</button>
                    </div>
                    <br><br><br>
                </div>
                <div class="pago">
                    <div class="col-md-3 col-md-offset-7">
                        <select name="estatus" required class="form-control">
                            <option value="">Seleccione..</option>
                            <option value="FALTA INFORMACION">FALTA INFORMACION</option>
                            <option value="PAGO APROBADO">PAGO APROBADO</option>
                            <option value="NO REALIZA PAGO">NO REALIZA PAGO</option>
                            <option value="PAGO RECHAZADO">PAGO RECHAZADO</option>
                            <option value="ENTREGA DE CORREO FALLIDA">ENTREGA DE CORREO FALLIDA</option>
                            <option value="YA FUE CREADO POR OTRO ASESOR">YA FUE CREADO POR OTRO ASESOR</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button class=" btn btn-primary pull-right ">Actualizar</button>
                    </div>
                    <br><br><br>
                </div>
                <div class="devolucion">
                    <div class="col-md-3 col-md-offset-7">
                        <select name="estatus" required class="form-control">
                            <option value="">Seleccione..</option>
                            <option value="SU PETICION FUE ENVIADA">SU PETICION FUE ENVIADA</option>
                            <option value="FALTA INFORMACION">FALTA INFORMACION</option>
                            <option value="NO REALIZA PAGO">NO REALIZA PAGO</option>
                            <option value="PAGO APROBADO">PAGO APROBADO</option>
                            <option value="YA FUE CREADO POR OTRO ASESOR">YA FUE CREADO POR OTRO ASESOR</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button class=" btn btn-primary pull-right ">Actualizar</button>
                    </div>
                    <br><br><br>
                </div>
            <div class="ibox ">
                <div class="ibox-title">
                    <h5>Gestiones</h5>
                    
                    <div class="ibox-tools">
                        <a class="collapse-link">
                            <i class="fa fa-chevron-up"></i>
                        </a>
                    </div>
                </div>
                <div class="ibox-content">

                    <div class="table-responsive">
                <table class="table table-striped table-bordered table-hover dataTables-example" >
                <thead>
                <tr>
                    <th>#</th>
                    <th> CEDULA </th>
                    <th> VALOR/CUPO TARJETA </th>
                    <th> PLACA/TIPO TARJETA </th>
                    <th> FECHA VENCIMIENTO </th>
                    <th> CORREO </th>
                    <th> NOMBRE </td>
                    <th> TELEFONO </th>
                    <th> ASESOR </th>
                    <th> PETICIÓN</th>
                    <th> ESTADO </th>
                    <th> ACCIÓN <input type="checkbox" class="check-all"></th>
                </tr>
                </thead>
                <tbody>
                {% if data is empty %}
                    No hay datos
                {% else %}
                    {% for item in data %}
                        
                        <tr class="gradeX">
                            <td>{{item.num}}</td>
                            <td>{{item.cedula}}</td>
                            <td>{{item.valor}}</td>
                            <td>{{item.placa}}</td>
                            <td>{{item.fechaVencimiento}}</td>
                            <td>{{item.correo}}</td>
                            <td>{{item.nombre}} </td>
                            <td>{{item.telefono}}</td>
                            <td>{{item.userGestion}}</td>
                            <td>{{item.tipoPeticion}}</td>
                            <td>{{item.estadoPeticion}}</td>
                            <td class="text-center">
                                <input type="checkbox" name="check[]" class="check-u" value="{{item.id}}">
                            </td>
                        </tr>
                    {% endfor %}
                {% endif %}
                
                </tbody>
                </table>
                    </div>

                </div>
            </div>
        </form>
    </div>

</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

{% if dato is defined %}
    <script>
        var edit = "{{dato['edit']}}";
        
        if(edit == 'edit'){

            $('#myModal5').modal('show');

            $('.btn-white').click(function(){
                 window.location='{{url("administrador/solicitudes")}}';
            });

        }
    </script>
{% endif %}

<script>
    $(document).ready(function(){

        $('.demo3').click(function () {
            swal({
                title: "¿Seguro que quieres pasar todos los clientes a pendiente?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Si",
                closeOnConfirm: false
            }, function () {
                $('#habilitar').submit();
            });
        });


    

        $('#pagoLineaUltimate').click(function () {
             console.log("holaaaaaa");
    
        });



        $('.reporte').hide();
        $('.pago').hide();
        $('.devolucion').hide();
        $('.estatus').hide();
        $('input:checkbox').hide();

        $('.col-lg-2').click(function(){
            $(this).parent().submit();
        });

        $('#fechaInicial').change(function(){
            var val = $(this).val();
            $('.fechaInicial').val(val);
        });

        $('#fechaFinal').change(function(){
            var val = $(this).val();
            $('.fechaFinal').val(val);
        });

        $('.dataTables-example').DataTable({
            pageLength: 10,
            responsive: true,
            dom: '<"html5buttons"B>lTfgitp',
            pageLength: 1000,
            buttons: [
                {extend: 'excel', title: 'Redeban'},
                {extend: 'pdf', title: 'Redeban'},

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
                },
                
            },

        });

        // #myInput is a <input type="text"> element
        var table = $('.dataTables-example').DataTable();
        
        $('.form-js').click(function () {
            var estado = $(this).find('input').val();
            table.search( estado ).draw();
        });

        $('.form-js').click(function () {
            var estado = $(this).find('input').val();
            if(estado == 'PAGO EN LINEA' || estado == 'ENVIO EMAIL' || estado == 'ENVIADO'){
                $('.estatus').show('slow');
                $('.pago').find('input,select,textarea').removeAttr('name');   
                $('.pago').find('input,select,textarea').removeAttr('required');
                $('.pago').hide();
                $('.devolucion').find('input,select,textarea').removeAttr('name');   
                $('.devolucion').find('input,select,textarea').removeAttr('required');
                $('.devolucion').hide();
                $('input:checkbox').show();
                $('.reporte').hide();
            }
            else if(estado == 'COMPLETADO'){
                $('.estatus').hide();
                $('.estatus').find('input,select,textarea').removeAttr('name');   
                $('.estatus').find('input,select,textarea').removeAttr('required'); 
                $('.devolucion').find('input,select,textarea').removeAttr('name');   
                $('.devolucion').find('input,select,textarea').removeAttr('required');
                $('.devolucion').hide();
                $('.pago').show('slow');
                $('input:checkbox').show();
                $('.reporte').show('slow');
            }else if(estado == 'PENDIENTE'){
                $('.pago').show('slow');
                $('input:checkbox').show();
                $('.reporte').hide();
                $('.devolucion').find('input,select,textarea').removeAttr('name');   
                $('.devolucion').find('input,select,textarea').removeAttr('required');
                $('.devolucion').hide();
                $('.estatus').hide();
                $('.estatus').find('input,select,textarea').removeAttr('name');   
                $('.estatus').find('input,select,textarea').removeAttr('required');       
            }else if(estado == 'RECHAZADA'){
                $('.devolucion').show('slow');
                $('input:checkbox').show();
                $('.reporte').hide();
                $('.pago').find('input,select,textarea').removeAttr('name');   
                $('.pago').find('input,select,textarea').removeAttr('required');
                $('.pago').hide();
                $('.estatus').hide();
                $('.estatus').find('input,select,textarea').removeAttr('name');   
                $('.estatus').find('input,select,textarea').removeAttr('required');       
            }
            else{
                $('.pago').show('slow');
                $('input:checkbox').show();
                $('.reporte').hide();
                $('.devolucion').find('input,select,textarea').removeAttr('name');   
                $('.devolucion').find('input,select,textarea').removeAttr('required');
                $('.devolucion').hide();
                $('.estatus').hide();
                $('.estatus').find('input,select,textarea').removeAttr('name');   
                $('.estatus').find('input,select,textarea').removeAttr('required');
            }
        });

        $('.check-all').click(function(){
            var check = $(this).is(':checked');
            if (check) {
                $('input:checkbox').attr('checked',true);
            }else{
                $('input:checkbox').attr('checked',false);
            }
            
        });

        // $('.check-u').click(function(){
        //     var check = $(this).is(':checked');
        //     var ac
        //     if (check) {
        //         var id = $(this).val();
        //         actualizar = $("#actualizar").val();
        //         actualizar.push(id);
        //         console.log(actualizar);
        //         $('#actualizar').val(actualizar);
        //     }else{
        //         var id = $(this).val();

        //         var actualizar = [$("#actualizar").val()];
        //         if (actualizar.includes(id)) { var index = actualizar.indexOf(id); if (index > -1) { actualizar.splice(index, 1); }
        //             }
        //         }
            
        // });



    });

</script>