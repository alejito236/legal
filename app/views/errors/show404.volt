<style>
    .btn{
        background-color: #4F7F20!important;
        color: #f2f2f2!important;
        border-color: #80B250!important;
    }
    .btn:hover{
        background-color: #80B250!important;
	}
    body{
        background-color: #4F7F20!important;
    }
</style>
{{ content() }}

<div class="jumbotron">
    <h1>Pagina no encontrada</h1>
    <p>Lo sentimos, has accedido a una página que no existe o fue movida</p>
    <p>{{ link_to('index', 'Inicio', 'class': 'btn btn-primary') }}</p>

</div>
