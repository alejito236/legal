<?php

class Mediopago extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $medioPagoId;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=true)
     */
    public $nombre;

    /**
     *
     * @var integer
     * @Column(type="integer", length=4, nullable=true)
     */
    public $estado;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("mediopago");
        $this->hasMany('medioPagoId', 'HistoricoMediopago', 'medioPagoId', ['alias' => 'HistoricoMediopago']);
        $this->hasMany('medioPagoId', 'Transaccion', 'medioPagoId', ['alias' => 'Transaccion']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'mediopago';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Mediopago[]|Mediopago|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Mediopago|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
