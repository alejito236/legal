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
        <div>
            <div class="col-lg-2 form-js">
                <br>
                <input type="hidden" value="Pendiente">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>Pendientes</h5>
                        <div class="ibox-tools">
                            
                        </div>
                    </div>
                    <div class="ibox-content table-responsive" style="padding:0!important;">
                        <table class="table table-hover no-margins">
                            <thead>
                            </thead>
                            <tbody>
                                <tr id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <td><span class="label label-success "><b>Renovaciones:</b></span></td>
                                    <td><h3>{{ renovacionP }}</h3></td>
                                </tr>
                                <tr id="" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <td><span class="label label-success "><b>Venta efectiva:</b></span></td>
                                    <td><h3>{{ ventaEfectivaP }}</h3></td>
                                </tr>
                                <tr id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                    <td><span class="label label-primary "><b>Cantidad total:</b></span></td>
                                    <td><h3>{{ pendientes }}</h3></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="text-center">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                            Herramientas
                            <i class="fa fa-wrench"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-user">
                            <li>
                                <form action="{{url('administrador/reporteVentasUsuariosTxt')}}" target="_blank" method="POST">
                                    <input type="hidden" name="fechaInicial" value="{{fechaInicial}}">
                                    <input type="hidden" name="fechaFinal" value="{{fechaFinal}}">
                                    <button class="btn btn-warning form-control" id="descargue">Txt</button>
                                </form>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-2 form-js">
                <br>
                <input type="hidden" value="Enviado">
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
                                    <td><span class="label label-success "><b>Renovaciones:</b></span></td>
                                    <td><h3>{{ renovacionE }}</h3></td>
                                </tr>
                                <tr>
                                    <td><span class="label label-success "><b>Venta efectiva:</b></span></td>
                                    <td><h3>{{ ventaEfectivaE }}</h3></td>
                                </tr>
                                <tr>
                                    <td><span class="label label-primary "><b>Cantidad total:</b></span></td>
                                    <td><h3>{{ enviadas }}</h3></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
    
            <div class="col-lg-2 form-js">
                <br>
                <input type="hidden" value="Aprobado">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>Aprobadas</h5>
                        <div class="ibox-tools">
                            
                        </div>
                    </div>
                    <div class="ibox-content table-responsive" style="padding:0!important;">
                        <table class="table table-hover no-margins">
                            <thead>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="label label-success "><b>Renovaciones:</b></span></td>
                                    <td><h3>{{ renovacionA }}</h3></td>
                                </tr>
                                <tr>
                                    <td><span class="label label-success "><b>Venta efectiva:</b></span></td>
                                    <td><h3>{{ ventaEfectivaA }}</h3></td>
                                </tr>
                                <tr>
                                    <td><span class="label label-primary "><b>Cantidad total:</b></span></td>
                                    <td><h3>{{ aprobadas }}</h3></td>
                                </tr>
                            </tbody>
                        </table>   
                    </div>
                </div>
            </div>
            
            <div class="col-lg-2 form-js">
                <br>
                <input type="hidden" value="Rechazado">
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
                                    <td><span class="label label-success "><b>Renovaciones:</b></span></td>
                                    <td><h3>{{ renovacionR }}</h3></td>
                                </tr>
                                <tr>
                                    <td><span class="label label-success "><b>Venta efectiva:</b></span></td>
                                    <td><h3>{{ ventaEfectivaR }}</h3></td>
                                </tr>
                                <tr>
                                    <td><span class="label label-primary "><b>Cantidad total:</b></span></td>
                                    <td><h3>{{ rechazadas }}</h3></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 form-js">
                <br>
                <input type="hidden" value="Recuperada">
                <div class="ibox ">
                    <div class="ibox-title">
                        <h5>Recuperados</h5>
                        <div class="ibox-tools">
                            
                        </div>
                    </div>
                    <div class="ibox-content table-responsive" style="padding:0!important;">
                        <table class="table table-hover no-margins">
                            <thead>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><span class="label label-success "><b>Renovaciones:</b></span></td>
                                    <td><h3>{{ renovacionRec }}</h3></td>
                                </tr>
                                <tr>
                                    <td><span class="label label-success "><b>Venta efectiva:</b></span></td>
                                    <td><h3>{{ ventaEfectivaRec }}</h3></td>
                                </tr>
                                <tr>
                                    <td><span class="label label-primary "><b>Cantidad total:</b></span></td>
                                    <td><h3>{{ recuperadas}}</h3></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-lg-2 form-js">
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
                                <td><h3>{{ totalEstatus }}</h3></td>
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
            <form action="{{url('Segurostdccoordinador/redebanReporteAprobado')}}" target="_blank" method="POST">
                <input type="hidden" value="{{fechaInicial}}" id="fechaInicial" required name="fechaInicial" class="form-control">
                <input type="hidden" value="{{fechaFinal}}" id="fechaFinal" required name="fechaFinal" class="form-control">
                <button class=" btn btn-primary pull-right ">Exportar</button>
            </form>
            <br><br><br>
        </div>
        <br>
        <span id="resultado"></span>
        <form id="frm-example" action="{{url('administrador/editRedeban')}}" method="POST">
            <input type="hidden" id="datas" value="">

            <div class="col-lg-12 align-items-center justify-content-center">
                <div class=" estatus">
                    <div class="col-md-8 text-right" style="padding-top: 5px;">
                        <p>Gestión:</p>
                    </div>
                    <div class="col-md-2">
                        <select name="estatus" id="estatus"  class="form-control">
                            <option value="">Seleccione..</option>
                            <option value="0">Pendiente</option>
                            <!--<option value="1">Enviado</option>-->
                            <option value="2">Aprobada</option>
                            <option value="3">Rechazada</option>
                            <option value="4">Recuperada</option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <button class=" btn btn-primary" id="actEstado">Actualizar</button>
                    </div>
                </div>
            <div class="ibox" style="padding-top: 30px;">
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
                                    <th><input name="select_all" value="1" id="example-select-all" type="checkbox" /></th>
                                    <th>#</th>
                                    <th>Cedula</th>
                                    <th>Nombre Completo</th>
                                    <th>Número de Tarjeta</th>
                                    <th>Placa</th>
                                    <th>Valor</th>
                                    <th>Cuotas</th>
                                    <th>Estado</th>
                                    <th>Fecha Gestión</th>
                                    <th>enviar</th>
                                </tr>
                            </thead>
                            <tbody>
                                
                                {% if data is empty %}
                                No hay datos
                                {% else %}
                                {% for item in data %}
                                
                                <tr class="gradeX">
                                  <!--  <form action="{{url('administrador/editNumRedeban')}}" method="POST"> -->
                                        <td class="text-center">
                                            <input type="checkbox" name="id[]" value="{{item.id}}" class="textHidden">
                                        </td>
                                        <td>{{item.id}}</td>
                                        <td>{{item.cedula}}</td>
                                        <td>{{item.nombreCliente}}</td>
                                        <td>
                                            {% if item.tarjeta is empty %}
                                                <input type="text" value="SIN DILIGENCIAR" id="numerotarjeta{{item.id}}" name="numerotarjeta" class="form-control" style="width: auto;">
                                            {% else %}
                                                <input type="text" value="{{item.tarjeta}}" id="numerotarjeta{{item.id}}" name="numerotarjeta" class="form-control" style="width: auto;">
                                            {% endif %}
                                        </td>
                                        <td>{{item.placa}} </td>
                                        <td>
                                            {{item.valor}}
                                            {% if item.valorDescuento is empty %}                                    
                                            {% else %}
                                                <br>
                                                Con descuento: {{item.valorDescuento}}
                                            {% endif %}
                                        </td>
                                        <td>{{item.cuotas}}</td>
                                        <td>{{item.estado}}</td>
                                        <td>
                                            {% if item.fechaGestion is empty %}
                                                SIN DILIGENCIAR
                                            {% else %}
                                                {{item.fechaGestion}}
                                            {% endif %}
                                        </td>
                                        <td>
                                            <input type="hidden" value="{{item.id}}" id="idActualizar" name="idActualizar">
                                            <input type="button" id="CambiarTarjeta{{item.id}}" onclick="cambiartarjet('{{item.id}}')" value="Actualizar" class="btn btn-warning">
                                        </td>
                                    
                                    <!-- </form> -->
                                    </tr>
                                {% endfor %}
                                {% endif %}
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>#</th>
                                <th>Cedula</th>
                                <th>Nombre Completo</th>
                                <th>Número de Tarjeta</th>
                                <th>Estado</th>
                                <th>Fecha Gestión</th>
                                <th>Acción</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>

                </div>
            </div>
        </form>
    </div>

