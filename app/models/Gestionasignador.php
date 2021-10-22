<?php

class Gestionasignador extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $gestionAsignadorId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $gestionExpedidorId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $estadoAsignador;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $criterioAsignador;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $usuarioMensajeroId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $usuarioid;

    /**
     *
     * @var string
     * @Column(type="string", nullable=false)
     */
    public $observacion;

    /**
     *
     * @var string
     * @Column(type="string", nullable=true)
     */
    public $fechaGestion;

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
        $this->setSource("gestionasignador");
        $this->hasMany('gestionAsignadorId', 'Gestionbackoffice', 'gestionAsignadorId', ['alias' => 'Gestionbackoffice']);
        $this->hasMany('gestionAsignadorId', 'Gestionmotorizado', 'gestionAsignadorId', ['alias' => 'Gestionmotorizado']);
        $this->hasMany('gestionAsignadorId', 'HistoricoGestionasignador', 'gestionAsignadorId', ['alias' => 'HistoricoGestionasignador']);
        $this->belongsTo('gestionExpedidorId', '\Gestionexpedidor', 'gestionExpedidorId', ['alias' => 'Gestionexpedidor']);
        $this->belongsTo('estadoAsignador', '\Estado', 'estadoId', ['alias' => 'Estado']);
        $this->belongsTo('criterioAsignador', '\Criterio', 'criterioId', ['alias' => 'Criterio']);
        $this->belongsTo('usuarioid', '\Usuario', 'usuarioId', ['alias' => 'Usuario']);
        $this->belongsTo('usuarioMensajeroId', '\Usuario', 'usuarioId', ['alias' => 'Usuario']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'gestionasignador';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Gestionasignador[]|Gestionasignador|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Gestionasignador|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function getListadoAsignador($fechaFin){
        $consulta = "SELECT tv.tipoVenta_Id, v.ventaId, ge.gestionExpedidorId, tv.cedulaCliente, tv.placa, 
        p.productoId, p.nombre nombreProducto, c.ciudadId, c.nombre nombreCiudad, 
        v.franjaHoraria, v.fechaEntrega, v.tipificacionId, t.nombre
        from tipoventa tv, venta v, producto p, ciudad c, gestionexpedidor ge, tipificacion t
        where tv.tipoVenta_Id = v.tipoVenta_Id and v.ventaId = ge.ventaId and v.productoId = p.productoId 
        and v.ciudadId = c.ciudadId and ge.estadoExpedidorId = 1
        and DATE_FORMAT(v.fechaentrega,'%Y/%m/%d') >= DATE_FORMAT(now(),'%Y/%m/%d') 
        and ge.gestionExpedidorId not in (select gestionExpedidorId from gestionAsignador)
        and DATE_FORMAT(v.fechaentrega,'%Y/%m/%d') <= date('$fechaFin')
        and t.tipificacionId = v.tipificacionId and t.tipificacionId  = 1 and ge.tipificacionId = 1
        UNION
        SELECT tv.tipoVenta_Id, v.ventaId, ge.gestionExpedidorId, tv.cedulaCliente, tv.placa, 
        p.productoId, p.nombre nombreProducto, c.ciudadId, c.nombre nombreCiudad, 
        v.franjaHoraria, v.fechaEntrega, v.tipificacionId, t.nombre
        from tipoventa tv, venta v, producto p, ciudad c, gestionexpedidor ge, tipificacion t
        where tv.tipoVenta_Id = v.tipoVenta_Id and v.ventaId = ge.ventaId and v.productoId = p.productoId 
        and v.ciudadId = c.ciudadId and ge.estadoExpedidorId = 1
        and DATE_FORMAT(v.fechaentrega,'%Y/%m/%d') >= DATE_FORMAT(now(),'%Y/%m/%d') 
        and ge.gestionExpedidorId not in (select gestionExpedidorId from gestionAsignador where estadoasignador = 5 and tipificacionId != 2)
        and DATE_FORMAT(v.fechaentrega,'%Y/%m/%d') <= date('$fechaFin')
        and t.tipificacionId = v.tipificacionId and t.tipificacionId  in (2,3) and ge.tipificacionId = 1
        group by 2";
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }
    

}
