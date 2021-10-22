<?php

use Phalcon\Flash;
use Phalcon\Session;

class administradorController extends ControllerBase
{
    public function initialize(){
        $this->tag->setTitle('ADMINISTRADOR');
        parent::initialize();
        $this->view->username = $this->session->get("username");
        $this->view->usuario = $this->session->get("usuario");
        $this->view->iduser = $this->session->get("iduser");
        $this->view->setTemplateAfter('LOGISTICAadminlayout');
        $this->date = new \DateTime('America/Bogota');
        $this->view->campanas_roles = $this->session->get("campanas_roles");
        //Retorna la clave del array, es un dato númerico si lo encuentra
        //Aadministrador es rol 5
        $validaRol = array_search(5, array_column($this->view->campanas_roles, 'rol'));
        // Si valida que rol no es númerico, (el usuario no tiene un rol valido)
        // retorna a vista de error
        if (!is_numeric($validaRol)) {
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
        $id = $this->session->get('iduser');
        $fecha = $this->date->format("Y-m-d H:i:s");
        $usuarios = new Usuario();
        $usuarios = Usuario::findFirst([
            "usuarioId = :id:",
            'bind' => ['id' => $id]
        ]);
    }

    /**
     * Acccion para iniciar gestios de asesor SOAT
     */

    public function indexAction(){
        $post = $this->request->getPost();
        $id = $this->session->get('iduser');
        $fechaInicio = $this->date->format("Y-m-d");
        $fechaFin = $this->date->format("Y-m-d");
        /** Por el momento se retorna a la creacion de usuarios */
        return $this->dispatcher->forward(
            [
                "controller" => "administrador",
                "action"     => "usuarios",
            ]
        );
    }

    /**
     * Acccion para traer todos los usuarios
     */

    public function usuariosAction(){
        $post = $this->request->getPost();
        $usuarioRol = new Usuario();
        if (isset($post['btnBuscar'])) {
            $usuarioBuscar = $post['buscarUsuario'];
        } else {
            $usuarioBuscar = null;
        }
        $getUsuarioRol = $usuarioRol->getUsuarioRol($usuarioBuscar);
        $datoUsuarioRol = array();
        foreach ($getUsuarioRol as $resultado) {
            $datoUsuarioRol[] = [
                'usuarioId'     => $resultado['usuarioId'],
                'cedula'        => $resultado['cedula'],
                'nombreAsesor'  => $resultado['nombreAsesor'],
                'apellidoAsesor' => $resultado['apellidoAsesor'],
                'login'         => $resultado['login'],
                'estado'        => $resultado['estado'],
                'rolId'         => $resultado['rolId'],
                'nombreRol'     => $resultado['nombreRol'],
                'campanaId'     => $resultado['campanaId'],
                'nombreCampana' => $resultado['nombreCampana'],
            ];
        }

        $datoUsuarioRol = json_encode($datoUsuarioRol);
        $this->view->usuarios = json_decode($datoUsuarioRol);

        $roles = Rol::find([
            'conditions'  => 'estado = :estado:',
            'bind'        => [
                'estado'      => 1,
            ]
        ]);
        $roles = json_encode($roles);
        $this->view->roles = json_decode($roles);

        $campanas = Campana::find([
            'conditions'  => 'estado = :estado:',
            'bind'        => ['estado'      => 1,]
        ]);
        $campanas = json_encode($campanas);
        $this->view->campanas = json_decode($campanas);

        if (isset($post['edit'])) {
            $this->view->dato = $post;
        }
    }

    //Edita un usuario
    public function editUsuarioAction(){
        //echo "Entro";die;
        $post = $this->request->getPost();
        $usuarioModifica = $this->session->get("iduser");
        $id = $post['id'];
        $nombres = $post['nombres'];
        $apellidos = $post['apellidos'];
        $nameusuario = $post['usuario'];
        $rol = $post['rol'];
        $estado = $post['estado'];
        $contrasena = $post['password'];
        $cedula = $post['cedula'];
        $campana = $post['campana'];
        $dateHoy = $this->date->format("Y-m-d H:i:s");
        function get_client_ip()
        {
            $ipaddress = '';
            if (getenv('HTTP_CLIENT_IP'))
                $ipaddress = getenv('HTTP_CLIENT_IP');
            else if (getenv('HTTP_X_FORWARDED_FOR'))
                $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
            else if (getenv('HTTP_X_FORWARDED'))
                $ipaddress = getenv('HTTP_X_FORWARDED');
            else if (getenv('HTTP_FORWARDED_FOR'))
                $ipaddress = getenv('HTTP_FORWARDED_FOR');
            else if (getenv('HTTP_FORWARDED'))
                $ipaddress = getenv('HTTP_FORWARDED');
            else if (getenv('REMOTE_ADDR'))
                $ipaddress = getenv('REMOTE_ADDR');
            else
                $ipaddress = 'UNKNOWN';
            return $ipaddress;
        }
        $ip = get_client_ip();

        $usuario = Usuario::findFirst([
            'conditions' => "usuarioId = :id:",
            'bind'       => ['id' => $id]
        ]);

        $usuario->cedula = $cedula;
        $usuario->nombre = $nombres;
        $usuario->apellido = $apellidos;
        $usuario->login = $nameusuario;
        // if($rol == 4){
        //     $usuario->password = '$2a$10$CcX0hcKlKzukB/rIhsoMxesGo1kHSASooo95OmI8te3ENhIlRvR5G';                
        // }else{
        //     $usuario->password = password_hash($contrasena, PASSWORD_DEFAULT);
        // }
        $usuario->password = password_hash($contrasena, PASSWORD_DEFAULT);
        $usuario->estado = $estado;
        $usuario->rolId = $rol;
        $usuario->cambioPassword = 1;
        $usuario->campanaId = $campana;

        if ($usuario->save() == false) {
            $error = $this->view->error = "Erro al actualizar";
            return $this->dispatcher->forward([
                "action"     => "usuarios",
                "params"     => [$error]
            ]);
        } else {

            $insertHistoricoUsuario = new HistoricoUsuario();
            $insertHistoricoUsuario->usuarioId = $usuario->usuarioId;
            $insertHistoricoUsuario->cedula = $usuario->cedula;
            $insertHistoricoUsuario->nombre = $usuario->nombre;
            $insertHistoricoUsuario->apellido = $usuario->apellido;
            $insertHistoricoUsuario->login = $usuario->login;
            $insertHistoricoUsuario->estado = $usuario->estado;
            $insertHistoricoUsuario->rolId = $usuario->rolId;
            $insertHistoricoUsuario->usuarioModifico = $usuarioModifica;
            $insertHistoricoUsuario->cambioPassword = 1;
            $insertHistoricoUsuario->campanaId = $usuario->campanaId;
            $insertHistoricoUsuario->ip = $ip;
            $insertHistoricoUsuario->fechaUpdate = $dateHoy;
            if ($insertHistoricoUsuario->save()) {

                $ok = $this->view->ok = "Registro actualizado";
                return $this->dispatcher->forward([
                    "action"     => "usuarios",
                    "params"     => [$ok]
                ]);
            } else {

                $error = $this->view->error = "Erro al insertar el historico";
                return $this->dispatcher->forward([
                    "action"     => "usuarios",
                    "params"     => [$error]
                ]);
            }
        }
    }

    // Nuevo usuario
    public function nuevoUsuarioAction(){
        $post = $this->request->getPost();
        $usuarioModifica = $this->session->get("iduser");
        $id = $post['id'];
        $nombres = $post['nombres'];
        $apellidos = $post['apellidos'];
        $nameusuario = $post['usuario'];
        $rol = $post['rol'];
        $estado = $post['estado'];
        $contrasena = $post['password'];
        $cedula = $post['cedula'];
        $campana = $post['campana'];
        $dateHoy = $this->date->format("Y-m-d H:i:s");
        function get_client_ip()
        {
            $ipaddress = '';
            if (getenv('HTTP_CLIENT_IP'))
                $ipaddress = getenv('HTTP_CLIENT_IP');
            else if (getenv('HTTP_X_FORWARDED_FOR'))
                $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
            else if (getenv('HTTP_X_FORWARDED'))
                $ipaddress = getenv('HTTP_X_FORWARDED');
            else if (getenv('HTTP_FORWARDED_FOR'))
                $ipaddress = getenv('HTTP_FORWARDED_FOR');
            else if (getenv('HTTP_FORWARDED'))
                $ipaddress = getenv('HTTP_FORWARDED');
            else if (getenv('REMOTE_ADDR'))
                $ipaddress = getenv('REMOTE_ADDR');
            else
                $ipaddress = 'UNKNOWN';
            return $ipaddress;
        }
        $ip = get_client_ip();

        $usuario = Usuario::findFirst([
            'conditions' => "cedula = :cedula:",
            'bind'       => ['cedula' => $cedula]
        ]);

        if (empty($usuario)) {
            $usuario = new Usuario();
            $usuario->cedula = $cedula;
            $usuario->nombre = $nombres;
            $usuario->apellido = $apellidos;
            $usuario->login = $nameusuario;
            // if($rol == 4){
            //     $usuario->password = '$2a$10$CcX0hcKlKzukB/rIhsoMxesGo1kHSASooo95OmI8te3ENhIlRvR5G';                
            // }else{
            //     $usuario->password = password_hash($contrasena, PASSWORD_DEFAULT);
            // }
            $usuario->password = password_hash($contrasena, PASSWORD_DEFAULT);
            $usuario->estado = $estado;
            $usuario->rolId = $rol;
            $usuario->cambioPassword = 1;
            $usuario->campanaId = $campana;
            // try {
            //     if ($usuario->save() == false) {
            //         $messages = $usuario->getMessages();
            //         foreach ($messages as $message) {
            //             echo $message . PHP_EOL;
            //         }
            //     }
            // } catch (Exception $e) {
            //     echo $e;
            // }
            // die;


            if ($usuario->save() == false) {
                $error = $this->view->error = "Erro al actualizar";
                return $this->dispatcher->forward([
                    "action"     => "usuarios",
                    "params"     => [$error]
                ]);
            } else {
                $usuario = Usuario::findFirst([
                    'conditions' => "cedula = :cedula:",
                    'bind'       => ['cedula' => $cedula]
                ]);

                $insertHistoricoUsuario = new HistoricoUsuario();
                $insertHistoricoUsuario->usuarioId = $usuario->usuarioId;
                $insertHistoricoUsuario->cedula = $usuario->cedula;
                $insertHistoricoUsuario->nombre = $usuario->nombre;
                $insertHistoricoUsuario->apellido = $usuario->apellido;
                $insertHistoricoUsuario->login = $usuario->login;
                $insertHistoricoUsuario->estado = $usuario->estado;
                $insertHistoricoUsuario->rolId = $usuario->rolId;
                $insertHistoricoUsuario->usuarioModifico = $usuarioModifica;
                $insertHistoricoUsuario->cambioPassword = 1;
                $insertHistoricoUsuario->campanaId = $usuario->campanaId;
                $insertHistoricoUsuario->ip = $ip;
                $insertHistoricoUsuario->fechaInsert = $dateHoy;
                // try{
                //     if($insertHistoricoUsuario->save()==false){
                //         $messages = $insertHistoricoUsuario->getMessages();
                //         foreach ($messages as $message) {
                //             echo $message . PHP_EOL;
                //         }
                //     } 
                // }catch(Exception $e){
                //     echo $e;
                // }die;
                if ($insertHistoricoUsuario->save()) {

                    $ok = $this->view->ok = "Nuevo usuario insertado";
                    return $this->dispatcher->forward([
                        "action"     => "usuarios",
                        "params"     => [$ok]
                    ]);
                } else {

                    $error = $this->view->error = "Error al insertar el historico";
                    return $this->dispatcher->forward([
                        "action"     => "usuarios",
                        "params"     => [$error]
                    ]);
                }
            }
        } else {
            $error = $this->view->error = "Ya existe un usuario con este número de cedula $cedula";
            return $this->dispatcher->forward([
                "action"     => "usuarios",
                "params"     => [$error]
            ]);
        }
    }

    public function liberarRegistroBackAction(){
        $post = $this->request->getPost();
        $TempGestionBack = new TempGestionbackoffice();
        //echo "Entro";die;
        $getEnGestion = $TempGestionBack->getEnGestion();
        $getEnGestion = $getEnGestion->fetchAll();
        if(!empty($getEnGestion)){
            $getEnGestion = json_encode($getEnGestion);
            $this->view->getEnGestion = json_decode($getEnGestion);
        }else{
            $this->view->notFound = 'No hay registros siendo gestionados en este momento';
        }

    }

    /**Libera el registro que se estaba gestionando*/
    public function limpiarGestionAction(){
        $post = $this->request->getPost();        
        $datos = $post['datos'];        
        foreach($datos as $dato){
            $gestionId = $dato['gestionId'];
            $deleteTempGEstion = TempGestionbackoffice::findFirst([
                'conditions'    => 'temp_gestionbackofficeId = :id:',
                'bind'          => ['id' => $gestionId]
            ]);
            
            if(!empty($deleteTempGEstion)){
                $deleteTempGEstion->delete();                
            }
        }
        print_r("Registros liberados");die;
        
    }
}
