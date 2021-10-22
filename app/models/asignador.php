<?php

use Phalcon\Mvc\Model;

class Asignador extends Model
{
    /**
     * @var integer
     */
    public $asignadoId;
    


    /**
     * Initialize method for model.
    */

    public function initialize()
    {

    }
    //Preguntar por la tipificacion que debe ir
    public function getAsignar($fechaInicial, $fechaFinal){ 
        $sql = "select count(*) cantidad from gestiongopass 
        where campanaId = 1 and fechaGestion >  CURDATE()-1
        and fechaGestion <  CURDATE()+1 and tipificacionId = 215;";
        $prepare = $this->getDi()->getShared("db")->prepare($sql);
        $prepare->execute();
        return $prepare;
    }
}