<?php

class Departamento extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $departamentoId;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=true)
     */
    public $nombre;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $estado;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("departamento");
        $this->hasMany('departamentoId', 'Ciudad', 'departamentoId', ['alias' => 'Ciudad']);
        $this->hasMany('departamentoId', 'Cliente', 'departamentoResidenciaId', ['alias' => 'Cliente']);
        $this->hasMany('departamentoId', 'HistoricoDepartamento', 'departamentoId', ['alias' => 'HistoricoDepartamento']);
        $this->hasMany('departamentoId', 'Venta', 'departamentoId', ['alias' => 'Venta']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'departamento';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Departamento[]|Departamento|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Departamento|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
