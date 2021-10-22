<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>

<body>
    <div id="wrapper">
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav metismenu" id="side-menu">
                    <li class="nav-header">
                        <div class="dropdown profile-element">
                            <img alt="image" class="rounded-circle" src="https://uybor.uz/borless/uybor/img/user-images/user_no_photo_300x300.png" width="30" height="30" />
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="block m-t-xs font-bold">Cambio Clave</span>
                            </a>
                            <ul class="dropdown-menu animated fadeInRight m-t-xs">
                                <li><a class="dropdown-item" href="#">Salir</a></li>
                            </ul>
                        </div>
                        <div class="logo-element">
                            Novus
                        </div>
                        
                     
                    </li>
                    
                </ul>
            </div>
        </nav>

        <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
        <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i> </a>
        </div>
            <ul class="nav navbar-top-links navbar-right">
                <li style="padding: 20px">
                    <h3 class="">Candidato Novus.</h3>
                </li>
                <li>
                    <a href="{{url('session/end')}}">
                        <i class="fas fa-sign-out-alt"></i> Salir
                    </a>
                </li>
                
            </ul>
            

        </nav>
        {{content()}}
    </div>
    

    </div>

</body>
</html>