<?php

use Phalcon\Flash;
use Phalcon\Session;

class GOPASSsacController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('SAC');
        parent::initialize();
        $this->view->username = $this->session->get("username");
        $this->view->usuario = $this->session->get("usuario");        
        $this->view->iduser = $this->session->get("iduser");
        $this->view->role = $this->session->get("role");
        $this->view->campana = $this->session->get("campana");
        $this->view->setTemplateAfter('LOGISTICAsaclayouts');
        $this->date = new \DateTime('America/Bogota');

        $id = $this->session->get('iduser');
        $fecha = $this->date->format("Y-m-d H:i:s");
        $usuarios = new Usuario();        
        $usuarios = Usuario::findFirst([
            "usuarioId = :id:",
            'bind' => ['id' => $id]
        ]);
        

        // $usuarios->ultimaSesion = $fecha;

        $usuarios->save();
    }

    /**
     * Acccion para iniciar gestios de asesor SOAT
     */

    public function indexAction()
    {   
        $post = $this->request->getPost();        
        if ($this->session->get("role") == 4){
            $id = $this->session->get('iduser');
            $fechaInicio = $this->date->format("Y-m-d");
            $fechaFin = $this->date->format("Y-m-d");            
            
            $reagendadas = new Gestiongopass();
            //Cambiar consulta de getReagendadas
            $reagendadas = $reagendadas->getReagendadas($fechaInicio, $fechaFin, $id);       
            

            foreach($reagendadas as $reagendada){
                $cantidad[] = [
                    'cantidad' => $reagendada['cantidad']
                ];
            }
            $cantidad = json_encode($cantidad);
            $this->view->cantidad = json_decode($cantidad);

            //Busca el historico de la campaña 1 gestion-agendamiento
            if(isset($post['placa']) and isset($post['btnBuscar'])){
                $placa = $post['placa'];
                $historicoGestionGopass = new Historico_gestiongopass();
                $historial = $historicoGestionGopass->getHistoricoGestion($placa);
                $datoHistorial = array();
                $count = 0;                
                foreach($historial as $resultado){
                    $datoHistorial[]=[
                        'placa'                 => $resultado['placa'], 
                        'cedulaPersona'         => $resultado['cedulaPersona'], 
                        'nombrePersona'         => $resultado['nombrePersona'],
                        'celularLlamadas'       => $resultado['celularLlamadas'], 
                        'celularWhatsapp'       => $resultado['celularWhatsapp'], 
                        'telefono'              => $resultado['telefono'], 
                        'direccionEntrega'      => $resultado['direccionEntrega'], 
                        'observacion'           => $resultado['observacion'], 
                        'numTags'               => $resultado['numTags'], 
                        'tipificacionId'        => $resultado['tipificacionId'], 
                        'nombreTipificacion'    => $resultado['nombreTipificacion'], 
                        'fechaEntrega'          => $resultado['fechaEntrega'],
                        'fechaGestion'          => $resultado['fechaGestion'],
                    ];
                    $count ++;
                }
                
                if($count > 0){
                    $datoHistorial = json_encode($datoHistorial);
                    $this->view->historial = json_decode($datoHistorial);
                    $placa = json_encode($placa);
                    $this->view->placa = json_decode($placa);
                }
                else{
                    $error = json_encode($post['placa']);
                    $this->view->error = json_decode($error);
                }
            }
            //Trae la información del usuario que se va gestionar           
            
            if(isset($post['placaGestionar']) && isset($post['btnGestionar'])){
                $placa = $post['placaGestionar'];                
                $convenios = Convenio::find([
                    'conditions' => 'estado = :estado:',
                    'bind'       => [
                        'estado' => 1,
                    ]
                ]);
    
                $convenios = json_encode($convenios);
                $this->view->convenios = json_decode($convenios);

                $ciudades = Ciudad::find([
                    'conditions' => 'estado = :estado:',
                    'bind'       => [
                        'estado' => 1,
                    ]
                ]);
    
                $ciudades = json_encode($ciudades);
                $this->view->ciudades = json_decode($ciudades);

                $barrios = Barrio::find([
                    'conditions' => 'estado = :estado:',
                    'bind'       => [
                        'estado' => 1,
                    ]
                ]);
    
                $barrios = json_encode($barrios);
                $this->view->barrios = json_decode($barrios);
    
                $localidades = Localidad::find([
                    'conditions' => 'estado = :estado:',
                    'bind'       => [
                        'estado' => 1,
                    ]
                ]);
    
                $localidades = json_encode($localidades);
                $this->view->localidades = json_decode($localidades);                
                $validaTipificacion = Gestiongopass::findFirst([
                    'conditions'    => 'placa = :placa:',
                    'bind'          => [
                        'placa'     => $placa,
                    ]
                ]);
                
                if(!empty($validaTipificacion)){
                    // if($validaTipificacion->tipificacionId != 200 && $validaTipificacion->tipificacionId != 215 && $validaTipificacion->tipificacionId != 218 && $validaTipificacion->tipificacionId != 219){
                    if($validaTipificacion->tipificacionId != 200 && $validaTipificacion->tipificacionId != 215){
                        $gestionGopass = new Gestiongopass();
                        $reagendamientoCampana = $gestionGopass->getReagendamientoCampana($placa,null,null);                        
                        $datoReagendamientoCampana = array();

                        foreach($reagendamientoCampana as $resultado){
                            $datoReagendamientoCampana =[
                            'gestionId'         => $resultado['gestionId'], 
                            'placa'             => $resultado['placa'], 
                            'cedulaPersona'     => $resultado['cedulaPersona'], 
                            'nombrePersona'     => $resultado['nombrePersona'],
                            'direccionCasa'     => $resultado['direccionCasa'], 
                            'fechaEntrega'      => $resultado['fechaEntrega'], 
                            'celularLlamadas'   => $resultado['celularLlamadas'], 
                            'celularWhatsapp'   => $resultado['celularWhatsapp'], 
                            'telefono'          => $resultado['telefono'], 
                            'convenioId'        => $resultado['convenioId'],
                            'nombreConvenio'    => $resultado['nombreConvenio'], 
                            'observacion'       => $resultado['observacion'], 
                            'numTags'           => $resultado['numTags'], 
                            'barrioId'          => $resultado['barrioId'], 
                            'nombreBarrio'      => $resultado['nombreBarrio'],  
                            'localidadId'       => $resultado['localidadId'], 
                            'nombreLocalidad'   => $resultado['nombreLocalidad'],
                            'ciudadId'          => $resultado['ciudadId'], 
                            'nombreCiudad'      => $resultado['nombreCiudad'],
                            'direccionEntrega'  => $resultado['direccionEntrega'],
                            'franjaHoraria'     => $resultado['franjaHoraria'],
                            ];
                        }

                        $datoReagendamientoCampana = json_encode($datoReagendamientoCampana);
                        $this->view->consulta = json_decode($datoReagendamientoCampana);
                        // print_r($this->view->consulta);die;
            
                        $fechaEntrega = new DateTime($datoReagendamientoCampana->fechaEntrega);
                        $fechaEntrega = $fechaEntrega->format("Y-m-d");
                        $fechaEntrega = json_encode($fechaEntrega);
                        $this->view->fechaEntrega = json_decode($fechaEntrega);
                    }else{
                        $errorTipificacion = "Esta placa $placa ya fue gestionada";
                        $this->view->errorTipificacion = $errorTipificacion;
                    }
                }

                
            }            
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    public function buscarLocalidadAction(){
        $post = $this->request->getPost();        
        if ($this->session->get("role") == 4){
            if(isset($post['ciudadResidencia']) && isset($post['traerLocalidad'])){
                $ciudad = $post['ciudadResidencia'];
                $localidades = Localidad::find([
                    'conditions' => 'ciudadId = :ciudad: and estado = :estado:',
                    'bind'       => [
                        'ciudad' => $ciudad,
                        'estado' => 1
                    ]
                ]);
                $localidades = json_encode($localidades);
                print_r($localidades);die;
            }
        }
    }

    public function buscarBarrioAction(){
        $post = $this->request->getPost();        
        if ($this->session->get("role") == 4){
            if(isset($post['localidadCliente']) && isset($post['traerBarrios'])){
                $localidad = $post['localidadCliente'];
                $barrios = Barrio::find([
                    'conditions' => 'localidadId = :localidad: and estado = :estado:',
                    'bind'       => [
                        'localidad' => $localidad,
                        'estado' => 1
                    ]
                ]);
                $barrios = json_encode($barrios);
                print_r($barrios);die;
            }
        }
    }

    

    /**
     * Accion para guardar datos del cliente
     */

    public function reagendarAction()
    {   
        $post = $this->request->getPost();
        if ($this->session->get("role") == 4) {
            function get_client_ip() {
                $ipaddress = '';
                if (getenv('HTTP_CLIENT_IP'))
                    $ipaddress = getenv('HTTP_CLIENT_IP');
                else if(getenv('HTTP_X_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
                else if(getenv('HTTP_X_FORWARDED'))
                    $ipaddress = getenv('HTTP_X_FORWARDED');
                else if(getenv('HTTP_FORWARDED_FOR'))
                    $ipaddress = getenv('HTTP_FORWARDED_FOR');
                else if(getenv('HTTP_FORWARDED'))
                $ipaddress = getenv('HTTP_FORWARDED');
                else if(getenv('REMOTE_ADDR'))
                    $ipaddress = getenv('REMOTE_ADDR');
                else
                    $ipaddress = 'UNKNOWN';
                return $ipaddress;
            }
            $fechaHoy = $this->date->format("Y-m-d H:i:s");            
            $userid = $this->session->get('iduser');
            $gestionId = $post['gestionId'];
            $documentoCliente = $post['documentoCliente'];
            $nombreCliente = $post['nombreCliente'];
            $direccionCliente = $post['direccionCliente'];
            $telefonoCliente = $post['telefonoCliente'];
            $celularCliente = $post['celularCliente'];
            $ciudadCliente = $post['ciudadCliente'];
            $localidadCliente = $post['localidadCliente'];
            $barrioCliente = $post['barrioCliente'];
            $franjaEntrega = $post['franjaEntrega'];
            $fechaEntrega = $post['fechaEntrega'];
            $direccionEntrega = $post['direccionEntrega'];
            $convenio = $post['convenio'];
            $placa = $post['placa'];
            $numeroTags = $post['numeroTags'];
            $observaciones = $post['observaciones'];
            $ip = get_client_ip();

            if(isset($post['gestionId'])){
                $gestionGopass = Gestiongopass::findfirst([
                    'conditions' => 'gestionId = :gestionId:',
                    'bind'       => [
                        'gestionId' => $gestionId,
                    ]
                ]);
                $gestionGopass->cedulaPersona = $documentoCliente;              
                $gestionGopass->direccionCasa = $direccionCliente;
                $gestionGopass->telefono = $telefonoCliente;
                $gestionGopass->celularLlamadas = $celularCliente;                              
                $gestionGopass->barrioId = $barrioCliente;              
                $gestionGopass->franjaHoraria = $franjaEntrega;
                $gestionGopass->fechaEntrega = $fechaEntrega;
                $gestionGopass->direccionEntrega = $direccionEntrega;
                $gestionGopass->convenioId = $convenio;
                $gestionGopass->observacion = $observaciones;
                $gestionGopass->placa = $placa;
                $gestionGopass->numTags = 1;
                $gestionGopass->tipificacionId = 215; //Preguntar que tipificacion debe ir
                $gestionGopass->usuarioId = $userid;
                $gestionGopass->fechaGestion = $fechaHoy;
                $gestionGopass->fechaReagendamiento = $fechaHoy;
                $gestionGopass->ip = $ip;                
                // try{
                //     $gestionGopass->save();
                // }catch(Exception $e){
                //     echo 'Error saving Invoice: ' . $e;
                //     $messages = $gestionGopass->getMessages();
                //     foreach ($messages as $message) {
                //         echo $message . PHP_EOL;
                //     }
                //     die;
                // }
                // die;
                
                if($gestionGopass->save()){
                    $exito = json_encode($post['placa']);
                    $exito = $this->view->exito = $exito;
                    return $this->dispatcher->forward(
                    [
                        "params"    => [$exito],
                        "action"     => "index",
                    ]);
                }else{
                        $error2 = json_encode($post['placa']);
                        $this->view->error2 = json_decode($error2);
                        return $this->dispatcher->forward(
                        [
                            "params"    => [$exito],
                            "action"     => "index",
                        ]);
                    }
            }
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401"
                ]
            );
        }
    }

    /**
     * Accion para guardar el historico del SAC
     */

    public function historicoAction()
    {   
        if ($this->session->get("role") == 4) {

            $id = $this->session->get('iduser');

            // consulta para traer la cantidad gestionada del asesor
            $soatAsesor = new Soatgestion();
            $soatSqlAsesor = $soatAsesor->getCantidadSAC($id);
            $total = 0;
            $ventas= 0;
            $renovaciones= 0;
            foreach ($soatSqlAsesor as $cantidad) {

                if($cantidad['tipificacionHS'] == 78){
                    $ventas++;
                }
                else if($cantidad['tipificacionHS'] == 50){
                    $renovaciones++;
                }
            }
            
            $cantidad1 = [
                "ventas"        => $ventas,
                "renovaciones"  => $renovaciones,
                "total"         => $ventas+$renovaciones
            ];

            $cantidad1 = json_encode($cantidad1);
            // print_r($cantidad);die;
            $this->view->cantidad = json_decode($cantidad1);

            $ciudad = new Masterciudad();
            $ciudadSql = $ciudad->getCiudadEspecificasSoat();

            foreach ($ciudadSql as $ciudad) {
                $ciudades[] = [
                    "id"          => $ciudad['iidciudad'],
                    "ciudad"      => $ciudad['snombreCiudad'],
                ];
            }

            $ciudades = json_encode($ciudades);
            $this->view->ciudades = json_decode($ciudades);

            $post = $this->request->getPost();

            if(isset($post['placa'])){

                $placa = $post['placa'];

                $soat = new Ventastag();

                $soat = $soat->getHistorico($placa);

                 print_r($soat->fetch());die;

                $num = 1;
                
                foreach($soat as $list){
                    $data[] = [
                        "num"                     => $num,
                        "id"                      => $list['id_venta'],
                        "cliente"                 => $list['nombre_clie'].' '.$list['apellido_clie'],
                        "nombre_clie"             => $list['nombre_clie'],
                        "apellido_clie"           => $list['apellido_clie'],
                        "documento_clie"          => $list['documento_clie'],
                        "celular_clie"            => $list['celular_clie'], 
                        "correo_clie"             => $list['correo_clie'],
                        "fecha_gestion"           => $list['fecha_gestion'],
                        "user_gestion"            => $list['snombresUser'].' '.$list['sapellidosUser'],
                        "establecimiento"         => $list['nombre'],
                        "placa"                   => $list['placa'],
                        "tag"                     => $list['tag'],
                        "direccionEntrega"        => $list['direccionEntrega'],
                        "indicacionesEntrega"     => $list['indicacionesEntrega'],
                        "fechaEntrega"            => $list['fechaEntrega']
                    ];

                    $num++;
                    
                }
          
                
                if(isset($data)){
                    
                }
                else{

                    $soat2 = new Ventastag();

                    $soat2 = $soat2->getHistorico2($placa);

                    $num = 1;

                    foreach($soat2 as $list){
                        $data[] = [
                            "num"                     => $num,
                            "id"                      => $list['id_venta'],
                            "cliente"                 => $list['nombre_clie'].' '.$list['apellido_clie'],
                            "nombre_clie"             => $list['nombre_clie'],
                            "apellido_clie"           => $list['apellido_clie'],
                            "documento_clie"          => $list['documento_clie'],
                            "celular_clie"            => $list['celular_clie'], 
                            "correo_clie"             => $list['correo_clie'],
                            "fecha_gestion"           => $list['fecha_gestion'],
                            "user_gestion"            => $list['snombresUser'].' '.$list['sapellidosUser'],
                            "establecimiento"         => $list['nombre'],
                            "placa"                   => $list['placa'],
                            "tag"                     => $list['tag'],
                            "direccionEntrega"        => $list['direccionEntrega'],
                            "indicacionesEntrega"     => $list['indicacionesEntrega'],
                            "fechaEntrega"            => $list['fechaEntrega']
        
                        ];

                        $num++;
                    }

                }

                
                if(isset($data)){
                    
                    $data = json_encode($data);
                    $this->view->data = json_decode($data);   
                    // print_r($data);die;
                }else{    
  
                    $this->view->notFoundDB = $placa;
                                 
                    return $this->dispatcher->forward(
                        [
                            "action"     => "index",
                        ]
                    );    
                }
            }else if(isset($post['id'])){

                $id = $post['id'];

                $soat = new Ventastag();

                $soat = $soat->getHistoricoID($id);

                $conSoat = $soat->fetch();

                if(isset($conSoat['id_venta'])){
                    foreach($soat as $list){
                        $data[] = [
                            "id"                      => $list['id_venta'],
                            "cliente"                 => $list['nombre_clie'].' '.$list['apellido_clie'],
                            "nombre_clie"             => $list['nombre_clie'],
                            "apellido_clie"           => $list['apellido_clie'],
                            "documento_clie"          => $list['documento_clie'],
                            "celular_clie"            => $list['celular_clie'], 
                            "correo_clie"             => $list['correo_clie'],
                            "fecha_gestion"           => $list['fecha_gestion'],
                            "user_gestion"            => $list['snombresUser'].' '.$list['sapellidosUser'],
                            "establecimiento"         => $list['nombre'],
                            "placa"                   => $list['placa'],
                            "tag"                     => $list['tag'],
                            "direccionEntrega"        => $list['direccionEntrega'],
                            "indicacionesEntrega"     => $list['indicacionesEntrega'],
                            "fechaEntrega"            => $list['fechaEntrega']
        
                        ];
    
                    }
                }

                else{
                    $soat2 = new Ventastag();

                    $soat2 = $soat2->getHistoricoID2($id);

                    foreach($soat2 as $list){
                        $data[] = [
                        "id"                      => $list['id_venta'],
                        "cliente"                 => $list['nombre_clie'].' '.$list['apellido_clie'],
                        "nombre_clie"             => $list['nombre_clie'],
                        "apellido_clie"           => $list['apellido_clie'],
                        "documento_clie"          => $list['documento_clie'],
                        "celular_clie"            => $list['celular_clie'], 
                        "correo_clie"             => $list['correo_clie'],
                        "fecha_gestion"           => $list['fecha_gestion'],
                        "user_gestion"            => $list['snombresUser'].' '.$list['sapellidosUser'],
                        "establecimiento"         => $list['nombre'],
                        "placa"                   => $list['placa'],
                        "tag"                     => $list['tag'],
                        "direccionEntrega"        => $list['direccionEntrega'],
                        "indicacionesEntrega"     => $list['indicacionesEntrega'],
                        "fechaEntrega"            => $list['fechaEntrega']
                        
                        ];
                    }
                }

                if(empty($data)){

                    $data = 0;
                    print_r($data);die;
                    
                    
                }else{
                    $data = json_encode($data);
                    print_r($data);die;
                }

            }
       

        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }  
    }

    public function postventaAction(){        
        $post = $this->request->getPost();
        if ($this->session->get("role") == 4){
            if(isset($post['buscar'])){
                //
                //Funciones para SAC
                /*Recibe la placa y retorna los datos de la campaña postventa
                Obtiene las datos de la campaña de postventa con tipificacion 216(no contacto)
                *Pendiente confirmar tipificaciones
                */
                $gestionGopass = Gestiongopass::findFirst([
                    "gestionId = :gestionId:",
                    'bind' => ['gestionId' => $gestionId]
                ]);

                function buscarPostventa($placa){                    
                    $postVenta = new Gestiongopass();
                    $postVentaSql = $postVenta->getPostventa($placa);                    
                    $datos = array();
                    foreach($postVentaSql as $resultado){
                        $datos[] = [
                            'gestionId'             => $resultado['gestionId'],
                            'placa'	                => $resultado['placa'],
                            'tipificacionId'	    => $resultado['tipificacionId'],
                            'tipoBonoId'	        => $resultado['tipoBonoId'],
                            'campanaId'	            => $resultado['campanaId'],
                            'tagAsociado'	        => $resultado['tagAsociado'],
                            'fechaActivacion'	    => $resultado['fechaActivacion'],
                            'redimeBono'	        => $resultado['redimeBono'],
                            'fechaRedimeBono'	    => $resultado['fechaRedimeBono'],
                            'usuarioId'	            => $resultado['usuarioId'],
                            'nombreUser'	        => $resultado['nombreUser'],
                            'apellidoUser'	        => $resultado['apellidoUser'],
                            'cedulaPersona'	        => $resultado['cedulaPersona'],
                            'nombrePersona'	        => $resultado['nombrePersona'],
                            'apellidoPersona'	    => $resultado['apellidoPersona'],
                            'telefono'	            => $resultado['telefono'],
                            'celularLlamadas'	    => $resultado['celularLlamadas'],
                            'tipoId'	            => $resultado['tipoIdentificacion'],
                            'celularWhatsapp'	    => $resultado['celularWhatsapp'],
                            'puntoActivacionId'	    => $resultado['puntoActivacionId'],
                            'nombrePuntoActivacion' => $resultado['nombrePuntoActivacion'],
                            'tipoBonoId'	        => $resultado['tipoBonoId'],
                            'nombreBono'        	=> $resultado['nombreBono'],
                            'tipoMembresiaId'       => $resultado['tipoMembresiaId'],
                            'nombreMembresia'       => $resultado['nombreMembresia'],

                        ];
                    }
                    return $datos;
                }
                //Retorna los tipos de bonos con estado 1     
                function getTipoBonos(){
                    $datos = array();
                    $bonos = new TipoBono();
                    $bonosSql = $bonos->getTipoBono();
                    foreach($bonosSql as $resultado){
                        $datos [] = [
                            'tipoBonoId'    => $resultado['tipoBonoId'], 
                            'nombre'        => $resultado['nombre'], 
                            'estado'        => $resultado['estado']
                        ];
                    }
                    return $datos;

                }
                //Retorna los tipos de membresias con estado 1     
                function getTipoMembresias(){
                    $datos = array();
                    $membresias = new Tipomembresia();
                    $membresiasSql = $membresias->getTipoMembresia();
                    foreach($membresiasSql as $resultado){
                        $datos[] =[
                            'tipoMembresiaId'   => $resultado['tipoMembresiaId'], 
                            'nombre'            => $resultado['nombre'], 
                            'estado'            => $resultado['estado'], 
                        ];
                    }
                    return $datos;
                }
                //Retorna las tipificaciones con estado 1     
                function getTipifiaciones(){
                    $datos = array();
                    $tipificaciones = new Tipificacion();
                    $tipificacionesSql = $tipificaciones->getTipificacion();
                    foreach($tipificacionesSql as $resultado){
                        $datos[]=[
                            'tipificacionId'    => $resultado['tipificacionId'], 
                            'nombre'            => $resultado['nombre'], 
                            'fechaCreacion'     => $resultado['fechaCreacion'], 
                            'estado'            => $resultado['estado'],
                        ];
                    }
                    return $datos;

                }
                //Fin Funciones para POSTVENTA ROL SAC
                $placa = $post['placa'];                
                $resultadoPostventa = buscarPostventa($placa);
                
                if(empty($resultadoPostventa)==1){
                    $yaGestionada = $placa;
                    $this->view->yaGestionada = $yaGestionada;
                }else{
                    $bonos = getTipoBonos();
                    $membresias = getTipoMembresias();
                    $tipificaciones = getTipifiaciones();                
                    $resultadoPostventa = json_encode($resultadoPostventa);    
                    $this->view->resultadoPostventa = json_decode($resultadoPostventa);                    
                    $bonos = json_encode($bonos);
                    $this->view->bonos = json_decode($bonos);
                    $membresias = json_encode($membresias);
                    $this->view->membresias = json_decode($membresias);                
                    $tipificaciones = json_encode($tipificaciones);
                    $this->view->tipificaciones = json_decode($tipificaciones);                    
                }                
                
            }
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    public function guardarPostventaAction(){
        $post = $this->request->getPost();        
        function get_client_ip() {
            $ipaddress = '';
            if (getenv('HTTP_CLIENT_IP'))
                $ipaddress = getenv('HTTP_CLIENT_IP');
            else if(getenv('HTTP_X_FORWARDED_FOR'))
                $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
            else if(getenv('HTTP_X_FORWARDED'))
                $ipaddress = getenv('HTTP_X_FORWARDED');
            else if(getenv('HTTP_FORWARDED_FOR'))
                $ipaddress = getenv('HTTP_FORWARDED_FOR');
            else if(getenv('HTTP_FORWARDED'))
            $ipaddress = getenv('HTTP_FORWARDED');
            else if(getenv('REMOTE_ADDR'))
                $ipaddress = getenv('REMOTE_ADDR');
            else
                $ipaddress = 'UNKNOWN';
            return $ipaddress;
        }        
        //print_r($post);die;
        if ($this->session->get("role") == 4){
            if(isset($post['btnEnviar'])){
                $ip = get_client_ip();
                $usuario = $this->session->get("iduser");
                $gestionId = $post['gestionId']; 
                $placa = $post['placaForm'];
                $tagAsociado = $post['tagAsociado'];
                $documento = $post['documento']; 
                $celular = $post['celular'];
                $activador = $post['activador'];
                $puntoActivacion = $post['puntoActivacion'];
                $fechaActivacion = $post['fechaActivacion'];
                $logroContacto = $post['logroContacto'];
                $noContacto = $post['noContacto'];
                $tipoMembresia = $post['tipoMembresia'];
                $tipoBono = $post['tipoBono'];
                $redimeBono = $post['redimeBono'];
                $fechaRedimeBono = $post['fechaRedimeBono'];
                $infoBono = $post['infoBono'];
                $conoceMembresias = $post['conoceMembresias'];
                $adquiereMembresia = $post['adquiereMembresia'];
                $observacion = $post['observacion'];
                $tipificacionId = $post['tipificacion'];
                $expGopass = $post['expGopass'];
                $calificacionPresentacionPersonal = $post['calificacionPresentacionPersonal'];
                $calificacionInfoClara = $post['calificacionInfoClara'];
                $calificacionAcompanamiento = $post['calificacionAcompanamiento'];
                $calificacionTiempoEspera = $post['calificacionTiempoEspera'];
                $calificacionComportamiento = $post['calificacionComportamiento'];
                $calificacionAmabilidad = $post['calificacionAmabilidad'];
                $fechaGestion = $this->date->format("Y-m-d H:i:s");
                $gestionGopass = Gestiongopass::findFirst([
                    "gestionId = :gestionId:",
                    'bind' => ['gestionId' => $gestionId]
                ]);
                $campana = $gestionGopass->campanaId;
                $fechaVolverLlamar = $gestionGopass->fechaVolverLlamar;
                if($logroContacto == 0){
                    $tipoMembresia = $gestionGopass->tipoMembresiaId;
                    $tipoBono = $gestionGopass->tipoBonoId;
                }
                if(!is_numeric($tipoBono)){
                    $tipoBono = $gestionGopass->tipoBonoId;
                }
                if(!is_numeric($tipoMembresia)){
                    $tipoMembresia = $gestionGopass->tipoMembresiaId;
                }
                
                if(($adquiereMembresia == 0) && ($tipificacionId == 217)){
                    $campana = 3;
                    $dia = date('d');
                    $mes = date('m')+1;
                    $ano = date('Y');
                    if($mes > 12){
                        $mes = 1;
                        $ano ++;                        
                    }
                    $fechaVolverLlamar = date_create(($ano . "-" . $mes . "-" . $dia));                    
                    $fechaVolverLlamar = json_encode($fechaVolverLlamar);
                    $fechaVolverLlamar = json_decode($fechaVolverLlamar);                    
                }elseif(($adquiereMembresia == 0) && ($tipificacionId == 219)){
                    $campana = 2;
                    $fechaVolverLlamar = null;
                }
                //print_r($fechaVolverLlamar->date);die;
                $gestionGopass->fechaGestion = $fechaGestion;
                $gestionGopass->fechaVolverLlamar = $fechaVolverLlamar->date;
                $gestionGopass->ip = $ip;
                $gestionGopass->usuarioId = $usuario;
                $gestionGopass->campanaId = $campana;                
                $gestionGopass->placa = $placa;
                $gestionGopass->celularLlamadas = $celular;
                $gestionGopass->fechaActivacion = $fechaActivacion;
                $gestionGopass->existeContacto = $logroContacto;
                $gestionGopass->motivoNoContacto = $noContacto;                
                $gestionGopass->tipoMembresiaId = $tipoMembresia;
                $gestionGopass->tipoBonoId = $tipoBono;
                $gestionGopass->redimeBono = $redimeBono;
                $gestionGopass->fechaRedimeBono = $fechaRedimeBono;
                $gestionGopass->infoBono = $infoBono;
                $gestionGopass->conoceMembresias = $conoceMembresias;
                $gestionGopass->adquiereMembresia = $adquiereMembresia;
                $gestionGopass->observacion = $observacion;
                $gestionGopass->tipificacionId = $tipificacionId;
                $gestionGopass->calificacionPresentacionPersonal = $calificacionPresentacionPersonal;
                $gestionGopass->calificacionInfoClara = $calificacionInfoClara;
                $gestionGopass->calificacionAcompanamiento = $calificacionAcompanamiento;
                $gestionGopass->calificacionTiempoEspera = $calificacionTiempoEspera;
                $gestionGopass->calificacionComportamiento = $calificacionComportamiento;
                $gestionGopass->calificacionAmabilidad = $calificacionAmabilidad;
                $gestionGopass->tagAsociado = $tagAsociado;
                
                // try{
                //     $gestionGopass->save();
                // }catch(Exception $e){
                //     echo 'Error saving Invoice: ';
                //     $messages = $gestionGopass->getMessages();
                //     foreach ($messages as $message) {
                //         echo $message . PHP_EOL;
                //     }
                //     die;
                // }
                // die;
                if ($gestionGopass->save() === false) {
                        // echo 'Error saving Invoice: ';
                        // $messages = $gestionGopass->getMessages();
                        // foreach ($messages as $message) {
                        //     echo $message . PHP_EOL;
                        // }
                        // die;
                        $error = json_encode($placa);
                        $error = $this->view->error = $error;
                        return $this->dispatcher->forward(
                        [
                            "params"    => [$error],
                            "action"     => "index",
                        ]);
                    }else{
                        $exito = json_encode($placa);
                        $exito = $this->view->exito = $exito;
                        return $this->dispatcher->forward(
                        [
                            "params"    => [$exito],
                            "action"     => "index",
                        ]);
                    }
            }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]);
            }
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }


    public function fidelizacionAction(){     
        $post = $this->request->getPost(); 
        if ($this->session->get("role") == 4){
            if(isset($post['buscar'])){
                $placa = $post['placa'];
                $validar = Gestiongopass::findFirst([
                    'conditions' => 'placa = :placa: and campanaId = :campana:',
                    'bind'       => [
                        'placa' => $placa,
                        'campana' => 3
                    ]
                ]);
                $fechaHoy = $this->date->format("Y-m-d H:i:s");
                if(!empty($validar)){

                    $fecha = $validar->fechaVolverLlamar;
                    $idGestion = $validar->gestionId;
                    if($fecha <= $fechaHoy){
                        function buscarFidelizacion($placa){                    
                            $postVenta = new Gestiongopass();
                            $postVentaSql = $postVenta->getFidelizacion($placa);                    
                            $datos = array();
                            foreach($postVentaSql as $resultado){
                                $datos[] = [
                                    'gestionId'                        => $resultado['gestionId'],
                                    'placa'	                           => $resultado['placa'],
                                    'tipificacionId'	               => $resultado['tipificacionId'],
                                    'tipoBonoId'	                   => $resultado['tipoBonoId'],
                                    'campanaId'	                       => $resultado['campanaId'],
                                    'tagAsociado'	                   => $resultado['tagAsociado'],
                                    'fechaActivacion'	               => $resultado['fechaActivacion'],
                                    'redimeBono'	                   => $resultado['redimeBono'],
                                    'fechaRedimeBono'	               => $resultado['fechaRedimeBono'],
                                    'usuarioId'	                       => $resultado['usuarioId'],
                                    'nombreUser'	                   => $resultado['nombreUser'],
                                    'apellidoUser'	                   => $resultado['apellidoUser'],
                                    'cedulaPersona'	                   => $resultado['cedulaPersona'],
                                    'nombrePersona'	                   => $resultado['nombrePersona'],
                                    'apellidoPersona'	               => $resultado['apellidoPersona'],
                                    'telefono'	                       => $resultado['telefono'],
                                    'celularLlamadas'	               => $resultado['celularLlamadas'],
                                    'tipoId'	                       => $resultado['tipoIdentificacion'],
                                    'celularWhatsapp'	               => $resultado['celularWhatsapp'],
                                    'puntoActivacionId'	               => $resultado['puntoActivacionId'],
                                    'nombrePuntoActivacion'            => $resultado['nombrePuntoActivacion'],
                                    'tipoBonoId'	                   => $resultado['tipoBonoId'],
                                    'nombreBono'        	           => $resultado['nombreBono'],
                                    'tipoMembresiaId'                  => $resultado['tipoMembresiaId'],
                                    'nombreMembresia'                  => $resultado['nombreMembresia'],
                                    'infoBono'                         => $resultado['infoBono'],
                                    'conoceMembresias'                 => $resultado['conoceMembresias'],
                                    'calificacionPresentacionPersonal' => $resultado['calificacionPresentacionPersonal'],
        
                                ];
                            }
                            return $datos;
                        }
                        function getTipifiaciones(){
                            $datos = array();
                            $tipificaciones = new Tipificacion();
                            $tipificacionesSql = $tipificaciones->getTipificacion();
                            foreach($tipificacionesSql as $resultado){
                                $datos[]=[
                                    'tipificacionId'    => $resultado['tipificacionId'], 
                                    'nombre'            => $resultado['nombre'], 
                                    'fechaCreacion'     => $resultado['fechaCreacion'], 
                                    'estado'            => $resultado['estado'],
                                ];
                            }
                            return $datos;
        
                        }
                        function getTipoBonos(){
                            $datos = array();
                            $bonos = new TipoBono();
                            $bonosSql = $bonos->getTipoBono();
                            foreach($bonosSql as $resultado){
                                $datos [] = [
                                    'tipoBonoId'    => $resultado['tipoBonoId'], 
                                    'nombre'        => $resultado['nombre'], 
                                    'estado'        => $resultado['estado']
                                ];
                            }
                            return $datos;
        
                        }
                        //Retorna los tipos de membresias con estado 1     
                        function getTipoMembresias(){
                            $datos = array();
                            $membresias = new Tipomembresia();
                            $membresiasSql = $membresias->getTipoMembresia();
                            foreach($membresiasSql as $resultado){
                                $datos[] =[
                                    'tipoMembresiaId'   => $resultado['tipoMembresiaId'], 
                                    'nombre'            => $resultado['nombre'], 
                                    'estado'            => $resultado['estado'], 
                                ];
                            }
                            return $datos;
                        }
                                      
                        $resultadoFidelizacion = buscarFidelizacion($placa);
                        if(empty($resultadoFidelizacion)==1){
                            $yaGestionada = $placa;
                            $this->view->yaGestionada = $yaGestionada;
                        }else{
                            $tipificaciones = getTipifiaciones();
                            $bonos = getTipoBonos();
                            $membresias = getTipoMembresias();
                            $resultadoFidelizacion = json_encode($resultadoFidelizacion);    
                            $this->view->resultadoFidelizacion = json_decode($resultadoFidelizacion);                    
                            $tipificaciones = json_encode($tipificaciones);
                            $this->view->tipificaciones = json_decode($tipificaciones);
                            $bonos = json_encode($bonos);
                            $this->view->bonos = json_decode($bonos);
                            $membresias = json_encode($membresias);
                            $this->view->membresias = json_decode($membresias); 
                        }
                    }else{
                        $fecha = new DateTime($fecha);
                        $fecha = $fecha->format("d-m-Y");
                        $fecha = json_encode($fecha);
                        $this->view->fechaInvalida = json_decode($fecha);
                    }
                }else{
                    $notFound = json_encode($notFound);
                    $this->view->notFound = $placa;
                }
               

            }
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
        
    }

    public function guardarFidelizacionAction(){        
        $post = $this->request->getPost();        
        function get_client_ip() {
            $ipaddress = '';
            if (getenv('HTTP_CLIENT_IP'))
                $ipaddress = getenv('HTTP_CLIENT_IP');
            else if(getenv('HTTP_X_FORWARDED_FOR'))
                $ipaddress = getenv('HTTP_X_FORWARDED_FOR');
            else if(getenv('HTTP_X_FORWARDED'))
                $ipaddress = getenv('HTTP_X_FORWARDED');
            else if(getenv('HTTP_FORWARDED_FOR'))
                $ipaddress = getenv('HTTP_FORWARDED_FOR');
            else if(getenv('HTTP_FORWARDED'))
            $ipaddress = getenv('HTTP_FORWARDED');
            else if(getenv('REMOTE_ADDR'))
                $ipaddress = getenv('REMOTE_ADDR');
            else
                $ipaddress = 'UNKNOWN';
            return $ipaddress;
        }
        
        //print_r($post);die;
        if ($this->session->get("role") == 4){
            if(isset($post['btnEnviar'])){
                $ip = get_client_ip();
                $usuario = $this->session->get("iduser");
                $gestionId = $post['gestionId']; 
                $placa = $post['placaForm'];
                $tagAsociado = $post['tagAsociado'];
                $documento = $post['documento']; 
                $celular = $post['celular'];
                $activador = $post['activador'];
                $puntoActivacion = $post['puntoActivacion'];
                $fechaActivacion = $post['fechaActivacion'];
                $logroContacto = $post['logroContacto'];
                $noContacto = $post['noContacto'];
                $tipoMembresia = $post['tipoMembresia'];
                $tipoBono = $post['tipoBono'];
                $redimeBono = $post['redimeBono'];
                $fechaRedimeBono = $post['fechaRedimeBono'];
                $infoBono = $post['infoBono'];
                $conoceMembresias = $post['conoceMembresias'];
                $adquiereMembresia = $post['adquiereMembresia'];
                $observacion = $post['observacion'];
                $tipificacionId = $post['tipificacion'];
                $expGopass = $post['expGopass'];
                $calificacionPresentacionPersonal = $post['calificacionPresentacionPersonal'];
                $calificacionInfoClara = $post['calificacionInfoClara'];
                $calificacionAcompanamiento = $post['calificacionAcompanamiento'];
                $calificacionTiempoEspera = $post['calificacionTiempoEspera'];
                $calificacionComportamiento = $post['calificacionComportamiento'];
                $calificacionAmabilidad = $post['calificacionAmabilidad'];
                $fechaGestion = $this->date->format("Y-m-d H:i:s");
                $gestionGopass = Gestiongopass::findFirst([
                    "gestionId = :gestionId:",
                    'bind' => ['gestionId' => $gestionId]
                ]);
                $campana = $gestionGopass->campanaId;
                $fechaVolverLlamar = $gestionGopass->fechaVolverLlamar;
                if($logroContacto == 0){
                    $tipoMembresia = $gestionGopass->tipoMembresiaId;
                    $tipoBono = $gestionGopass->tipoBonoId;
                }
                if(!is_numeric($tipoBono)){
                    $tipoBono = $gestionGopass->tipoBonoId;
                }
                if(!is_numeric($tipoMembresia)){
                    $tipoMembresia = $gestionGopass->tipoMembresiaId;
                }
                if(!is_numeric($redimeBono)){
                    $redimeBono = $gestionGopass->redimeBono;
                }
                if(!is_numeric($infoBono)){
                    $infoBono = $gestionGopass->infoBono;
                }
                if(!is_numeric($conoceMembresias)){
                    $conoceMembresias = $gestionGopass->conoceMembresias;
                }
                
                if(($adquiereMembresia == 0) && ($tipificacionId == 217)){
                    $campana = 3;
                    $dia = date('d');
                    $mes = date('m')+1;
                    $ano = date('Y');
                    if($mes > 12){
                        $mes = 1;
                        $ano ++;                        
                    }
                    $fechaVolverLlamar = date_create(($ano . "-" . $mes . "-" . $dia));                    
                    $fechaVolverLlamar = json_encode($fechaVolverLlamar);
                    $fechaVolverLlamar = json_decode($fechaVolverLlamar);                    
                }elseif(($adquiereMembresia == 0) && ($tipificacionId == 219)){
                    $campana = 3;
                    $fechaVolverLlamar = null;
                }
                
                $gestionGopass->fechaGestion = $fechaGestion;
                $gestionGopass->fechaVolverLlamar = $fechaVolverLlamar->date;
                $gestionGopass->ip = $ip;
                $gestionGopass->usuarioId = $usuario;
                $gestionGopass->campanaId = $campana;                
                $gestionGopass->placa = $placa;
                $gestionGopass->celularLlamadas = $celular;
                $gestionGopass->fechaActivacion = $fechaActivacion;
                $gestionGopass->existeContacto = $logroContacto;
                $gestionGopass->motivoNoContacto = $noContacto;                
                $gestionGopass->tipoMembresiaId = $tipoMembresia;
                $gestionGopass->tipoBonoId = $tipoBono;
                $gestionGopass->redimeBono = $redimeBono;
                $gestionGopass->fechaRedimeBono = $fechaRedimeBono;
                $gestionGopass->infoBono = $infoBono;
                $gestionGopass->conoceMembresias = $conoceMembresias;
                $gestionGopass->adquiereMembresia = $adquiereMembresia;
                $gestionGopass->observacion = $observacion;
                $gestionGopass->tipificacionId = $tipificacionId;
                $gestionGopass->calificacionPresentacionPersonal = $calificacionPresentacionPersonal;
                $gestionGopass->calificacionInfoClara = $calificacionInfoClara;
                $gestionGopass->calificacionAcompanamiento = $calificacionAcompanamiento;
                $gestionGopass->calificacionTiempoEspera = $calificacionTiempoEspera;
                $gestionGopass->calificacionComportamiento = $calificacionComportamiento;
                $gestionGopass->calificacionAmabilidad = $calificacionAmabilidad;
                $gestionGopass->tagAsociado = $tagAsociado;
                
                // try{
                //     $gestionGopass->save();
                // }catch(Exception $e){
                //     echo 'Error saving Invoice: ';
                //     $messages = $gestionGopass->getMessages();
                //     foreach ($messages as $message) {
                //         echo $message . PHP_EOL;
                //     }
                //     die;
                // }
                // die;
                if ($gestionGopass->save() === false) {
                        // echo 'Error saving Invoice: ';
                        // $messages = $gestionGopass->getMessages();
                        // foreach ($messages as $message) {
                        //     echo $message . PHP_EOL;
                        // }
                        // die;
                        $error = json_encode($placa);
                        $error = $this->view->error = $error;
                        return $this->dispatcher->forward(
                        [
                            "params"    => [$error],
                            "action"     => "index",
                        ]);
                    }else{
                        $exito = json_encode($placa);
                        $exito = $this->view->exito = $exito;
                        return $this->dispatcher->forward(
                        [
                            "params"    => [$exito],
                            "action"     => "index",
                        ]);
                    }
            }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]);
            }
        }else{
            return $this->dispatcher->forward(
                [
                    "controller" => "erros",
                    "action"     => "show401",
                ]
            );
        }
    }

    
    
}
