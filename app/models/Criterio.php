<?php

class Criterio extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     * @Primary
     * @Identity
     * @Column(type="integer", length=11, nullable=false)
     */
    public $criterioId;

    /**
     *
     * @var integer
     * @Column(type="integer", length=11, nullable=false)
     */
    public $rolId;

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
        $this->setSource("criterio");
        $this->hasMany('criterioId', 'Gestionasignador', 'criterioAsignador', ['alias' => 'Gestionasignador']);
        $this->hasMany('criterioId', 'Gestionexpedidor', 'criterioPresupuesto', ['alias' => 'Gestionexpedidor']);
        $this->hasMany('criterioId', 'HistoricoCriterio', 'criterioId', ['alias' => 'HistoricoCriterio']);
        $this->belongsTo('rolId', '\Rol', 'rolId', ['alias' => 'Rol']);
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'criterio';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Criterio[]|Criterio|\Phalcon\Mvc\Model\ResultSetInterface
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Criterio|\Phalcon\Mvc\Model\ResultInterface
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function getCriterioAsignador(){
        $consulta = "SELECT c.criterioId, c.nombre
        FROM criterio c, rol r
        where r.rolid = c.rolId and r.rolid = 2;";
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }
public function getCriterioExpedidor(){
        $consulta = "SELECT c.criterioId, c.nombre
        FROM criterio c, rol r
        where r.rolid = c.rolId and r.rolid = 3;";
        $prepare = $this->getDi()->getShared("db")->prepare($consulta);
        $prepare->execute();
        return $prepare;
    }
}
