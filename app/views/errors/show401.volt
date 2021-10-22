<style>
    .btn{
        background-color: #4F7F20!important;
        color: #f2f2f2!important;
        border-color: #80B250!important;
    }
    .btn:hover{
        background-color: #80B250!important;
	}
</style>
{{ content() }}

<div class="jumbotron">
    <h1>No autorizado</h1>
    <p>No tienes acceso a esta opción. Póngase en contacto con un administrador</p>
    <p>{{ link_to('index', 'Inicio', 'class': 'btn btn-primary') }}</p>
</div>