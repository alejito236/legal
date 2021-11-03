<?php

class Preguntas extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $preguntasId;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=true)
     */
    public $nombre;

    
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("preguntas");        
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'preguntas';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Preguntas[]|Preguntas|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Preguntas|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function getResumen1(){
        $consulta = "SELECT * FROM logisticanovus.preguntas where preguntasId in (1,2,6,9);";
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }

    public function getResumen2(){
        $consulta = "SELECT * FROM logisticanovus.preguntas where preguntasId in (3,4,5,7);";
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }

}
