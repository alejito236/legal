<?php

class Tipoventa extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $tipoVenta_Id;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $cedulaCliente;

    /**
     *
     * @var string
     * @Column(type="string", length=8, nullable=true)
     */
    public $placa;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $tagAsociado;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $valorPagar;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $estadoId;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("tipoventa");
        $this->hasMany('tipoVenta_Id', 'Venta', 'tipoVenta_Id', ['alias' => 'Venta']);
        $this->belongsTo('cedulaCliente', '\Cliente', 'cedulaCliente', ['alias' => 'Cliente']);
        $this->belongsTo('estadoId', '\Estado', 'estadoId', ['alias' => 'Estado']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'tipoventa';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Tipoventa[]|Tipoventa|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Tipoventa|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
