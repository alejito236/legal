<?php

class Transaccion extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $transaccionId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $ventaId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $medioPagoId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $estadoTransaccion;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $valorPagado;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $fechaTransaccion;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $numeroTarjeta;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $tipoTarjetaId;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $ip;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("transaccion");
        $this->hasMany('transaccionId', 'HistoricoTransaccion', 'transaccionId', ['alias' => 'HistoricoTransaccion']);
        $this->belongsTo('ventaId', '\Venta', 'ventaId', ['alias' => 'Venta']);
        $this->belongsTo('medioPagoId', '\Mediopago', 'medioPagoId', ['alias' => 'Mediopago']);
        $this->belongsTo('tipoTarjetaId', '\Tipotarjeta', 'tipoTarjetaId', ['alias' => 'Tipotarjeta']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'transaccion';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Transaccion[]|Transaccion|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Transaccion|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
