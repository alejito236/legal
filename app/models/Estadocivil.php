<?php

class Estadocivil extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $estadoCivilId;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=true)
     */
    public $nombre;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("estadocivil");
        $this->hasMany('estadoCivilId', 'Cliente', 'estadoCivilId', ['alias' => 'Cliente']);
        $this->hasMany('estadoCivilId', 'HistoricoEstadocivil', 'estadoCivilId', ['alias' => 'HistoricoEstadocivil']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'estadocivil';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Estadocivil[]|Estadocivil|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Estadocivil|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
