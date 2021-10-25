<?php

class Gestionexpedidor extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $gestionExpedidorId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $ventaId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=4, nullable=true)
     */
    public $estadoPresupuesto;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $criterioPresupuesto;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $estadoExpedidorId;

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
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=true)
     */
    public $poliza;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSchema("logisticanovus");
        $this->setSource("gestionexpedidor");
        $this->hasMany('gestionExpedidorId', 'GestionAsignacion', 'gestionExpedidorId', ['alias' => 'GestionAsignacion']);
        $this->hasMany('gestionExpedidorId', 'HistoricoGestionexpedidor', 'gestionExpedidorId', ['alias' => 'HistoricoGestionexpedidor']);
        $this->belongsTo('ventaId', '\Venta', 'ventaId', ['alias' => 'Venta']);
        $this->belongsTo('usuarioid', '\Usuario', 'usuarioId', ['alias' => 'Usuario']);
        $this->belongsTo('criterioPresupuesto', '\Criterio', 'criterioId', ['alias' => 'Criterio']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'gestionexpedidor';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Gestionexpedidor[]|Gestionexpedidor|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Gestionexpedidor|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function getListadoExpedidor($fechaInicial,$fechaFinal){
               
                /*$consulta = "SELECT producto.productoId AS productoId, ventaId AS Id, venta.fechaEntrega AS fecha,ciudad.nombre AS ciudad ,
                producto.nombre AS Tipo, tipoventa.placa AS placa,tipoventa.cedulaCliente AS cedula                
                FROM venta
                
                INNER jOIN ciudad on ciudad.ciudadId =  venta.ciudadId
                INNER jOIN producto on venta.productoId = producto.productoId
                INNER jOIN tipoventa on venta.tipoVenta_Id = tipoventa.tipoVenta_Id
                WHERE DATE_FORMAT(fechaentrega,'%Y/%m/%d') BETWEEN date('$fechaInicial') AND date('$fechaFinal')
                AND ventaId NOT IN (select ventaId from gestionexpedidor)";*/
        $consulta = "SELECT producto.productoId AS productoId, venta.ventaId AS Id, venta.fechaEntrega AS fecha,ciudad.nombre AS ciudad ,
        producto.nombre AS Tipo, tipoventa.placa AS placa,tipoventa.cedulaCliente AS cedula,
        t.nombre, t.tipificacionId, '' poliza
        FROM venta 
        INNER jOIN ciudad on ciudad.ciudadId =  venta.ciudadId
        INNER jOIN producto on venta.productoId = producto.productoId
        INNER jOIN tipoventa on venta.tipoVenta_Id = tipoventa.tipoVenta_Id
        INNER JOIN tipificacion t on t.tipificacionId = venta.tipificacionId
        WHERE venta.ventaId NOT IN (select ventaId from gestionexpedidor)
        AND DATE_FORMAT(fechaentrega,'%Y/%m/%d') BETWEEN date('$fechaInicial') AND date('$fechaFinal')           
        AND t.tipificacionId IN (1,2,3) AND ventaId not in (select ventaId from gestionexpedidor)
        UNION
        SELECT producto.productoId AS productoId, venta.ventaId AS Id, venta.fechaEntrega AS fecha,ciudad.nombre AS ciudad ,
        producto.nombre AS Tipo, tipoventa.placa AS placa,tipoventa.cedulaCliente AS cedula,
        t.nombre, t.tipificacionId, ge.poliza poliza
        FROM venta 
        INNER jOIN ciudad on ciudad.ciudadId =  venta.ciudadId
        INNER jOIN producto on venta.productoId = producto.productoId
        INNER jOIN tipoventa on venta.tipoVenta_Id = tipoventa.tipoVenta_Id
        INNER JOIN tipificacion t on t.tipificacionId = venta.tipificacionId
        INNER JOIN gestionexpedidor ge on ge.ventaId  = venta.ventaId
        WHERE venta.ventaId NOT IN (select ventaId from gestionexpedidor where tipificacionId in (1,5))
        AND DATE_FORMAT(fechaentrega,'%Y/%m/%d') BETWEEN date('$fechaInicial') AND date('$fechaFinal')           
        AND t.tipificacionId in (2,3);";
        //print_r($consulta);die;
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }
    public function ejecutaProcedimientos(){
        $consulta1="call get_clientes();";        
        $consulta2="call get_tipoventa();";        
        $consulta3="call get_venta();";        
        $result = array();
        try{
            $prepare1 = $this->getDi()->getShared("db")->prepare($consulta1);
            $prepare1->execute();            
            $prepare2 = $this->getDi()->getShared("db")->prepare($consulta2);
            $prepare2->execute();
            $prepare3 = $this->getDi()->getShared("db")->prepare($consulta3);
            $prepare3->execute();            
            array_push($result, $prepare1, $prepare2, $prepare3);
            return $result;
            
        }catch(Exception $e){
            return $e;
        }

        
        
    }
    
}