</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script>
        function cambiartarjet(b){

            $('#estatus').removeAttr('required');
            var d = 'numerotarjeta'+b;
            var c = document.getElementById(d).value;
          
            var parametros = {
                "id" : b,
                "numerotarjeta" : c
            };
            var url = "{{url('administrador/editNumRedeban')}}";
            $.ajax({
                    data:  parametros, //datos que se envian a traves de ajax
                    url:   url, //archivo que recibe la peticion
                    type:  'post', //método de envio
                    beforeSend: function () {
                            $("#resultado").html("Procesando, espere por favor...");
                    },
                    success:  function (response) { //una vez que el archivo recibe el request lo procesa y lo devuelve
                            $("#resultado").html('<div class="col-md-12">  <div class="alert alert-info alert-dismissable"> <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button><i class="fas fa-check"></i> Datos actualizados con exito. </div></div>');
                    }
            });

        }
        

  
        $('#actEstado').click( function(){
            $('#estatus').attr('required', true);
        });
       
</script>
{% if dato is defined %}
    <script>
        var edit = "{{dato['edit']}}";
        
        if(edit == 'edit'){

            $('#myModal5').modal('show');

            $('.btn-white').click(function(){
                 window.location='{{url("Segurostdccoordinador/usuarios")}}';
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

        $('.reporte').hide();

        $('.estatus').hide();
      //  $('input:checkbox').hide();

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
            pageLength: 100,
            columnDefs: [{
                targets: 0,
                searchable:false,
                orderable:false,
                className: 'dt-body-center'
               
            }],
            order: [1, 'asc'],
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

        
        // Handle click on "Select all" control
        $('#example-select-all').on('click', function(){
            // Check/uncheck all checkboxes in the table
            var rows = table.rows({ 'search': 'applied' }).nodes();
            $('input[type="checkbox"]', rows).prop('checked', this.checked);
        });

        // Handle click on checkbox to set state of "Select all" control
        $('#example tbody').on('change', 'input[type="checkbox"]', function(){
            // If checkbox is not checked
            if(!this.checked){
                var el = $('#example-select-all').get(0);
                // If "Select all" control is checked and has 'indeterminate' property
                if(el && el.checked && ('indeterminate' in el)){
                    // Set visual state of "Select all" control 
                    // as 'indeterminate'
                    el.indeterminate = true;
                }
            }
        });
            
        $('#frm-example').on('submit', function(e){
            var form = this;

            // Iterate over all checkboxes in the table
            table.$('input[type="checkbox"]').each(function(){
                // If checkbox doesn't exist in DOM
                if(!$.contains(document, this)){
                    // If checkbox is checked
                    if(this.checked){
                    // Create a hidden element 
                    $(form).append(
                        $('<input>')
                            .attr('type', 'hidden')
                            .attr('name', this.name)
                            .val(this.value)
                    );
                   
                    }
                } 
            });



            // FOR TESTING ONLY
            
            // Output form data to a console
            $('#example-console').text($(form).serialize()); 
            var arrayDeCadenas = $(form).serialize().split('&id%5B%5D=');
            arrayDeCadenas = arrayDeCadenas.splice(1,0);
            document.getElementById('datas').value= arrayDeCadenas; 
         
        });
        
        $('.form-js').click(function () {
            var estado = $(this).find('input').val();
            table.search( estado ).draw();
        });

        $('.form-js').click(function () {
            var estado = $(this).find('input').val();

            $('.estatus').show('slow');
            $('input:checkbox').show();
            $('.reporte').hide();
            if(estado == 'Aprobada'){
                $('.reporte').show('slow');
            }
            else if(estado == ''){
                $('.estatus').hide('slow');
                $('input:checkbox').hide();
                $('.reporte').hide();

            }
        });     

    });

</script>
