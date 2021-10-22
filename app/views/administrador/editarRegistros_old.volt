<style>
    select{
        height: 33px!important;
    }
</style>

<hr><hr>
<div class="row col-md-12">
    <form action="{{url('administrador/editarRegistros')}}" method="POST">
        <div class="col-md-4">
            <select name="campana" required class="form-control">
                <option value="">Seleccione Campaña...</option>
                <option value="5">COLFONDOS</option>
                <option value="2">SOAT</option>
            </select>
            <br>
        </div>
        <div class="col-md-4">
            <input type="text" required placeholder="Buscar ventas" name="buscar" class="form-control">
        </div>
        <div class="col-md-4">
            <button class="btn btn-primary form-control">Buscar</button>
            <br>
        </div>
    </form>
</div>
<hr><hr>
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
{% if datoSoat is defined %}
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>Corrección de Registro</h5>
                
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">
                <h2 class="text-center" style="color: #1078EB;">{% for item in datoSoat %} {{item.cliente}} - {{item.placa}} {% endfor %}</h2>
                <hr>
                <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover oTables-example" >
            <thead>
            <tr>
                <!-- <th>#</th> -->
                <!-- <th>Cliente</th>
                <th>Placa</th> -->
                <th>Fecha Entrega</th>
                <th>Fecha Vigencia</th>
                <th>Tipficiación</th>
                <th>Asistencia</th>
                <th>Gopass</th>
                <th>Asesor</th>
                <th>Actualizar</th>
            </tr>
            </thead>
            <tbody>
            {% if datoSoat is empty %}
                No hay datos
            {% else %}
                {% for item in datoSoat %}
                    
                    <tr class="gradeX">
                        <!-- <td>{{item.id}}</td> -->
                        <!-- <td>{{item.cliente}}</td>
                        <td>{{item.placa}}</td> -->
                        <form action="{{url('administrador/editarRegistros')}}" method="POST">
                            <input type="hidden" name="editSoat" value="editSoat">
                            <input type="hidden" name="id" value="{{item.id}}">
                        <td><input type="date" required class="form-control" name="fechaEntrega" value="{{item.fechaEntrega}}"></td>
                        <td><input type="date" required class="form-control" name="fechaVigencia" value="{{item.fechaVigencia}}"></td>
                        <td>
                            <select name="tipificacion" id="tipificacion" required class="form-control">
                                <option value="12">VENTA NUEVA</option>
                                <option value="50">RENOVACIÓN</option>
                            </select>
                        </td>
                        <td>
                            <select name="asistencia" id="asistencia" required class="form-control">
                                <option value="TIPO 1">TIPO 1</option>
                                <option value="TIPO 2">TIPO 2</option>
                                <option value="TIPO 3">TIPO 3</option>
                                <option value="NO">NO</option>
                            </select>
                        </td>
                        <td>
                            <select name="gopass" id="gopass" class="form-control" required>
                                <option value="SI">SI</option>
                                <option value="NO">NO</option>
                            </select>
                        </td>
                        <td>
                            <select name="iidusergestionSoat" id="iidusergestionSoat" required class="form-control">
                                {% for itemUser in usuarios %}
                                <option value="{{itemUser.id}}">{{itemUser.usuario}}</option>
                                {% endfor %}
                            </select>
                        </td>
                        <td class="text-center">
                                <button type="submit" class="form-control btn btn-info">ACTUALIZAR</button>
                            </form>
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
    {% endif %}
{% if datoColfondos is defined %}
<div class="wrapper wrapper-content animated fadeInRight">
    <div class="row">
        <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>Corrección de Registro</h5>
                
                <div class="ibox-tools">
                    <a class="collapse-link">
                        <i class="fa fa-chevron-up"></i>
                    </a>
                </div>
            </div>
            <div class="ibox-content">

                <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover oTables-example" >
            <thead>
            <tr>
                <th>#</th>
                <th>Cliente</th>
                <th>Cedula</th>
                <th>Salario Mensual</th>
                <th>Asesor</th>
                <th>Actualizar</th>
            </tr>
            </thead>
            <tbody>
            {% if datoColfondos is empty %}
                No hay datos
            {% else %}
                {% for item in datoColfondos %}
                    
                    <tr class="gradeX">
                        <td>{{item.id}}</td>
                        <td>{{item.cliente}}</td>
                        <td>{{item.cedula}}</td>
                        <form action="{{url('administrador/editarRegistros')}}" method="POST">
                            <input type="hidden" name="editColfondos" value="editColfondos">
                            <input type="hidden" name="id" value="{{item.id}}">
                        <td><input type="number" required class="form-control" name="salarioMensual" value="{{item.salarioMensual}}"></td>
                        <td>
                            <select name="usuario_gestion" id="usuario_gestion" required class="form-control">
                                {% for itemUser in usuarios %}
                                <option value="{{itemUser.id}}">{{itemUser.usuario}}</option>
                                {% endfor %}
                            </select>
                        </td>
                        <td class="text-center">
                                <button type="submit" class="form-control btn btn-info">ACTUALIZAR</button>
                            </form>
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
    {% endif %}
</div>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>

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

{% if datoColfondos is defined %}
    {% for item in datoColfondos %}
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