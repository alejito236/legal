<?php

use Phalcon\Flash;
use Phalcon\Session;

class asignadorController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Asignador');
        parent::initialize();
        $this->view->username = $this->session->get("username");
        $this->view->usuario = $this->session->get("usuario");
        $this->view->iduser = $this->session->get("iduser");
        $this->view->role = $this->session->get("role");
        $this->view->campana = $this->session->get("campana");
        $this->view->setTemplateAfter('LOGISTICAadminlayout');
        $this->date = new \DateTime('America/Bogota');
        $this->dateAnterior = new \DateTime('America/Bogota'.'-1 day');
        $this->view->campanas_roles = $this->session->get("campanas_roles");

        //Retorna la clave del array, es un dato númerico si lo encuentra
        //Asignador es rol 2
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

            $estadosAsignador = new Estado();
            $getEstadoAsignador = $estadosAsignador->getEstadoAsignador();                        
            $getEstadoAsignador = $getEstadoAsignador->fetchAll();
            $getEstadoAsignador = json_encode($getEstadoAsignador);
            $this->view->getEstadoAsignador = json_decode($getEstadoAsignador);

            $criteriosAsignador = new Criterio();
            $getCriteriosAsignador = $criteriosAsignador->getCriterioAsignador();
            $getCriteriosAsignador = $getCriteriosAsignador->fetchAll();
            $getCriteriosAsignador = json_encode($getCriteriosAsignador);
            $this->view->getCriteriosAsignador = json_decode($getCriteriosAsignador);
            
            $gestionAsignador = new Gestionasignador();
            $getListadoAsignador = $gestionAsignador->getListadoAsignador($fechaFinal);                        
            $getListadoAsignador = $getListadoAsignador->fetchAll();
            $getListadoAsignador = json_encode($getListadoAsignador);
            $getListadoAsignador = json_decode($getListadoAsignador);            
            
            if(empty($getListadoAsignador)){
                $this->view->vacio = "No hay datos para esta fecha";
            }else{
                $this->view->getListadoAsignador = $getListadoAsignador;
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
            $criterioAsignador = $post['criterio'];
            $usuarioMensajeroId = null; 
        }

        if(isset($post['mensajero'])){
            $criterioAsignador = null;
            $usuarioMensajeroId = $post['mensajero']; 
        }        

        $gestionExpedidorId = $post['gestionExpedidorId']; 
        $estadoAsignador = $post['estado'];
        $usuarioid = $id; 
        $observacion = $post['observacion']; 
        $fechaGestion = $dateHoy; 
        $ip = $ip;
        $ventaId = $post['ventaId'];

        $validaGestionAsignador = Gestionasignador::findFirst([
            'conditions'    => 'gestionExpedidorId = :gestionExpedidorId:',
            'bind'          => ['gestionExpedidorId' => $gestionExpedidorId]
        ]);

        if(empty($validaGestionAsignador)){
            $insertGestionAsignador = new Gestionasignador();
            $insertGestionAsignador->gestionExpedidorId = $gestionExpedidorId; 
            $insertGestionAsignador->estadoAsignador = $estadoAsignador; 
            $insertGestionAsignador->criterioAsignador = $criterioAsignador; 
            $insertGestionAsignador->usuarioMensajeroId = $usuarioMensajeroId; 
            $insertGestionAsignador->usuarioid = $usuarioid; 
            $insertGestionAsignador->observacion = $observacion; 
            $insertGestionAsignador->fechaGestion = $fechaGestion; 
            $insertGestionAsignador->ip = $ip;
            if($estadoAsignador == 5){
                $insertGestionAsignador->tipificacionId = 1;
            }else{
                $insertGestionAsignador->tipificacionId = 5;
            }
            
            //print_r($insertGestionAsignador);die;
            /*try{
                if($insertGestionAsignador->save()==false){
                $messages = $insertGestionAsignador->getMessages();
                foreach ($messages as $message) {
                    echo $message . PHP_EOL;
                }
            }die;
            }catch(Exception $e){
                echo $e;
            }die;*/
            
            if($insertGestionAsignador->save()){
                $validaGestionAsignador = HistoricoGestionasignador::findFirst([
                    'conditions'    => 'gestionAsignadorId = :gestionAsignadorId:',
                    'bind'          => ['gestionAsignadorId' => $insertGestionAsignador->gestionAsignadorId]
                ]);
                
                
                
                if(empty($validaGestionAsignador)){
                    $fechaInsert = $dateHoy;
                    $fechaUpdate = null;
                }else{
                    $fechaInsert = null;
                    $fechaUpdate = $dateHoy;
                }
                $insertHistGestionAsig = new HistoricoGestionasignador();                
                $insertHistGestionAsig->gestionAsignadorId = $insertGestionAsignador->gestionAsignadorId; 
                $insertHistGestionAsig->estadoAsignador = $estadoAsignador; 
                $insertHistGestionAsig->criterioAsignador = $criterioAsignador; 
                $insertHistGestionAsig->usuarioMensajeroId = $usuarioMensajeroId; 
                $insertHistGestionAsig->observacion = $observacion; 
                $insertHistGestionAsig->usuarioid = $usuarioid; 
                $insertHistGestionAsig->fechaGestion = $fechaGestion; 
                $insertHistGestionAsig->ip = $ip; 
                $insertHistGestionAsig->fechaInsert = $fechaInsert; 
                $insertHistGestionAsig->fechaUpdate = $fechaUpdate;
                $insertHistGestionAsig->tipificacionId = $insertGestionAsignador->tipificacionId;
                
                if($insertHistGestionAsig->save() == false){
                    echo "Error al guardar historico";die;
                }else{
                    $this->view->guardo = "Se ha guardado correctamente el registro con ID $ventaId";
                    return $this->dispatcher->forward(
                        [
                            "controller" => "asignador",
                            "action"     => "index",
                        ]
                    );
                }

            }else{
                echo "Error al guardar gestion";die;
            }

        }else{
            
            $validaGestionAsignador->gestionExpedidorId = $gestionExpedidorId; 
            $validaGestionAsignador->estadoAsignador = $estadoAsignador; 
            $validaGestionAsignador->criterioAsignador = $criterioAsignador; 
            $validaGestionAsignador->usuarioMensajeroId = $usuarioMensajeroId; 
            $validaGestionAsignador->usuarioid = $usuarioid; 
            $validaGestionAsignador->observacion = $observacion; 
            $validaGestionAsignador->fechaGestion = $fechaGestion; 
            $validaGestionAsignador->ip = $ip;
            if($estadoAsignador == 5){
                $validaGestionAsignador->tipificacionId = 1;
            }else{
                $validaGestionAsignador->tipificacionId = 5;
            }
            // try{
            //     if($validaGestionAsignador->save()==false){
            //         $messages = $validaGestionAsignador->getMessages();
            //         foreach ($messages as $message) {
            //             echo $message . PHP_EOL;
            //         }
            //     }
            // }catch(Exception $e){
            //     echo $e;
            // }die;
            if($validaGestionAsignador->save()){                
                $validaHistGestionAsignador = HistoricoGestionasignador::findFirst([
                    'conditions'    => 'gestionAsignadorId = :gestionAsignadorId:',
                    'bind'          => ['gestionAsignadorId' => $validaGestionAsignador->gestionAsignadorId]
                ]);                
                
                if(empty($validaHistGestionAsignador)){
                    $fechaInsert = $dateHoy;
                    $fechaUpdate = null;
                }else{
                    $fechaInsert = null;
                    $fechaUpdate = $dateHoy;
                }
                $insertHistGestionAsig = new HistoricoGestionasignador();                             
                $insertHistGestionAsig->gestionAsignadorId = $validaGestionAsignador->gestionAsignadorId; 
                $insertHistGestionAsig->estadoAsignador = $estadoAsignador; 
                $insertHistGestionAsig->criterioAsignador = $criterioAsignador; 
                $insertHistGestionAsig->usuarioMensajeroId = $usuarioMensajeroId; 
                $insertHistGestionAsig->observacion = $observacion; 
                $insertHistGestionAsig->usuarioid = $usuarioid; 
                $insertHistGestionAsig->fechaGestion = $fechaGestion; 
                $insertHistGestionAsig->ip = $ip; 
                $insertHistGestionAsig->fechaInsert = $fechaInsert; 
                $insertHistGestionAsig->fechaUpdate = $fechaUpdate;
                $insertHistGestionAsig->tipificacionId = $validaGestionAsignador->tipificacionId;
                // try{
                //     echo $validaGestionAsignador->tipificacionId;
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
                            "controller" => "asignador",
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