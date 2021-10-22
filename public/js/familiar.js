$('.addFamiliar').click(function(){
    

    var familia = $('.composicionFamiliar').html();
    var hr = '<div class="col-md-12"><hr></div>';
    var button = '<div class="col-md-3 col-md-offset-9"><div class="col-md-12"><br><button type="button" class="btn btn-danger quitarFamiliar"><i class="fas fa-window-close"></i> Quitar</button></div></div>';

    $('.nuevoFamiliar').append('<div>'+hr+button+familia+'</div>');

});
        
$('body').on("click", '.quitarFamiliar',function(){
    $(this).parent().parent().parent().remove();
});


$('.addEstudio').click(function(){
    

    var estudio = $('.otroEstudio').html();
    var hr = '<div class="col-md-12"><hr></div>';
    var button = '<div class="col-md-3 col-md-offset-9"><div class="col-md-12"><br><button type="button" class="btn btn-danger quitarEstudio"><i class="fas fa-window-close"></i> Quitar</button></div></div>';

    $('.nuevoEstudio').append('<div>'+hr+button+estudio+'</div>');

});
        
$('body').on("click", '.quitarEstudio',function(){
    $(this).parent().parent().parent().remove();
});

$('.addExperiencia').click(function(){
    
    var estudio = $('.experienciaLaboral').html();
    var hr = '<div class="col-md-12"><hr></div>';
    var button = '<div class="col-md-3 col-md-offset-9"><div class="col-md-12"><br><button type="button" class="btn btn-danger quitarExperiencia"><i class="fas fa-window-close"></i> Quitar</button></div></div>';

    $('.nuevaExperiencia').append('<div>'+hr+button+estudio+'</div>');

});
        
$('body').on("click", '.quitarExperiencia',function(){
    $(this).parent().parent().parent().remove();
});

function mayus(e) {
    e.value = e.value.toUpperCase();
}