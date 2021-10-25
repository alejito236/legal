<?php

use Phalcon\Flash;
use Phalcon\Session;

class backofficeController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('backoffice');
        parent::initialize();
        $this->view->username = $this->session->get("username");
        $this->view->usuario = $this->session->get("usuario");
        $this->view->iduser = $this->session->get("iduser");
        $this->view->setTemplateAfter('LEGALlayout');
        $this->date = new \DateTime('America/Bogota');
        $this->dateAnterior = new \DateTime('America/Bogota' . '-1 day');
        $this->view->campanas_roles = $this->session->get("campanas_roles");
        //Retorna la clave del array, es un dato númerico si lo encuentra
        //backoffice es rol 1
        $validaRol = array_search(1, array_column($this->view->campanas_roles, 'rol'));
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
        $post = $this->request->getPost(); 
        
        if(isset($post['arrayCiudad'])  && isset($post['tipoProducto'])){            
            $this->session->set('existeArrayCiudades', $post['arrayCiudad']);
            $this->session->set('existeProducto', $post['tipoProducto']);
            $this->session->set('contador',1);            
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
     * Acccion para iniciar el index
     */

    public function indexAction(){   
        $post = $this->request->getPost();
        //$ciudadesCon = "1,2,3,4,9,30,19,22,23,49,16,29,14,5";
        $ciudades = Ciudad::find([
            'conditions'    => "estado = :estado: AND ciudadId in (1,2,3,4,9,30,19,22,23,49,16,29,14,5)",
            'bind'          => ["estado" => 1]
        ]);
        
        // try{
        // }catch(Exception $e){
        //     echo $e;
        // }
        
        $ciudades = json_encode($ciudades);        
        $this->view->ciudades = json_decode($ciudades);

        $productos = Producto::find([
            'conditions'    => "estado = :estado:",
            'bind'          => ["estado" => 1]
        ]);
        $productos = json_encode($productos);        
        $this->view->productos = json_decode($productos);
        $existeArrayCiudades = $this->session->get('existeArrayCiudades');
        $existeProducto = $this->session->get('existeProducto');        
        $existe = 0;
        // echo "existeProducto: " .$existeProducto . "<br>";
        // echo "existeArrayCiudades: " .$existeArrayCiudades . "<br>";
        //die;
        if(!empty($existeArrayCiudades) && $existeProducto >= 0){
            $existe =1;
        }
        if (isset($post['btnGenerar']) || $existe == 1) {
            
            $usuario = $this->view->iduser;
            $dateHoy = $this->date->format("Y-m-d H:i:s");
            
            if($existe == 1){
                $arrayCiudades = $existeArrayCiudades;
                $tipoProduto = $existeProducto;
            }else{
                $arrayCiudades = $post['arrayCiudad'];
                $tipoProduto = $post['tipoProducto'];
            }
            //Realizar consulta y retornar los datos que cumplan con los parametros
            $gestionBack = new Gestionbackoffice();
            $getListadoGestion = $gestionBack->getListadoGestion($arrayCiudades,$tipoProduto);            
            $getListadoGestion = $getListadoGestion->fetchAll();
            // echo "<pre>";
            // print_r($getListadoGestion);die;
            $getListadoGestion = json_encode($getListadoGestion);
            $this->view->getListadoGestion = json_decode($getListadoGestion);            
        }
    }

    /**Función para anular Soat y Tarejta */
    public function anularAction(){
        $post = $this->request->getPost();
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
        $usuario = $this->view->iduser;
        $dateHoy = $this->date->format("Y-m-d H:i:s");
        $ip = get_client_ip();
        $datos = $post['datos'];
        $registros = '';
        $respuesta = array();
        
        foreach ($datos as $dato){

            $tipoVenta = $dato['tipoVenta'];
            $gestionAsignacionid = $dato['gestionAsignacionid'];
            $productoid = $dato['productoid'];
            $existeGestionBack = Gestionbackoffice::findFirst([
                'conditions'    => 'gestionAsignacionId = :gestionAsignacionid:',
                'bind'          => ['gestionAsignacionid' => $gestionAsignacionid]
            ]);
            // echo empty($existeGestionBack);die;
            if(!empty($existeGestionBack)){
                //Producto 1 SOAT estado 21 Anulado
                if($productoid == 1){
                    $estado = 21;            
                }//Producto 2 Tarjeta estado 22 Ingreso a boveda
                elseif($productoid == 2){
                    $estado = 22;            
                }                
                $existeGestionBack->usuarioid = $usuario; 
                $existeGestionBack->fechaGestion = $dateHoy; 
                $existeGestionBack->ip = $ip;
                $existeGestionBack->estadoCierre = $estado;
                
                if($existeGestionBack->save()){
                    // echo $existeGestionBack->estadoCierre;die;
                     // echo "guardo update<br>";
                    $existeHistGestionBack = HistoricoGestionbackoffice::findFirst([
                        'conditions'    => 'gestionBackofficeId = :gestionBackofficeId:',
                        'bind'          => ['gestionBackofficeId'=> $existeGestionBack->gestionBackofficeId]
                    ]);
                    //Define si es un registro de insersión o actualización
                    if(empty($existeHistGestionBack)){
                        $fechaInsert = $dateHoy;
                        $fechaUpdate = NULL;
                    }else{
                        $fechaUpdate = $dateHoy;
                        $fechaInsert = NULL;
                    }
                    //Crea un nuevo registro en historicoGestionBack
                    $inserHistBack = new HistoricoGestionbackoffice();
                    $inserHistBack->gestionBackofficeId = $existeGestionBack->gestionBackofficeId; 
                    $inserHistBack->estadoBackoffice = $existeGestionBack->estadoBackoffice;  
                    $inserHistBack->estadoCierre = $estado; 
                    $inserHistBack->usuarioid = $usuario; 
                    $inserHistBack->observacion = $existeGestionBack->observacion;  
                    $inserHistBack->fechaGestion = $dateHoy; 
                    $inserHistBack->ip = $ip; 
                    $inserHistBack->fechaInsert = $fechaInsert; 
                    $inserHistBack->fechaUpdate = $fechaUpdate; 
                    if($inserHistBack->save()){
                        $respuesta[] = [("Se anulo correctamente el registro con ID: $tipoVenta")];
                        /**return $this->dispatcher->forward(
                            [
                                "controller" => "backoffice",
                                "action"     => "index",
                            ]
                        );*/
                    }else{
                        $respuesta[] = [print_r ("Error al guardar el historico del registro con ID: $tipoVenta")];
                        /*return $this->dispatcher->forward(
                            [
                                "controller" => "backoffice",
                                "action"     => "index",
                            ]
                        );*/
                    }

                }else{
                    $respuesta[] = [("Error al anular el registro con ID: $tipoVenta")];
                }
            }else{
                $registros = $registros . $tipoVenta .", ";
            }
        }
        if($registros != ''){
            $respuesta[] = [("Los registros con ID: $registros no pueden ser anulados sin antes ser gestionados ")];
        }
        $respuesta = json_encode($respuesta);
        print_r ($respuesta);        
        die;
        //$respuesta = json_decode($respuesta);
        
        
    }

    /** Función para cargar toda la informacion del cliente
     * Para la gestion del motorizado
     */

    public function gestionAction(){
        
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
        $usuario = $this->view->iduser;
        $dateHoy = $this->date->format("Y-m-d H:i:s"); 
        $ip = get_client_ip();
        $borro = 0;
        if(isset($post['btnEditar'])){
            $tipoVentaId = $post['tipoVenta'];
            $gestionAsignacionid = $post['gestionAsignacionid'];
            //valida que el registro no este en gestion (bloqueado) por algún usuario
            $validaTempGestion = TempGestionbackoffice::findFirst([
                'conditions'    => 'gestionAsignacionId = :gestionAsignacionid:',
                'bind'          => ['gestionAsignacionid' => $gestionAsignacionid]
            ]);
            if(!empty($validaTempGestion)){
                $usuarioEnGestion = $validaTempGestion->usuarioid;                
                $dateBase = $validaTempGestion->fechaGestion;
                $dateSistema = $dateHoy;
                $diferencia = strtotime($dateSistema) - strtotime($dateBase);
                /**Se libera el registro que esta en gestion (bloqueado)
                *Si la diferencia es mayor o igual a 30 min = 1800 seg
                *o si el registro esta bloqueado por el mismo usuario 
                */
                if($diferencia >= 1800 || $usuarioEnGestion == $usuario){                    
                    if($validaTempGestion->delete()){
                        $borro =1;
                    }
                }                
            }
            /**Valida que el resgistro no este bloeado  */
            if(empty($validaTempGestion) || $borro == 1){
                
                //Inserta en la tabla temp_gestionnackoffice
                $insertTempGestionBack = new TempGestionbackoffice();
                $insertTempGestionBack->gestionAsignacionId = $gestionAsignacionid;
                $insertTempGestionBack->usuarioid = $usuario;
                $insertTempGestionBack->fechaGestion = $dateHoy;
                $insertTempGestionBack->ip = $ip;
                /*
                try{
                    if($insertTempGestionBack->save()==false){
                        $messages = $insertTempGestionBack->getMessages();
                        foreach ($messages as $message) {
                            echo $message . PHP_EOL;
                        }
                    }
                }catch(Eception $e){
                    echo $e;
                }die;*/

                if($insertTempGestionBack->save()){                    
                    $gestionBack = new Gestionbackoffice();            
                    $getGestionBack = $gestionBack->getGestionBack($gestionAsignacionid);
                    // print_r($getGestionBack);die;
                    $getGestionBack = $getGestionBack->fetch();
                    $getGestionBack = json_encode($getGestionBack);
                    $this->view->getGestionBack = json_decode($getGestionBack);

                    $historicoMotorizado = new HistoricoGestionmotorizado();
                    $getHistoricoReporte = $historicoMotorizado->getHistoricoReporte($gestionAsignacionid);
                    $getHistoricoReporte = $getHistoricoReporte->fetchAll();
                    $getHistoricoReporte = json_encode($getHistoricoReporte);
                    $this->view->getHistoricoReporte = json_decode($getHistoricoReporte);            
                    
                    $estado = new Estado();
                    $getEstadosBack = $estado->getEstadosBack();
                    $getEstadosBack = $getEstadosBack->fetchAll();
                    $getEstadosBack = json_encode($getEstadosBack);
                    $this->view->getEstadosBack = json_decode($getEstadosBack);
                    // echo "<pre>";
                }else{
                    $this->view->enGestion = "Error al poner el registro en gestion,
                    comuniquese con el administrador";
                }

            }else{
                
                //print_r());die;
                $this->view->enGestion = "El registro elegido se encuentra en gestion, por favor elija otro.";
                return $this->dispatcher->forward(
                    [
                        "controller" => "backoffice",
                        "action"     => "index",
                    ]);
                
            }

            

            

        }
        



    }

    /**Funcion para guardar la gestion del backoffice */
    public function guardarGestionAction(){        
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
        $usuario = $this->view->iduser;
        $dateHoy = $this->date->format("Y-m-d H:i:s"); 
        $ip = get_client_ip();        
        $tipoventa_id = $post['tipoventa_id'];
        $ventaid = $post['ventaid'];
        $gestionexpedidorid = $post['gestionexpedidorid'];
        $gestionAsignacionid = $post['gestionAsignacionid'];
        $estadoBack = $post['estadoBack'];
        $observacionBack = $post['observacionBack'];
        $productoid = $post['productoid'];
        //$post['accionBack'] == 1 Guarda $post['accionBack'] == 2 anula
        if($post['accionBack'] == 2){
            //Producto 1 SOAT estado 21 Anulado
            if($productoid == 1){
                $estado = 21;            
            }//Producto 2 Tarjeta estado 22 Ingreso a boveda
            elseif($productoid == 2){
                $estado = 22;            
            }
        }else{
            //Estado 23 pendiente
            $estado = 23;            
        }
        $existeGestionBack = Gestionbackoffice::findFirst([
            'conditions'    => 'gestionAsignacionId = :gestionAsignacionid:',
            'bind'          => ['gestionAsignacionid' => $gestionAsignacionid]
        ]);

        //Si existe la gestion actualiza el registro sino inserta un nuevo registro
        if(!empty($existeGestionBack)){
            //Actualiza en gestionbackoffice si ya existe el registro
            $existeGestionBack->gestionAsignacionId = $gestionAsignacionid;
            $existeGestionBack->estadoBackoffice = $estadoBack;                 
            $existeGestionBack->usuarioid = $usuario; 
            $existeGestionBack->observacion = $observacionBack; 
            $existeGestionBack->fechaGestion = $dateHoy; 
            $existeGestionBack->ip = $ip;
            $existeGestionBack->estadoCierre = $estado;

            if($existeGestionBack->save()){
                
                //Valida si existe el historico del registro.
                $existeHistGestionBack = HistoricoGestionbackoffice::findFirst([
                    'conditions'    => 'gestionBackofficeId = :gestionBackofficeId:',
                    'bind'          => ['gestionBackofficeId'=> $existeGestionBack->gestionBackofficeId]
                ]);
                //Define si es un registro de insersión o actualización
                if(empty($existeHistGestionBack)){
                    $fechaInsert = $dateHoy;
                    $fechaUpdate = NULL;
                }else{
                    $fechaUpdate = $dateHoy;
                    $fechaInsert = NULL;
                }
                //Crea un nuevo registro en historicoGestionBack
                $inserHistBack = new HistoricoGestionbackoffice();
                $inserHistBack->gestionBackofficeId = $existeGestionBack->gestionBackofficeId; 
                $inserHistBack->estadoBackoffice = $estadoBack;  
                $inserHistBack->estadoCierre = $estado; 
                $inserHistBack->usuarioid = $usuario; 
                $inserHistBack->observacion = $observacionBack;  
                $inserHistBack->fechaGestion = $dateHoy; 
                $inserHistBack->ip = $ip; 
                $inserHistBack->fechaInsert = $fechaInsert; 
                $inserHistBack->fechaUpdate = $fechaUpdate; 
                
                if($inserHistBack->save()){
                    //Libera el registro de la gestion
                    $deleteTempGEstion = TempGestionbackoffice::findFirst([
                        'conditions'    => 'gestionAsignacionId = :id:',
                        'bind'          => ['id' => $gestionexpedidorid]
                    ]);
                    
                    if(!empty($deleteTempGEstion)){
                        $deleteTempGEstion->delete();                        
                    }
                    if($estadoBack == 29){
                        $gestionAsignacion = GestionAsignacion::findFirst([
                            'conditions'    => 'gestionAsignacionId = :gestionAsignacionid:',
                            'bind'          => ['gestionAsignacionid' => $gestionAsignacionid]
                        ]);
                        $gestionAsignacion->tipificacionId = 2;
                        $gestionAsignacion->save();
                        $gestionExpedidor = Gestionexpedidor::findFirst([
                            'conditions'    => 'gestionExpedidorId = :gestionexpedidorid:',
                            'bind'          => ['gestionexpedidorid' => $gestionexpedidorid]
                        ]);
                        $gestionExpedidor->tipificacionId = 2;
                        $gestionExpedidor->save();
                        $venta = Venta::findFirst([
                            'conditions'    => 'ventaId = :ventaid:',
                            'bind'          => ['ventaid' => $ventaid]
                        ]);
                        $venta->tipificacionId = 5;
                        $venta->save();
                        $tipoVenta = TipoVenta::findFirst([
                            'conditions'    => 'tipoVenta_Id = :tipoVenta_Id:',
                            'bind'          => ['tipoVenta_Id' => $venta->tipoVenta_Id]
                        ]);                        
                        
                        $tipoVenta->tipificacionId = 5;
                        $tipoVenta->save();
                    }
                    $this->view->guardo = "Se guardo correctamente el registro con ID: $ventaid";
                    return $this->dispatcher->forward(
                        [
                            "controller" => "backoffice",
                            "action"     => "index",
                        ]
                    );
                }else{
                    //Libera el registro de la gestion
                    $deleteTempGEstion = TempGestionbackoffice::findFirst([
                        'conditions'    => 'gestionAsignacionId = :id:',
                        'bind'          => ['id' => $gestionexpedidorid]
                    ]);
                    
                    if(!empty($deleteTempGEstion)){
                        $deleteTempGEstion->delete();                        
                    }
                    $this->view->error = "Error al guardar el historico del registro con ID: $ventaid";
                    return $this->dispatcher->forward(
                        [
                            "controller" => "backoffice",
                            "action"     => "index",
                        ]
                    );
                }
            }else{
                //Libera el registro de la gestion
                $deleteTempGEstion = TempGestionbackoffice::findFirst([
                    'conditions'    => 'gestionAsignacionId = :id:',
                    'bind'          => ['id' => $gestionexpedidorid]
                ]);
                
                if(!empty($deleteTempGEstion)){
                    $deleteTempGEstion->delete();                        
                }
                $this->view->error = "Error al actualizar registro con ID: $ventaid";
                return $this->dispatcher->forward(
                    [
                        "controller" => "backoffice",
                        "action"     => "index",
                    ]
                );
            }   
        }else{
            //inserta en gestion backoffice en caso de que no exista el registro
            $inserGestionBack = new Gestionbackoffice();
            $inserGestionBack->gestionAsignacionId = $gestionAsignacionid;
            $inserGestionBack->estadoBackoffice = $estadoBack;                 
            $inserGestionBack->usuarioid = $usuario; 
            $inserGestionBack->observacion = $observacionBack; 
            $inserGestionBack->fechaGestion = $dateHoy; 
            $inserGestionBack->ip = $ip;
            $inserGestionBack->estadoCierre = $estado;
            

            if($inserGestionBack->save()){                
                $existeHistGestionBack = HistoricoGestionbackoffice::findFirst([
                    'conditions'    => 'gestionBackofficeId = :gestionBackofficeId:',
                    'bind'          => ['gestionBackofficeId'=> $inserGestionBack->gestionBackofficeId]
                ]);
                if(empty($existeHistGestionBack)){
                    $fechaInsert = $dateHoy;
                    $fechaUpdate = NULL;
                }else{
                    $fechaUpdate = $dateHoy;
                    $fechaInsert = NULL;
                }
                $inserHistBack = new HistoricoGestionbackoffice();
                $inserHistBack->gestionBackofficeId = $inserGestionBack->gestionBackofficeId; 
                $inserHistBack->estadoBackoffice = $estadoBack;  
                $inserHistBack->estadoCierre = $estado; 
                $inserHistBack->usuarioid = $usuario; 
                $inserHistBack->observacion = $observacionBack;  
                $inserHistBack->fechaGestion = $dateHoy; 
                $inserHistBack->ip = $ip; 
                $inserHistBack->fechaInsert = $fechaInsert; 
                $inserHistBack->fechaUpdate = $fechaUpdate; 
                
                if($inserHistBack->save()){
                    //Libera el registro de la gestion
                    $deleteTempGEstion = TempGestionbackoffice::findFirst([
                        'conditions'    => 'gestionAsignacionId = :id:',
                        'bind'          => ['id' => $gestionexpedidorid]
                    ]);
                    
                    if(!empty($deleteTempGEstion)){
                        $deleteTempGEstion->delete();                        
                    }
                    if($estadoBack == 29){
                        $gestionAsignacion = GestionAsignacion::findFirst([
                            'conditions'    => 'gestionAsignacionId = :gestionAsignacionid:',
                            'bind'          => ['gestionAsignacionid' => $gestionAsignacionid]
                        ]);
                        $gestionAsignacion->tipificacionId = 2;
                        $gestionAsignacion->save();
                        $gestionExpedidor = Gestionexpedidor::findFirst([
                            'conditions'    => 'gestionExpedidorId = :gestionexpedidorid:',
                            'bind'          => ['gestionexpedidorid' => $gestionexpedidorid]
                        ]);
                        $gestionExpedidor->tipificacionId = 2;
                        $gestionExpedidor->save();
                        $venta = Venta::findFirst([
                            'conditions'    => 'ventaId = :ventaid:',
                            'bind'          => ['ventaid' => $ventaid]
                        ]);
                        $venta->tipificacionId = 5;
                        $venta->save();
                        $tipoVenta = TipoVenta::findFirst([
                            'conditions'    => 'tipoVenta_Id = :tipoVenta_Id:',
                            'bind'          => ['tipoVenta_Id' => $venta->tipoVenta_Id]
                        ]);                        
                        
                        $tipoVenta->tipificacionId = 5;
                        $tipoVenta->save();
                    }
                    $this->view->guardo = "Se guardo correctamente el registro con ID: $ventaid";
                    return $this->dispatcher->forward(
                        [
                            "controller" => "backoffice",
                            "action"     => "index",
                        ]
                    );
                }else{
                    //Libera el registro de la gestion
                    $deleteTempGEstion = TempGestionbackoffice::findFirst([
                        'conditions'    => 'gestionAsignacionId = :id:',
                        'bind'          => ['id' => $gestionexpedidorid]
                    ]);
                    
                    if(!empty($deleteTempGEstion)){
                        $deleteTempGEstion->delete();                        
                    }
                    $this->view->error = "Error al guardar el historico del registro con ID: $ventaid";
                    return $this->dispatcher->forward(
                        [
                            "controller" => "backoffice",
                            "action"     => "index",
                        ]
                    );
                }
            }else{
                //Libera el registro de la gestion
                $deleteTempGEstion = TempGestionbackoffice::findFirst([
                    'conditions'    => 'gestionAsignacionId = :id:',
                    'bind'          => ['id' => $gestionexpedidorid]
                ]);
                
                if(!empty($deleteTempGEstion)){
                    $deleteTempGEstion->delete();                        
                }
                $this->view->error = "Error al guardar registro con ID: $ventaid";
                return $this->dispatcher->forward(
                    [
                        "controller" => "backoffice",
                        "action"     => "index",
                    ]
                );
            }   
            
        }

        
    }

    /**Libera el registro que se estaba gestionando*/
    public function limpiarEnGestionAction(){
        $post = $this->request->getPost();        
        if(isset($post['limpiarEnGestion'])){
            $id = $post['limpiarEnGestion'];
            $deleteTempGEstion = TempGestionbackoffice::findFirst([
                'conditions'    => 'gestionAsignacionId = :id:',
                'bind'          => ['id' => $id]
            ]);
            
            if(!empty($deleteTempGEstion)){
                $deleteTempGEstion->delete();
                //print_r("borrado");die;
            }
        }
    }

    /**Elimina el array de ciudades elegidas para volver a seleccionar y cargar una nueva gestion */
    public function borrarArrayCiudadesAction(){
        $post = $this->request->getPost();
        if(isset($post['eliminarArray'])){
            $this->session->set('existeArrayCiudades', '');
            $this->session->set('existeProducto', -1);
            $this->session->set('contador','');
            //print_r($post['eliminarArray']);die;            
        }
    }

    /**Carga todos los anulados */
    public function anuladosAction(){
        $post = $this->request->getPost();
        if(isset($post['fechaInicio']) && isset($post['fechaFin'])){
            $fechaInicio = $post['fechaInicio'];
            $fechaFin = $post['fechaFin'];
            $gestionBack = new Gestionbackoffice();
            $getAnuladosBack = $gestionBack->getAnuladosBack($fechaInicio, $fechaFin);            
            $getAnuladosBack = $getAnuladosBack->fetchAll();
            if(!empty($getAnuladosBack)){
                $getAnuladosBack = json_encode($getAnuladosBack);
                $this->view->getAnuladosBack = json_decode($getAnuladosBack);
                $this->view->fechaInicio = $fechaInicio ;
                $this->view->fechaFin = $fechaFin ;
            }else{
                $this->view->sinResgistros = 'No hay productos anulados para el rango dado';
            }

        }
    }

    
}
