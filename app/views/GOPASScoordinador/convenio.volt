<style>
    select{
        height: 34px!important;
    }        
    table{
		text-transform: uppercase;
	}
	input{
		text-transform: uppercase;
	}
	
</style>
<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<div class="col-md-12">
    <h1>Convenios <i class="fas fa-handshake"></i></h1>
    <hr>
</div>

<div class="col-md-12">
    <button type="button" class="btn btn-primary pl-3" id = "botonCrear">Crear nuevo convenio <i class="fas fa-plus"></i></button>
</div>

<div class="col-md-12" id = "formCrear" style = "padding-top: 20px; padding-bottom: 20px;">
    <form action="{{url('GOPASScoordinador/guardarConvenio')}}" method="POST">
        <div class="col-md-4">
            <label for="">Nombre del convenio:</label>
            <input type="text" name="nombreConvenio" required class="form-control" placeholder="Nombre del convenio">
        </div>
        <div class="col-md-2" style="margin-top: 5px;">
            <br>
            <button class="btn btn-primary form-control" id="btnNuevoConv" name="btnNuevoConv">Guardar convenio</button>
        </div>
    </form>
</div>
<br><br><br><br><br><br><br><br><br>

{% if ventaKO is defined %}
    <br>
    <div class="col-md-12">
        <div class=" col-md-12 alert alert-success alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> El convenio se registró exitosamente.
        </div>
    </div>
{% endif %}
{% if nuevo is defined %}
    <br>
    <div class="col-md-12">
        <div class=" col-md-12 alert alert-success alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> El convenio se agrego exitosamente.
        </div>
    </div>
{% endif %}
{% if actualizar is defined %}
    <br>
    <div class="col-md-12">
        <div class=" col-md-12 alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> El convenio se actualizó exitosamente.
        </div>
    </div>
{% endif %}
{% if desactivo is defined %}
    <br>
    <div class="col-md-12">
        <div class=" col-md-12 alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> El convenio se desactivo exitosamente.
        </div>
    </div>
{% endif %}
{% if eliminar is defined %}
    <br>
    <div class="col-md-12">
        <div class=" col-md-12 alert alert-danger alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> El convenio se eliminó exitosamente.
        </div>
    </div>
{% endif %}
{% if anular is defined %}
    <br>
    <div class="col-md-12">
        <div class="alert alert-info alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-check"></i> Venta actualizada con exito.
        </div>
    </div>
{% endif %}

{% if otraCiudad is defined %}
<br>
<div class="alert alert-danger alert-dismissable" style="margin-left: 2%; margin-right: 2%;">
    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
    <i class="fas fa-ban"></i> La placa existe en la ciudad de <b>{{otraCiudad}}</b>.
</div>
{% endif %}
<div class="col-md-12">
    {% if convenios is defined %}
    <br>
    <div class="col-md-12">
        <div class="ibox-content table-responsive" style="padding:0!important;">
            <table class="table table-striped table-bordered no-margins">
                <thead>
                	<th>Id</th>
                	<th>Nombre convenio</th>
                    <th>Estado</th>
                	<th>Accion</th>
                    <th></th>
                </thead>
                <tbody>
                {% for item in convenios %}
                <tr>
                    <form action="{{url('GOPASScoordinador/actualizarConvenio')}}" method="POST">
                        <td>{{item.convenioId}}</td>
                        <td><input type="text" value = "{{item.nombre}}" class = "form-control" name = "nombreConvenioA"></td>
                        <td>
                            {% if item.estado is 1 %}
                                Activo
                            {% else %}
                                Inactivo
                            {% endif %}
                        </td>
                        <td class="text-center">
                            <input type="hidden" name="actualizar" value="{{item.convenioId}}">
                            <button type="submit" class="btn btn-primary">Actualizar <i class="fas fa-pencil-alt"></i></button>
                        </td>
                    </form>
                    <form action="{{url('GOPASScoordinador/eliminarConvenio')}}" id="anular" method="POST">
                        <td  class="text-center">
                            <input type="hidden" name="eliminar" value="{{item.convenioId}}">
                            <button type="submit" class="btn btn-danger">Desactivar <i class="fas fa-trash"></i></button>
                        </td>
                    </form>
                </tr>
                {% endfor %}
                </tbody>
            </table>
        </div>
    </div>
    {% else %}
    <br>
    <div class="col-md-12">
        <div class=" col-md-12 alert alert-danger alert-dismissable">
            <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
            <i class="fas fa-ban"></i> Aun no hay convenios registrados.
        </div>
    </div>
    {% endif %}
    <div class="col-lg-6 h-100 p-lg">
            
        </div>
</div>
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script>
    $(document).ready(function(){
        $('.demo3').click(function () {
            swal({
                title: "¿Seguro de cambiar a venta efectiva?",
                type: "warning",
                showCancelButton: true,
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "Si",
                closeOnConfirm: false
            }, function () {
                $('#anular').submit();
            });
        });

        $('#formCrear').hide();
    });

    $('#botonCrear').click(function (){
        $('#formCrear').toggle('slow');
    });

    // $('.nombreConvenio').change( function(){
    //     alert($('.nombreConvenio').val());
    // });
</script>