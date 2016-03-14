<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseTraza extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('traza'); 
       $this->hasColumn('idusuario', 'numeric', null, array('notnull' => true, 'primary' => false)); 
       $this->hasColumn('fecha', 'date', null, array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('ip', 'character varying', 20 , array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('idfuncionalidad', 'numeric', null, array('notnull' => true, 'primary' => false)); 
       $this->hasColumn('hora', 'time without time zone', null, array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

