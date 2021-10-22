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
<div class="col-md-12">
    <h1>Expedicion <i class="far fa-id-card"></i></h1>
    <hr>
</div>
<br><br><br><br><br>
<div class="col-lg-12">
    <form action="{{url('expedidor/generar')}}" method="POST">
        <div class="col-lg-3">
            <label for="">Fecha inicio:</label>
            <input type="date" id="fechaInicio" name="fechaInicio" value="{{fechaInicial}}" class="form-control">
        </div>
        <div class="col-lg-3">
            <label for="">Fecha final:</label>  
            <input type="date" id="fechaFinal" name="fechaFinal" value="{{fechaFinal}}" class="form-control">
        </div>
         <div class="col-lg-2">
            <label for=""> <br></label>
            <button class="btn btn-primary form-control" id="btnFiltrar" name="btnFiltrar" >Generar</button>
        </div>
    </form>
</div>
<br><br><br><br><br>



<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
<script>   
   $("#estado").change(function() {
            console.log($("#estado").val());
            if ($("#estado").val() != 1) {
                $('#criterio').prop('disabled', false);
                $('#Estado2').prop('disabled', true);
                
                $('#criterio').val('');
                $('#Estado2').val('');
                
            } else {
                $('#Estado2').prop('disabled', false);
                $('#criterio').prop('disabled', true);
                $('#Estado2').val('');
                $('#criterio').val('');
    
    
            }
        });
$("#fechaInicio").attr('min', '<?php echo date("Y-m-d",strtotime(date("Y-m-d")."- 2 days"));?>');
    $("#fechaFinal").attr('min', '<?php echo date("Y-m-d",strtotime(date("Y-m-d")."+ 1 days"));?>');

</script>
