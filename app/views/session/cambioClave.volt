
{{ content() }}

<style>
    .login{
        background-color: white;
        margin-top: 8%;
        padding: 2%;
        border: 2px solid silver;
        border-radius: 10px;
    }
</style>
<body style="background-image: url({{url('img/fondo-login.jpg')}});background-size: cover;">
    <div class="container">
        <div class="col-md-12 text-center">
            <br>
                
        </div>
        <div class="col-md-4 col-md-offset-4 login">
            <div class="col-md-12 text-center">
                <img src="{{url('img/agencia.png')}}" class="" width="100" height="100" alt="">
                <br><br>
            </div>
            
            <h1 class="text-center">Porfavor digite su nueva contaseña</h1>

            {{ form('session/start', 'role': 'form') }}
                <div class="form-group">
                    <label for="email">Nombre de usuario</label>
                    <div class="controls">
                        <input type="text" name="usuario" id="users" required placeholder="Usuario" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">Contraseña</label>
                    <div class="controls">
                        <input type="password" name="password" id="password" required placeholder="Contraseña" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <button style="background-color: #4F7F20; color:white; font-size: 16px;" class=" btn btn-success form-control">Iniciar sesión</button>
                </div>
            </form>
        </div>

        <footer>
            
        </footer>
        
    </div>
</body>