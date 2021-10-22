<?php

class Venta extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $ventaId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $productoId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $departamentoId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $sedeId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $ciudadId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $localidadId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $barrioId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $tipoVenta_Id;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=true)
     */
    public $direccionEntrega;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $fechaEntrega;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $franjaHoraria;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $indicacionesEntrega;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $estadoId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $valorPagar;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("venta");
        $this->hasMany('ventaId', 'Gestionexpedidor', 'ventaId', ['alias' => 'Gestionexpedidor']);
        $this->hasMany('ventaId', 'HistoricoVenta', 'ventaId', ['alias' => 'HistoricoVenta']);
        $this->hasMany('ventaId', 'Transaccion', 'ventaId', ['alias' => 'Transaccion']);
        $this->belongsTo('productoId', '\Producto', 'productoId', ['alias' => 'Producto']);
        $this->belongsTo('departamentoId', '\Departamento', 'departamentoId', ['alias' => 'Departamento']);
        $this->belongsTo('sedeId', '\Sede', 'sedeId', ['alias' => 'Sede']);
        $this->belongsTo('ciudadId', '\Ciudad', 'ciudadId', ['alias' => 'Ciudad']);
        $this->belongsTo('localidadId', '\Localidad', 'localidadId', ['alias' => 'Localidad']);
        $this->belongsTo('barrioId', '\Barrio', 'barrioId', ['alias' => 'Barrio']);
        $this->belongsTo('tipoVenta_Id', '\Tipoventa', 'tipoVenta_Id', ['alias' => 'Tipoventa']);
        $this->belongsTo('estadoId', '\Estado', 'estadoId', ['alias' => 'Estado']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'venta';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Venta[]|Venta|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Venta|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
