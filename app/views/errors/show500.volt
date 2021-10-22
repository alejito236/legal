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
    <h1>Error interno</h1>
    <p>Algo salió mal, si el error continúa por favor contáctenos</p>
    <p>{{ link_to('index', 'Inicio', 'class': 'btn btn-primary') }}</p>
</div>