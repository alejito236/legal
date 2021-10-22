<style>
    select{
        height: 33px!important;
    }
</style>

<br>
<div class="text-center">
    <h1>Opciones de Manejo de Usuario</h1>
    <br>
    <div class="col-md-12 col-xs-12">
        <a onclick="unidad()" style="margin-left: 2%;"><button class="btn btn-success" ><i class="fas fa-user-check"></i> Listar Usuarios </button></a>
        <a onclick="general()"><button class="btn btn-success" ><i class="fas fa-users"></i> Cargar Usuarios </button></a>
        <br>
    </div>
    <br><br>
</div>
<div class="wrapper wrapper-content animated fadeInRight" id="fadeInRight">
    <div class="row">
        <div class="col-lg-12">
        <div class="ibox ">
            <div class="ibox-title">
                <h5>Candidatos</h5>
                
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
                                <th>Cedula</th>
                                <th>Nombre Completo</th>
                                <th>Campaña</th>
                                <th>Grupo</th>
                                <th>Editar</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                        {% if datas is empty %}
                            No hay datos disponibles
                        {% else %}
                            {% for item in datas %}
                                <tr class="gradeX">
                                    <form action="{{url('administrador/cargarUserGroup')}}" method="POST">
                                        <td>
                                            {{item.num}}
                                        </td>
                                        <td>
                                            <input type="hidden" name="id" value={{item.id}}>
                                            <input type="hidden" name="cedula" value={{item.cedula}}>
                                            {{item.cedula}}
                                        </td>
                                        <td>
                                            {{item.nombre}}
                                        </td>
                                        <td>
                                            {{item.campana}}
                                        </td>
                                        <td>
                                            <input type="text" name="userG" value="{{item.userG}}" class="form-control">
                                        </td>
                                        <td class="text-center">
                                            <button type="submit" class="btn btn-warning">Actualizar</button>
                                        </td>
                                    </form>
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
</div>


<div class="wrapper wrapper-content animated fadeInLeft" id="fadeInLeft">
    
   
    <div class="white-bg dashboard-header col-md-5 col-md-offset-1">
        <button class="form-control btn btn-warning" type="button" data-toggle="modal" data-target="#myModal5">Indicaciones</button><br><br>
        <a href="../Plantillas_Excel/PlantillaCargueUsuariosGroup.csv" target="_blank" class="btn btn-primary form-control"><i class="fas fa-file-excel"></i> Descargar plantilla</a>
        <br>
    </div>

    <div class="white-bg dashboard-header col-md-5  ">
        <form enctype="multipart/form-data" method="POST" action="{{url('administrador/cargarUserGroup')}}"  name="cargarBase" >
            <input type="file" name="archivoExcel" id="file-5" class="form-control inputfile inputfile-4" data-multiple-caption="{count} files selected" multiple required/>
            <input type="hidden" name="campana" value="2"/>
            <br>
            <select style="height: 40px;" name="verificar" required id="" class="form-control">
                <option value="">Seleccione...</option>
                <!-- <option value="1">SOLO CARGAR</option> -->
                <!-- <option value="2">CARGAR Y ACTUALIZAR</option> -->
                <option value="3">SOLO ACTUALIZAR</option>
            </select>
            <br>
            <button class="btn btn-primary form-control"><i class="fas fa-upload"></i> Subir</button>
        </form>
        <br>
    </div>

    {% if data is defined %}

    <div class="row  border-bottom  dashboard-header">
        <div class="col-md-5 col-md-offset-3">
            <br><br>
            <div class="ibox-title">
                <h5>Datos del proceso</h5>
            </div>
            <div class="ibox-content">
                <ul class="list-group clear-list m-t">
                    <li class="list-group-item fist-item">
                        
                        <span class="label label-success"><i class="far fa-clock"></i></span> Total de datos
                        <span class="float-right datoInicio">
                            {{data.total}}
                        </span>
                    </li>
                    <li class="list-group-item">
                        
                        <span class="label label-info"><i class="fas fa-chart-area"></i></span> Insertados
                        <span class="float-right datoPromedio">
                            {{data.insertados}}
                        </span>
                    </li>
                    <li class="list-group-item">
                        
                        <span class="label label-primary "><i class="fas fa-stopwatch"></i></span> Actualizados
                        <span class="float-right datoTrabajo">
                            {{data.actualizados}}
                        </span>
                    </li>
                    <li class="list-group-item">
                        
                        <span class="label label-warning "><i class="fas fa-check"></i></span> Existen
                        <span class="float-right datoTrabajo">
                            {{data.existen}}
                        </span>
                    </li>
                    <li class="list-group-item">
                        
                        <span class="label label-danger"><i class="fas fa-bug"></i></span> Errores
                        <span class="float-right bg-gray datoErrores">
                            {{data.errores}}
                        </span>
                    </li>
                </ul>
            </div>
        </div>  
    </div>
    {% endif %}
    <div class="modal inmodal fade" id="myModal5" tabindex="-1" role="dialog2" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">Indicaciones para subir base</h4>
                </div>
                <div class="modal-body">
                    
                        <div class="row">
                            <div class="col-md-6">
                                <div class="col-md-6">
                                    <label for="">Primer paso:</label>
                                </div>
                                <div class="col-md-12">
                                    <p>Descargue la planilla.</p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="col-md-6">
                                    <label for="">Segundo paso:</label>
                                </div>
                                <div class="col-md-12">
                                    <p>Cargue todos los datos solicitados en la planilla, los datos no deben tener caracteres especiales.</p>
                                </div>
                            </div>
                            <div class="col-md-6">
    
                            </div>
                        </div>
    
                </div>
    
                <div class="modal-footer">
                    <button type="button" class="btn btn-white" data-dismiss="modal">Cerrar</button>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script>

    $('#fadeInLeft').hide();
    $('#fadeInRight').show();

    function unidad(){
    
        $('#fadeInLeft').hide();
        $('#fadeInRight').show();
    }
    function general(){
        $('#fadeInRight').hide();
        $('#fadeInLeft').show();
    }
    

    $(document).ready(function(){
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
{% if datas is defined %}

    <script>
        var edit = "{{dato['edit']}}";
        
        if(edit == 'edit'){

            $('#myModal5').modal('show');

            $('.btn-white').click(function(){
                 window.location='{{url("AVVILLAScoordinador/usuarios")}}';
            });

        }
    </script>

{% endif %}