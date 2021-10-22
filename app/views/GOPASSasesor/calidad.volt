<br>
<style>
    table {
        font-size: 16px;
    }
    
    .label {
        color: #4A4747!important;
    }
    
    .btn{
        background-color: #4F7F20!important;
        color: #f2f2f2!important;
        border-color: #80B250!important;
    }
    .btn:hover{
        background-color: #80B250!important;
	}
</style>
<br>
<div class="col-lg-12">
    <!-- <form action="{{url('SOATasesor/calidad')}}" method="POST"> -->
    <div class="col-lg-2"></div>
    <div class="col-lg-3">
        <label for="">Fecha inicio:</label>
        <input type="date" name="fechaInicio" value="{{fechaInicial}}" class="form-control">
    </div>
    <div class="col-lg-3">
        <label for="">Fecha final:</label>
        <input type="date" name="fechaFinal" value="{{fechaFinal}}" class="form-control">
    </div>
    <div class="col-lg-2">
        <label for=""> <br></label>
        <button class="btn btn-primary form-control">Filtrar</button>
    </div>
    </form>
</div>
<br><br><br><br><br><br>

<div class="wrapper ">
    <div class="row">
        <div class="col-lg-3">
            <div class="ibox">
                <div class="ibox-content">
                    <h5 class="m-b-md">Bogota</h5>
                    {% if ventas.bogota > 12 %}
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> {{ventas.bogota}}

                    </h2>
                    {% endif %} {% if ventas.bogota
                    < 13 AND ventas.bogota> 8 %}
                        <h2 class="text-warning">
                            <i class="fa fa-play fa-rotate-200"></i> {{ventas.bogota}}

                        </h2>
                        {% endif %} {% if ventas.bogota
                        < 9 %} <h2 class="text-danger">
                            <i class="fa fa-play fa-rotate-90"></i> {{ventas.bogota}}
                            </h2>
                            {% endif %}
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="ibox">
                <div class="ibox-content ">
                    <h5 class="m-b-md">Cali</h5>
                    {% if ventas.cali > 12 %}
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> {{ventas.cali}}

                    </h2>
                    {% endif %} {% if ventas.cali
                    < 13 AND ventas.cali> 8 %}
                        <h2 class="text-warning">
                            <i class="fa fa-play fa-rotate-200"></i> {{ventas.cali}}

                        </h2>
                        {% endif %} {% if ventas.cali
                        < 9 %} <h2 class="text-danger">
                            <i class="fa fa-play fa-rotate-90"></i> {{ventas.cali}}

                            </h2>
                            {% endif %}

                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="ibox">
                <div class="ibox-content ">
                    <h5 class="m-b-md">Bucaramanga</h5>
                    {% if ventas.bucaramanga > 12 %}
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> {{ventas.bucaramanga}}

                    </h2>
                    {% endif %} {% if ventas.bucaramanga
                    < 13 AND ventas.bucaramanga> 8 %}
                        <h2 class="text-warning">
                            <i class="fa fa-play fa-rotate-200"></i> {{ventas.bucaramanga}}

                        </h2>
                        {% endif %} {% if ventas.bucaramanga
                        < 9 %} <h2 class="text-danger">
                            <i class="fa fa-play fa-rotate-90"></i> {{ventas.bucaramanga}}

                            </h2>
                            {% endif %}
                </div>
            </div>
        </div>
        <div class="col-lg-3">
            <div class="ibox">
                <div class="ibox-content ">
                    <h5 class="m-b-md">Ibague</h5>
                    {% if ventas.ibague > 12 %}
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> {{ventas.ibague}}

                    </h2>
                    {% endif %} {% if ventas.ibague
                    < 13 AND ventas.ibague> 8 %}
                        <h2 class="text-warning">
                            <i class="fa fa-play fa-rotate-200"></i> {{ventas.ibague}}

                        </h2>
                        {% endif %} {% if ventas.ibague
                        < 9 %} <h2 class="text-danger">
                            <i class="fa fa-play fa-rotate-90"></i> {{ventas.ibague}}

                            </h2>
                            {% endif %}
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-content ">
                    <h5 class="m-b-md">Medellín</h5>
                    {% if ventas.medellin > 12 %}
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> {{ventas.medellin}}

                    </h2>
                    {% endif %} {% if ventas.medellin
                    < 13 AND ventas.medellin> 8 %}
                        <h2 class="text-warning">
                            <i class="fa fa-play fa-rotate-200"></i> {{ventas.medellin}}

                        </h2>
                        {% endif %} {% if ventas.medellin
                        < 9 %} <h2 class="text-danger">
                            <i class="fa fa-play fa-rotate-90"></i> {{ventas.medellin}}

                            </h2>
                            {% endif %}
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-content ">
                    <h5 class="m-b-md">Tunja</h5>
                    {% if ventas.tunja > 12 %}
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> {{ventas.tunja}}

                    </h2>
                    {% endif %} {% if ventas.tunja
                    < 13 AND ventas.tunja> 8 %}
                        <h2 class="text-warning">
                            <i class="fa fa-play fa-rotate-200"></i> {{ventas.tunja}}

                        </h2>
                        {% endif %} {% if ventas.tunja
                        < 9 %} <h2 class="text-danger">
                            <i class="fa fa-play fa-rotate-90"></i> {{ventas.tunja}}

                            </h2>
                            {% endif %}
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-content ">
                    <h5 class="m-b-md">Eje Cafetero</h5>
                    {% if ventas.eje_cafetero > 12 %}
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> {{ventas.eje_cafetero}}

                    </h2>
                    {% endif %} {% if ventas.eje_cafetero
                    < 13 AND ventas.eje_cafetero> 8 %}
                        <h2 class="text-warning">
                            <i class="fa fa-play fa-rotate-200"></i> {{ventas.eje_cafetero}}

                        </h2>
                        {% endif %} {% if ventas.eje_cafetero
                        < 9 %} <h2 class="text-danger">
                            <i class="fa fa-play fa-rotate-90"></i> {{ventas.eje_cafetero}}

                            </h2>
                            {% endif %}
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-content ">
                    <h5 class="m-b-md">Neiva</h5>
                    {% if ventas.neiva > 12 %}
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> {{ventas.neiva}}

                    </h2>
                    {% endif %} {% if ventas.neiva
                    < 13 AND ventas.neiva> 8 %}
                        <h2 class="text-warning">
                            <i class="fa fa-play fa-rotate-200"></i> {{ventas.neiva}}

                        </h2>
                        {% endif %} {% if ventas.neiva
                        < 9 %} <h2 class="text-danger">
                            <i class="fa fa-play fa-rotate-90"></i> {{ventas.neiva}}

                            </h2>
                            {% endif %}
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-content ">
                    <h5 class="m-b-md">Villavicencio</h5>
                    {% if ventas.villavicencio > 12 %}
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> {{ventas.villavicencio}}

                    </h2>
                    {% endif %} {% if ventas.villavicencio
                    < 13 AND ventas.villavicencio> 8 %}
                        <h2 class="text-warning">
                            <i class="fa fa-play fa-rotate-200"></i> {{ventas.villavicencio}}

                        </h2>
                        {% endif %} {% if ventas.villavicencio
                        < 9 %} <h2 class="text-danger">
                            <i class="fa fa-play fa-rotate-90"></i> {{ventas.villavicencio}}

                            </h2>
                            {% endif %}
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="ibox">
                <div class="ibox-content ">
                    <h5 class="m-b-md">Total</h5>
                    {% if ventas.total > 12 %}
                    <h2 class="text-navy">
                        <i class="fa fa-play fa-rotate-270"></i> {{ventas.total}}

                    </h2>
                    {% endif %} {% if ventas.total
                    < 13 AND ventas.total> 8 %}
                        <h2 class="text-warning">
                            <i class="fa fa-play fa-rotate-200"></i> {{ventas.total}}

                        </h2>
                        {% endif %} {% if ventas.total
                        < 9 %} <h2 class="text-danger">
                            <i class="fa fa-play fa-rotate-90"></i> {{ventas.total}}

                            </h2>
                            {% endif %}
                </div>
            </div>
        </div>
    </div>
    <br>
</div>


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>