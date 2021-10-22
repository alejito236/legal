<style>
    #modalPoll{
        overflow: hidden;
    }
	select{
		height: 33px!important;
	}
  table{
		text-transform: uppercase;
	}
	input{
		text-transform: uppercase;
	}
</style>
<link href="css/plugins/sweetalert/sweetalert.css" rel="stylesheet">
<br>
<div class="wrapper ">
<div class="row">
        <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-content">
                    <h5 class="m-b-md">Reagendamiento de Ventas</h5>
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> {{cantidad.ventas}}
                    	
                    </h2>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row" style="margin-left: 0.5%; margin-right: 0.5%;">
		<form action="{{url('GOPASSsac/historico')}}"  method="POST">
			<!-- <div class="col-md-6">
				<select name="ciudad" id="ciudad" required class="form-control">
					<option value="">Seleccione..</option>
				{% for item in ciudades %}
					<option value="{{item.id}}">{{item.ciudad}}</option>
				{% endfor %}
				</select>
			</div> -->
			<div class="col-md-6">
				<div class="col-md-10">
					<input type="text" id="placa" placeholder="Buscar" name="placa" class="form-control">
				</div>
				<div class="col-md-2">
					<button id="mensaje" class="btn btn-primary form-control">Buscar</button>
				</div>
			</div>
		</form>
    </div>
    {% if notFound is defined  %}

<br>
<div id="notFound" class="alert alert-danger alert-dismissable" style="margin-left: 2%; margin-right: 2%;">
    <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
    <i class="fas fa-ban"></i> La placa {{notFound}} no se encuenta en el Historico.
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
    <form action="{{url('GOPASSsac/index')}}" method="POST">
        <!-- {% for item in data %}-->
        <div class="col-md-4">
                <!-- <input type="hidden" name="ciudad" value="{{item.ciudad}}"> -->
                <input type="hidden" name="placa" value="{{item.placa}}">
        </div>
        <!-- {% endfor %} -->
          <!--{% if !otraCiudad %}-->
           <!--{% if !notFound %}-->
        <div class="col-md-2" style="margin-top: 5px;margin: 0 83%;">
            <br>
            <button class="btn btn-primary form-control">Gestionar</button>
        </div>
          <!--{% endif %}-->
          <!--{% endif %}-->
    </form>
</div>


