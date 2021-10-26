{{ content() }}

<style>


  body{
    background-image:  url("{{url('/public/img/portada-loginR.png')}}") !important;
    background-size: contain !important;

  }
   .login{
        background-color: rgba(29, 29, 28, 0.6);
        margin-top: 8%;
        padding: 2%;
       border-radius: 10px;
    }
    .btn-primary:hover{
		background-color: #467AB0!important;
        color: #fff!important;
	}
    .btn-primary{
        background-color: #32659a!important;
        color: #f2f2f2!important;
        border-color: #32659a!important;
        border-radius: 10px;
        margin: top 20px !important;;
    }
    input{
        border-radius: 10px !important;
        margin-bottom:25px !important;
        

    }
    .logo{
        margin-top:25px !important;
        margin-bottom:25px !important;

    }
</style>

<body>
    <div class="container">
        <div class="col-md-12 text-center">
            <br>                
        </div>
        <div class="col-md-4 col-md-offset-4 login">
            <div class="col-md-12 text-center">
                <img src="{{url('/public/img/Logo-login.png')}}" class="logo" height="100" alt="">
                <br><br>
            </div>
           
           

            {{ form('session/start', 'role': 'form') }}
                <div class="form-group">
                    
                    <div class="controls">
                        <input type="text" name="usuario" id="users" required placeholder="Usuario" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                   
                    <div class="controls">
                        <input type="password" name="password" id="password" required placeholder="Contraseña" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <button style="font-size: 16px;" class=" btn btn-primary form-control">Iniciar sesión</button>
                </div>
            </form>
        </div>

        <footer>
            
        </footer>        
    </div>
</body>