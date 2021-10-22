<?php

use Phalcon\Flash;
use Phalcon\Session;

class AdminController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Administador');
        parent::initialize();
        $this->view->username = $this->session->get("username");
        $this->view->usuario = $this->session->get("usuario");
        $this->view->role = $this->session->get("role");
        $this->view->setTemplateAfter('adminloyouts');

        $id = $this->session->get('iduser');
        $fecha = $this->date->format("Y-m-d H:i:s");
        $usuarios = new Usuarios();

        $usuarios = Usuarios::findFirst([
            "iidUser = :id:",
            'bind' => ['id' => $id]
        ]);

        $usuarios->ultimaSesion = $fecha;

        $usuarios->save();
    }

    /**
     * Acccion para iniciar el rol admnistrativo
     */

    public function indexAction()
    {   
        $post = $this->request->getPost();

        $fini= date('Y-m-d');
        $ffin= date('Y-m-d'); 

        if(isset($post['fechaInicial'])){
            $fini= $post['fechaInicial'];
            $ffin= $post['fechaFinal'];
        }

        // print_r($post);die;

        $role = $this->session->get("role");
        if($role == 1){

            

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