<div class="col-md-12">
		{% if data is defined %}
		<br>
		<div class="col-md-12">
			<div class="ibox-content table-responsive" style="padding:0!important;">
				<table class="table table-striped table-bordered no-margins">
					<thead>
						<th>#</th>
						<th>Fecha Venta</th>
						<th>Asesor</th>
						<th>Cliente</th>
            <th>Fecha Entrega</th>
            <th>Establecimiento</th>
            <th>Tag</th>
            <th>Placa</th>
						<!-- <th>Ver Informacion</th> -->
					</thead>
					<tbody>
                    {% for item in data %}
					<tr>
                        <td>{{item.num}}</td>
						<td>{{item.fecha_gestion}}</td>
						<td>{{item.user_gestion}}</td>
						<td>{{item.cliente}}</td>
						<td>{{item.fechaEntrega}}</td>
                        <td>{{item.establecimiento}}</td>
                        <td>{{item.tag}}</td>
                        <td>{{item.placa}}</td>
						<!-- <td class="text-center">
                                <input type="hidden" value="{{item.id}}">
							    <button type="button" style="background-color: #33b5e5" class="btn btn-info buscar" ><i class="far fa-file-alt"></i></button>
                        </td> -->
                    </tr>
                    {% endfor %}
                    </tbody>
                </table>
			</div>
		</div>
		{% endif %}
		<div class="col-lg-6 h-100 p-lg">
				
		</div>
    </div>

      <!-- Modal: modalPoll -->
      <div class="modal fade right" id="modalPoll" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="dialog">
          <div style="width: 755px;height: 576px;" class="modal-content">
            <!--Header-->
            <div class="modal-header" style="height: 60px;">
              <p class="heading lead">Historico Gestión
              </p>
      
              <button style="margin: -7% 0%;" type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true" class="white-text">×</span>
              </button>
            </div>
      
            <!--Body-->
            <div class="modal-body">
              <div class="text-center">
                <i class="far fa-file-alt fa-4x mb-6 animated rotateIn" style="color: #33b5e5"></i><br><br>
                <p>
                  <strong>Informacion General</strong>
                </p>
              </div>
      
              <hr>
              <!-- Informacion -->
           
                
              <div class="text-left col-md-3">
                    <strong >Cliente</strong><p style="margin: 0% 2%;" id="cliente"></p>
              </div>
              <div class="text-center col-md-3" style="margin: 0% -14%;" >
                    <strong>Cedula Cliente</strong><p id="documento_clie"></p>
              </div>
              <div class="text-center col-md-3" style="margin: 0% 6%;">
                    <strong>Telefono Cliente</strong><p id="celular_clie"></p>
              </div>
              <div class="text-center col-md-3" style="margin: 0% -11%;">
                    <strong>Correo Cliente</strong><p id="correo_clie"></p>
              </div>
              <div class="text-left col-md-3" style="margin: -7% 75%;">
                    <strong>Fecha De Gestión</strong><p id="fecha_gestion"></p>
              </div>


              <div class="text-right col-md-3" style="margin: 2% -12%;">
                    <strong style="margin: auto 14%;">Asesor</strong><p style="margin: 0% 7% -7% 31%;
                    " id="user_gestion"></p>
              </div>
              <div class="text-left col-md-3" style="margin: 2% 13%;">
                    <strong>Establecimiento</strong><p id="establecimiento"></p>
              </div>
              <div class="text-right col-md-3" style="margin: 2% -23%;">
                <strong>Placa</strong><p id="placa"></p>
              </div>
              <div class="text-center col-md-3" style="margin: 2% 0%;">
                    <strong>Tag</strong><p id="tag"></p>
              </div>
              <div class="text-center col-md-3" style="margin: -9% 74%;">
                    <strong>Dirección De Entrega</strong><p id="direccionEntrega"></p>    
              </div>

              <div class="text-left col-md-3" style="margin: 1% -2%;">
                    <strong>Indicaciones De Entrega</strong><p id="indicacionesEntrega"></p>
              </div>
              <div class="text-center col-md-3" style="margin: 1% -11%;">
                    <strong>Fecha De Entrega</strong><p id="fechaEntrega"></p>
              </div>
              <!-- <div class="text-center col-md-3" style="margin: 1% 7%;">
                    <strong>Fecha de Entrega</strong><p id="fechaEntrega"></p>
              </div>
              <div class="text-center col-md-3" style="margin: 1% -10%;">
                    <strong>Dirección de Entrega</strong><p id="direccionEntrega"></p>
              </div>
              <div class="text-right col-md-3" style="    margin: 29% 68%; position: absolute;">
                    <strong style="margin: auto 18%;">Indicaciones</strong><p id="indicaciones"></p>
              </div> -->
              
              <!-- Informacion -->
            </div>
        </div>
            <!--Footer-->
            <div class="justify-content-center" style="margin: -9% 110%;
            position: absolute;">
                <a type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</a>
            </div>
          </div>
        </div>
      </div>
    </div>
<!-- Sweet alert -->
<script src="js/plugins/sweetalert/sweetalert.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
<script>

    //funcion para traer el Cargo
    $(".buscar").click(function(e) {
        
        var url = "{{url('GOPASSsac/historico')}}";
        var id_venta = $(this).parent().find('input').val();

        var parametros = {
            "id" : id_venta
        }
        console.log(id_venta)
        $.ajax({
            type: "POST",
            url: url,
            data: parametros,
            success: function(data){
                
                var body = JSON.parse(data);

                $('#cliente').html(body[0].cliente);
                // $('#documento_clie').html(body[0].documento_clie);
                // $('#celular_clie').html(body[0].celular_clie);
                // $('#correo_clie').html(body[0].correo_clie);
                // $('#fecha_gestion').html(body[0].fecha_gestion);
                // $('#user_gestion').html(body[0].user_gestion);
                // $('#establecimiento').html(body[0].establecimiento);
                // $('#placa').html(body[0].placa);
                // $('#tag').html(body[0].tag);
                // $('#direccionEntrega').html(body[0].direccionEntrega);
                // $('#indicacionesEntrega').html(body[0].indicacionesEntrega);
                // $('#fechaEntrega').html(body[0].fechaEntrega);
                
                $('#modalPoll').modal('show');
            }
        });
        e.preventDefault();
    });

</script>