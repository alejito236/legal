<?php

use Phalcon\Flash;
use Phalcon\Session;

class AsignacionController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Asignacion');
        parent::initialize();
        $this->view->username = $this->session->get("username");
        $this->view->usuario = $this->session->get("usuario");
        $this->view->iduser = $this->session->get("iduser");
        $this->view->role = $this->session->get("role");
        $this->view->campana = $this->session->get("campana");
        $this->view->setTemplateAfter('LEGALlayout');
        $this->date = new \DateTime('America/Bogota');
        $this->dateAnterior = new \DateTime('America/Bogota'.'-1 day');
        $this->view->campanas_roles = $this->session->get("campanas_roles");

        //Retorna la clave del array, es un dato númerico si lo encuentra
        //Asignacion es rol 2
        $validaRol = array_search(2, array_column($this->view->campanas_roles, 'rol'));
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
        
        if(isset($post['fechaFinal'])){
            $this->session->set('filtroFecha', $post['fechaFinal']);            
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
     * Acccion para iniciar
     */

    public function indexAction(){
        
        $post = $this->request->getPost();        
        $id = $this->session->get('iduser');
        $filtroFecha = $this->session->get('filtroFecha');
        if(isset($post['btnGenerar']) || $filtroFecha != ''){
            if($filtroFecha != ''){
                //echo $filtroFecha;die;
                $fechaFinal = $filtroFecha;    
            }else{
                //$fechaInicial = $post['fechaInicio'];
                $fechaFinal = $post['fechaFinal'];
            }


            // echo $fechaInicial . "<br>";
            //echo $fechaFinal . "<br>";die;
            $motorizados = Usuario::find([
                'conditions'    => 'rolId = :rolid: and estado = :estado:',
                'bind'          => ['rolid' => 4, 'estado'=>1]
            ]);
            
            $motorizados = json_encode($motorizados);
            $this->view->motorizados = json_decode($motorizados);

            $estadosAsignacion = new Estado();
            $getEstadoAsignacion = $estadosAsignacion->getEstadoAsignacion();                        
            $getEstadoAsignacion = $getEstadoAsignacion->fetchAll();
            $getEstadoAsignacion = json_encode($getEstadoAsignacion);
            $this->view->getEstadoAsignacion = json_decode($getEstadoAsignacion);

            $criteriosAsignacion = new Criterio();
            $getCriteriosAsignacion = $criteriosAsignacion->getCriterioAsignacion();
            $getCriteriosAsignacion = $getCriteriosAsignacion->fetchAll();
            $getCriteriosAsignacion = json_encode($getCriteriosAsignacion);
            $this->view->getCriteriosAsignacion = json_decode($getCriteriosAsignacion);
            
            $gestionAsignacion = new GestionAsignacion();
            $getListadoAsignacion = $gestionAsignacion->getListadoAsignacion($fechaFinal);                        
            $getListadoAsignacion = $getListadoAsignacion->fetchAll();
            $getListadoAsignacion = json_encode($getListadoAsignacion);
            $getListadoAsignacion = json_decode($getListadoAsignacion);            
            
            if(empty($getListadoAsignacion)){
                $this->view->vacio = "No hay datos para esta fecha";
            }else{
                $this->view->getListadoAsignacion = $getListadoAsignacion;
            }
            
        }
    }

    public function guardarGestionAction(){        
        $post = $this->request->getPost();        
        $id = $this->session->get("iduser");
        $dateHoy = $this->date->format("Y-m-d H:i:s"); 
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
        $ip = get_client_ip();                

        if(isset($post['criterio'])){
            $criterioAsignacion = $post['criterio'];
            $usuarioMensajeroId = null; 
        }

        if(isset($post['mensajero'])){
            $criterioAsignacion = null;
            $usuarioMensajeroId = $post['mensajero']; 
        }        

        $gestionExpedidorId = $post['gestionExpedidorId']; 
        $estadoAsignacion = $post['estado'];
        $usuarioid = $id; 
        $observacion = $post['observacion']; 
        $fechaGestion = $dateHoy; 
        $ip = $ip;
        $ventaId = $post['ventaId'];

        $validaGestionAsignacion = GestionAsignacion::findFirst([
            'conditions'    => 'gestionExpedidorId = :gestionExpedidorId:',
            'bind'          => ['gestionExpedidorId' => $gestionExpedidorId]
        ]);

        if(empty($validaGestionAsignacion)){
            $insertGestionAsignacion = new GestionAsignacion();
            $insertGestionAsignacion->gestionExpedidorId = $gestionExpedidorId; 
            $insertGestionAsignacion->estadoAsignacion = $estadoAsignacion; 
            $insertGestionAsignacion->criterioAsignacion = $criterioAsignacion; 
            $insertGestionAsignacion->usuarioMensajeroId = $usuarioMensajeroId; 
            $insertGestionAsignacion->usuarioid = $usuarioid; 
            $insertGestionAsignacion->observacion = $observacion; 
            $insertGestionAsignacion->fechaGestion = $fechaGestion; 
            $insertGestionAsignacion->ip = $ip;
            if($estadoAsignacion == 5){
                $insertGestionAsignacion->tipificacionId = 1;
            }else{
                $insertGestionAsignacion->tipificacionId = 5;
            }
            
            //print_r($insertGestionAsignacion);die;
            /*try{
                if($insertGestionAsignacion->save()==false){
                $messages = $insertGestionAsignacion->getMessages();
                foreach ($messages as $message) {
                    echo $message . PHP_EOL;
                }
            }die;
            }catch(Exception $e){
                echo $e;
            }die;*/
            
            if($insertGestionAsignacion->save()){
                $validaGestionAsignacion = HistoricoGestionAsignacion::findFirst([
                    'conditions'    => 'gestionAsignacionId = :gestionAsignacionId:',
                    'bind'          => ['gestionAsignacionId' => $insertGestionAsignacion->gestionAsignacionId]
                ]);
                
                
                
                if(empty($validaGestionAsignacion)){
                    $fechaInsert = $dateHoy;
                    $fechaUpdate = null;
                }else{
                    $fechaInsert = null;
                    $fechaUpdate = $dateHoy;
                }
                $insertHistGestionAsig = new HistoricoGestionAsignacion();                
                $insertHistGestionAsig->gestionAsignacionId = $insertGestionAsignacion->gestionAsignacionId; 
                $insertHistGestionAsig->estadoAsignacion = $estadoAsignacion; 
                $insertHistGestionAsig->criterioAsignacion = $criterioAsignacion; 
                $insertHistGestionAsig->usuarioMensajeroId = $usuarioMensajeroId; 
                $insertHistGestionAsig->observacion = $observacion; 
                $insertHistGestionAsig->usuarioid = $usuarioid; 
                $insertHistGestionAsig->fechaGestion = $fechaGestion; 
                $insertHistGestionAsig->ip = $ip; 
                $insertHistGestionAsig->fechaInsert = $fechaInsert; 
                $insertHistGestionAsig->fechaUpdate = $fechaUpdate;
                $insertHistGestionAsig->tipificacionId = $insertGestionAsignacion->tipificacionId;
                
                if($insertHistGestionAsig->save() == false){
                    echo "Error al guardar historico";die;
                }else{
                    $this->view->guardo = "Se ha guardado correctamente el registro con ID $ventaId";
                    return $this->dispatcher->forward(
                        [
                            "controller" => "Asignacion",
                            "action"     => "index",
                        ]
                    );
                }

            }else{
                echo "Error al guardar gestion";die;
            }

        }else{
            
            $validaGestionAsignacion->gestionExpedidorId = $gestionExpedidorId; 
            $validaGestionAsignacion->estadoAsignacion = $estadoAsignacion; 
            $validaGestionAsignacion->criterioAsignacion = $criterioAsignacion; 
            $validaGestionAsignacion->usuarioMensajeroId = $usuarioMensajeroId; 
            $validaGestionAsignacion->usuarioid = $usuarioid; 
            $validaGestionAsignacion->observacion = $observacion; 
            $validaGestionAsignacion->fechaGestion = $fechaGestion; 
            $validaGestionAsignacion->ip = $ip;
            if($estadoAsignacion == 5){
                $validaGestionAsignacion->tipificacionId = 1;
            }else{
                $validaGestionAsignacion->tipificacionId = 5;
            }
            // try{
            //     if($validaGestionAsignacion->save()==false){
            //         $messages = $validaGestionAsignacion->getMessages();
            //         foreach ($messages as $message) {
            //             echo $message . PHP_EOL;
            //         }
            //     }
            // }catch(Exception $e){
            //     echo $e;
            // }die;
            if($validaGestionAsignacion->save()){                
                $validaHistGestionAsignacion = HistoricoGestionAsignacion::findFirst([
                    'conditions'    => 'gestionAsignacionId = :gestionAsignacionId:',
                    'bind'          => ['gestionAsignacionId' => $validaGestionAsignacion->gestionAsignacionId]
                ]);                
                
                if(empty($validaHistGestionAsignacion)){
                    $fechaInsert = $dateHoy;
                    $fechaUpdate = null;
                }else{
                    $fechaInsert = null;
                    $fechaUpdate = $dateHoy;
                }
                $insertHistGestionAsig = new HistoricoGestionAsignacion();                             
                $insertHistGestionAsig->gestionAsignacionId = $validaGestionAsignacion->gestionAsignacionId; 
                $insertHistGestionAsig->estadoAsignacion = $estadoAsignacion; 
                $insertHistGestionAsig->criterioAsignacion = $criterioAsignacion; 
                $insertHistGestionAsig->usuarioMensajeroId = $usuarioMensajeroId; 
                $insertHistGestionAsig->observacion = $observacion; 
                $insertHistGestionAsig->usuarioid = $usuarioid; 
                $insertHistGestionAsig->fechaGestion = $fechaGestion; 
                $insertHistGestionAsig->ip = $ip; 
                $insertHistGestionAsig->fechaInsert = $fechaInsert; 
                $insertHistGestionAsig->fechaUpdate = $fechaUpdate;
                $insertHistGestionAsig->tipificacionId = $validaGestionAsignacion->tipificacionId;
                // try{
                //     echo $validaGestionAsignacion->tipificacionId;
                //     if($insertHistGestionAsig ->save()==false){
                //         $messages = $insertHistGestionAsig->getMessages();
                //         foreach ($messages as $message) {
                //             echo $message . PHP_EOL;
                //         }
                //     }
                // }catch(Exception $e){
                //     echo $e;
                // }die;
                if($insertHistGestionAsig->save() == false){
                    echo "Error al guardar historico";die;
                }else{
                    return $this->dispatcher->forward(
                        [
                            "controller" => "Asignacion",
                            "action"     => "index",
                        ]
                    );
                }

            }else{
                echo "Error al actualizar gestion";die;
            }
        }
    }

    /**Elimina el array de ciudades elegidas para volver a seleccionar y cargar una nueva gestion */
    public function limpiarFechaAction(){
        $post = $this->request->getPost();        
        if(isset($post['eliminarFecha'])){
            $this->session->set('filtroFecha', '');            
            $this->session->set('contador','');
            //print_r($post['eliminarArray']);die;
            echo "Borrado";die;
        }
    }
}