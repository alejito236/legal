<?php

class Gestionbackoffice extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $gestionBackofficeId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $gestionAsignadorId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $estadoBackoffice;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $estadoCierre;

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
        $this->setSource("gestionbackoffice");
        $this->hasMany('gestionBackofficeId', 'HistoricoGestionbackoffice', 'gestionBackofficeId', ['alias' => 'HistoricoGestionbackoffice']);
        $this->belongsTo('gestionAsignadorId', '\Gestionasignador', 'gestionAsignadorId', ['alias' => 'Gestionasignador']);
        $this->belongsTo('estadoBackoffice', '\Estado', 'estadoId', ['alias' => 'Estado']);
        $this->belongsTo('estadoCierre', '\Estado', 'estadoId', ['alias' => 'Estado']);
        $this->belongsTo('usuarioid', '\Usuario', 'usuarioId', ['alias' => 'Usuario']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'gestionbackoffice';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Gestionbackoffice[]|Gestionbackoffice|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Gestionbackoffice|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function getListadoGestion($ciudades,$productos){
        $consulta1 = "SELECT tv.tipoventa_id, v.ventaid, ge.gestionexpedidorid, ga.gestionasignadorid, gm.gestionmotorizadoid,
        c.ciudadid, c.nombre nombreCiudad, p.productoid, p.nombre nombreProducto, tv.cedulacliente, v.franjaHoraria,
        tv.placa, u.usuarioid, u.nombre nombreMoto, em.estadoid, em.nombre nombreEstadoMoto, v.fechaEntrega,
        eb.estadoid estadoBackId, ec.estadoid estadoCierreId, eb.nombre nombreEstadoBack, ec.nombre nombreEstadoCierre, gm.fechaGestion 
        FROM tipoventa tv, venta v, gestionexpedidor ge, gestionasignador ga, gestionbackoffice gb, gestionmotorizado gm,
        ciudad c, producto p, usuario u, estado eb, estado ec, estado em
        WHERE tv.tipoventa_id = v.tipoventa_id and v.ventaid = ge.ventaid and ge.gestionexpedidorid = ga.gestionexpedidorid
        and ga.gestionasignadorid = gb.gestionAsignadorId and v.ciudadid = c.ciudadid and v.productoid = p.productoid
        and gb.estadoBackoffice = eb.estadoid and gb.estadoCierre = ec.estadoid and ga.usuarioMensajeroId = u.usuarioid
        and (ec.estadoId is null or ec.estadoid = 23) and gm.gestionasignadorid = ga.gestionasignadorid 
        and gm.estadomotorizado = em.estadoid and DATE_FORMAT(v.fechaentrega,'%d/%m/%Y') = DATE_FORMAT(now(),'%d/%m/%Y')
        and gm.estadomotorizado = 8 and c.ciudadid in ($ciudades) and ge.tipificacionId = 1 and ga.tipificacionid=1";
        $consulta2 = "SELECT tv.tipoventa_id, v.ventaid, ge.gestionexpedidorid, ga.gestionasignadorid, gm.gestionmotorizadoid,
        c.ciudadid, c.nombre nombreCiudad, p.productoid, p.nombre nombreProducto, tv.cedulacliente, v.franjaHoraria,
        tv.placa, u.usuarioid, u.nombre nombreMoto, e.estadoid, e.nombre nombreEstadoMoto, v.fechaEntrega,
        '' estadoBackId, '' estadoCierreId, '' nombreEstadoBack, '' nombreEstadoCierre, gm.fechaGestion
        FROM tipoventa tv, venta v, gestionexpedidor ge, gestionasignador ga, gestionmotorizado gm,
        ciudad c, producto p, usuario u, estado e
        WHERE tv.tipoventa_id = v.tipoventa_id and v.ventaid = ge.ventaid and ge.gestionexpedidorid = ga.gestionexpedidorid
        and gm.gestionasignadorid  = ga.gestionasignadorid
        and v.ciudadid = c.ciudadid and v.productoid = p.productoid and ga.usuarioMensajeroId = u.usuarioid
        and ga.gestionasignadorid not in (select gestionasignadorid from gestionbackoffice) and gm.estadoMotorizado = e.estadoid
        and DATE_FORMAT(v.fechaentrega,'%d/%m/%Y') = DATE_FORMAT(now(),'%d/%m/%Y')
        and gm.estadomotorizado = 8 and c.ciudadid in ($ciudades) and ge.tipificacionId = 1 and ga.tipificacionid=1";
        if($productos != 0){
            $consulta1 = $consulta1 . " and p.productoid = $productos";
            $consulta2 = $consulta2 . " and p.productoid = $productos";
        }
        $consulta = "$consulta1 UNION $consulta2 group by 1 ORDER BY estadoBackId, ciudadid, franjaHoraria,1";
        //print_r($consulta);die;
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }

    public function getGestionBack($gestionasignadorid){
        $consulta = "SELECT tv.tipoventa_id, v.ventaid, ge.gestionexpedidorid, ga.gestionasignadorid, cl.cedulacliente, tv.placa,
        cl.nombres_apellidos nombreCliente, cl.telefono, cl.celular1, cl.celular2, v.ciudadid, c.nombre nombreCiudad,
        v.direccionentrega, v.barrioid, b.nombre nombreBarrio, v.productoid, p.nombre nombreProducto, ge.poliza
        from tipoventa tv, venta v, gestionexpedidor ge, gestionasignador ga, cliente cl, ciudad c, barrio b, producto p
        where tv.tipoventa_id = v.tipoventa_id and v.ventaid = ge.ventaid and ge.gestionexpedidorid = ga.gestionexpedidorid 
        and tv.cedulacliente = cl.cedulacliente and v.ciudadid = c.ciudadid and v.barrioid = b.barrioid 
        and v.productoid = p.productoid and ga.gestionasignadorid = $gestionasignadorid";
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }

    public function getAnuladosBack($fechaInicio, $fechaFin){
        $consulta = "SELECT tv.tipoventa_id, v.ventaid, ge.gestionexpedidorid, ga.gestionasignadorid, gm.gestionmotorizadoid,
        c.ciudadid, c.nombre nombreCiudad, p.productoid, p.nombre nombreProducto, tv.cedulacliente, v.franjaHoraria,
        tv.placa, u.usuarioid, u.nombre nombreMoto, em.estadoid, em.nombre nombreEstadoMoto, v.fechaEntrega,
        eb.estadoid estadoBackId, ec.estadoid estadoCierreId, eb.nombre nombreEstadoBack, ec.nombre nombreEstadoCierre 
        FROM tipoventa tv, venta v, gestionexpedidor ge, gestionasignador ga, gestionbackoffice gb, gestionmotorizado gm,
        ciudad c, producto p, usuario u, estado eb, estado ec, estado em
        WHERE tv.tipoventa_id = v.tipoventa_id and v.ventaid = ge.ventaid and ge.gestionexpedidorid = ga.gestionexpedidorid
        and ga.gestionasignadorid = gb.gestionAsignadorId and v.ciudadid = c.ciudadid and v.productoid = p.productoid
        and gb.estadoBackoffice = eb.estadoid and gb.estadoCierre = ec.estadoid and ga.usuarioMensajeroId = u.usuarioid
        and (ec.estadoId is not null and ec.estadoid != 23) and gm.gestionasignadorid = ga.gestionasignadorid 
        and gm.estadomotorizado = em.estadoid and DATE_FORMAT(v.fechaentrega,'%Y/%m/%d') >= date('$fechaInicio')
        and DATE_FORMAT(v.fechaentrega,'%Y/%m/%d') <= date('$fechaFin')
        and gm.estadomotorizado = 8 ";        
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }
}
