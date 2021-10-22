<?php

class TempGestionbackoffice extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $temp_gestionbackofficeId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $gestionAsignadorId;

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
    public $fechaGestion;

    /**
     *
     * @var string
     * @Column(type="string", length=45, nullable=false)
     */
    public $ip;

    /** Retorna los registros que estan siendo gestionados por los backoffice */
    public function getEnGestion(){
        $consulta = "SELECT tv.tipoventa_id, v.ventaid, ge.gestionexpedidorid, ga.gestionasignadorid, u.usuarioid, concat(u.nombre, '', u.apellido) nombreBack,
        p.productoid, p.nombre nombreProducto, tv.cedulacliente, TIMESTAMPDIFF(MINUTE, tgb.fechaGestion, now()) minutos, tgb.temp_gestionbackofficeId gestionId
        FROM temp_gestionbackoffice tgb, gestionasignador ga, gestionexpedidor ge, venta v, tipoventa tv, usuario u,
        producto p
        where tgb.gestionasignadorid = ga.gestionasignadorid and ga.gestionexpedidorid = ge.gestionexpedidorid
        and ge.ventaid = v.ventaid and v.tipoventa_id = tv.tipoventa_id and tgb.usuarioid = u.usuarioid
        and p.productoid = v.productoid";
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }
    

}
