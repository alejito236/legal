<?php

/**
 * SessionController
 *
 * Allows to authenticate users
 */
class SessionController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Iniciar sesión');
        parent::initialize();
    }

    public function indexAction()
    {
        if (!$this->request->isPost()) {
            $this->tag->setDefault('email', 'demo');
            $this->tag->setDefault('password', 'phalcon');
        }
    }

    /**
     * Register an authenticated user into session data
     *
     * @param Users $user
     */
    private function _registerSession(Usuario $usuarios)
    {
        @$this->session->set('auth', [
            'id' => $user[0]['usuarioId'],
            'name' => $user[0]['login']
        ]);
    }
    private function _registeraspiranteSession(RRHHcandidatos $usuarios)
    {
        @$this->session->set('auth', [
            'id' => $user[0]['usuarioId'],
            'name' => $user[0]['login']
        ]);
    }

    /**
     * This action authenticate and logs an user into the application
     *
     */
    public function startAction()
    {
        if ($this->request->isPost()) {
            
            $user = array();
            $usuario = $this->request->getPost('usuario');
            $password = $this->request->getPost('password');
            $validaSesion = Usuario::findFirst([
                'conditions' => 'login = :usuario:',
                'bind'       => ['usuario' => $usuario]
            ]);

            if (empty($validaSesion)) {
                $this->flash->error('USUARIO NO EXISTE');
                return $this->dispatcher->forward([
                    "action"     => "index",
                ]);
            }

            //Valida que la contraseña ingresado concuerde con la contraseña encriptada en  la DB
            // if ($password != $validaSesion->password) {
            if (!password_verify($password, $validaSesion->password)) {
                $this->flash->error('CONTRASEÑA ERRADA');
                return $this->dispatcher->forward([
                    "action"     => "index",
                ]);
            }
            $usuarios = new Usuario();
            $usuariosSql = $usuarios->getUsuario($usuario);
            //$resultadoUsuario = $usuariosSql->fetch();                        
            foreach ($usuariosSql as $usuario2) {
                $user[] = [
                    "usuarioId"         => $usuario2['usuarioId'],
                    "cedula"            => $usuario2['cedula'],
                    "nombreUsuario"     => $usuario2['nombreUsuario'],
                    "apellidoUsuario"   => $usuario2['apellidoUsuario'],
                    "rolId"             => $usuario2['rolId'],
                    "nombreRol"         => $usuario2['nombreRol'],
                    "campanaId"         => $usuario2['campanaId'],
                    "nombreCampana"     => $usuario2['nombreCampana'],
                    "login"             => $usuario2['login'],
                    "cambioPassword"       => 0,
                    "empresa"           => 'LOGISTICA',
                ];
            }


            ///
            $i = 0;
            $campanas_roles = array();
            foreach ($user as $item) {
                $campanas_roles[]  = [
                    'campana' =>  $item['campanaId'],
                    'rol'   => $item['rolId'],
                ];
            }

            $userget = $validaSesion;

            #obtenemos la ip publica del usuario
            $getip = $_SERVER['REMOTE_ADDR'];

            $validaIpLogin = Login::findFirst([
                "conditions" => "usuarioId = :usuarioId:",
                "bind"       => ["usuarioId" => $userget->usuarioId]
            ]);

            if (!empty($validaIpLogin)) {
                if ($validaIpLogin->ip != '' || $validaIpLogin->ip != NULL) {
                    $ipdb = $validaIpLogin->ip;
                    #preguntamos si las ips son diferentes pasamos a validar
                    if (strcmp($ipdb, $getip) != 0) {
                        #obtenemos hora de la db
                        $horadb = $validaIpLogin->fechaIngreso;

                        #diferencia en horas y minutos
                        $now = new DateTime();


                        $date1 = new DateTime($horadb);
                        $date2 = new DateTime("now");
                        $diff = $date1->diff($date2);
                        $diffMinutos = $diff->i;
                        $diffHoras = $diff->h;

                        #Le restamos 59 ya que la diferencia nos la da diferente
                        #ej:faltan 55 min par acompletar la hora en realidad nesecitamos los 5 minutos que han pasado por eso le restamos 59 y multiplicamos por -1 para convertilo en positivo

                        #hacer prueba
                        if ($diffMinutos < 1 && $diffHoras < 1) {
                            $this->session->destroy();
                            $this->flash->error('Sesion En Uso');
                            return $this->dispatcher->forward(
                                [
                                    "controller" => "index",
                                    "action"     => "index",
                                ]
                            );
                        }
                    }
                }
            } else {
                $date = new \DateTime('America/Bogota');
                $fecha = $date->format("Y-m-d H:i:s");

                //Guarda la sesion en login
                $insertLogin = new Login();
                // echo "<pre>";
                // print_r($userget);die;
                //$insertLogin->loginId = $userget->login;
                $insertLogin->usuarioId = $userget->usuarioId;
                $insertLogin->fechaIngreso = $fecha;
                $insertLogin->ip = $getip;
                $insertLogin->token = '';
                $insertLogin->save();
                
            }

            if ($user != false) {

                $this->_registerSession($usuarios);
                $this->session->set('username', $user[0]['login']);
                $this->session->set('usuario', $user[0]['nombreUsuario'] . ' ' . $user[0]['apellidoUsuario']);
                $this->session->set('iduser', $user[0]['usuarioId']);
                $this->session->set('campanas_roles', $campanas_roles);
                if ($user[0]['cambioPassword'] == 1) {
                    return $this->dispatcher->forward(
                        [
                            "controller" => "CambioClave",
                            "action"     => "index",
                        ]
                    );
                } else {

                    //Backoffice 1
                    if ($user[0]['rolId'] == 1) {
                        return $this->dispatcher->forward(
                            [
                                "controller" => "backoffice",
                                "action"     => "index",
                            ]
                        );
                    }

                    //Asignacion  2                   
                    if ($user[0]['rolId'] == 2) {
                        return $this->dispatcher->forward(
                            [

                                "controller" => "asignacion",
                                "action"     => "index",
                            ]
                        );
                    }
                    //Expedidor    3                 
                    if ($user[0]['rolId'] == 3) {
                        return $this->dispatcher->forward(
                            [
                                "controller" => "expedidor",
                                "action"     => "generar",
                            ]
                        );
                    }

                    //MOTO 4
                    if ($user[0]['rolId'] == 4) {
                        return $this->dispatcher->forward(
                            [
                                // "controller" => $user[0]['empresa']."sac",
                                // "action"     => "index",
                            ]
                        );
                    }
                    //ADMIN 5
                    if ($user[0]['rolId'] == 5) {
                        return $this->dispatcher->forward(
                            [
                                "controller" => "administrador",
                                "action"     => "index",
                            ]
                        );
                    }
                }
            } else {
                //print_r("Entro 3");
                $usuarios = new RRHHcandidatos();
                $usuario = $this->request->getPost('usuario');
                $password = $this->request->getPost('password');
                $usuariosSql = $usuarios->getInicioCandidato($usuario, sha1($password));


                foreach ($usuariosSql as $usuario2) {
                    $user = [
                        "idCandidato"           => $usuario2['iidCandidato'],
                        "nombresCandidato"      => $usuario2['snombresCandidato'],
                        "apellidosCandidato"    => $usuario2['sapellidosCandidato'],
                        "cedula"                => $usuario2['idocCandidato'],
                        "ciudad"                => $usuario2['iciudadCandidato']
                    ];
                }

                if ($user != false) {
                    //print_r("Entro 4");

                    $this->_registeraspiranteSession($usuarios);
                    $this->session->set('candidato', $user[0]['nombresCandidato'] . ' ' . $user[0]['apellidosCandidato']);
                    $this->session->set('idCandidato', $user[0]['idCandidato']);
                    $this->session->set('cedula', $user[0]['cedula']);
                    $this->session->set('ciudad', $user[0]['ciudad']);

                    return $this->dispatcher->forward(
                        [
                            "controller" => "aspirante",
                            "action"     => "index"
                        ]
                    );
                }
                //print_r("Entro 5");

            }


            $this->flash->error('Correo o contraseña erradas');
        }

        return $this->dispatcher->forward(
            [
                "controller" => "index",
                "action"     => "index",
            ]
        );
    }

    public function cambioClave()
    {
        print_r("dfsdfsdf");
    }

    /**
     * Finishes the active session redirecting to the index
     *
     * @return unknown
     */
    public function endAction()
    {

        $idUser = $this->session->get('iduser');
        $getLogin = Login::findFirst([
            "conditions"	=> "usuarioId = :usuarioId:",
            "bind"			=> ["usuarioId" => $idUser]
        ]);
        $getLogin->delete();
        
        $this->session->remove('auth');
        $this->session->set('iduser', "");
        $this->session->set('existeArrayCiudades', ''); 
        $this->session->set('existeProducto', -1);   
        $this->session->set('contador','');      
        $this->session->set('filtroFecha', '');      
        $this->session->set('filtroFechaFin', '');            
        $this->session->set('filtroFechaIni', '');              
        return $this->dispatcher->forward(
            [
                "controller" => "index",
                "action"     => "index",
            ]
        );
    }
}
