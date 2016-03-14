<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseDireccion extends Doctrine_Record
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('direccion');
       $this->hasColumn('url', 'character varying', 255 , array('notnull' => false, 'primary' => false));
       $this->hasColumn('idfuncionalidad', 'numeric', null, array('notnull' => true, 'primary' => false));
	   $this->hasColumn('principal', 'numeric', null, array('notnull' => true, 'primary' => false));
       $this->hasColumn('idurl', 'numeric', null, array('sequence' => 'mod_admin.seq_url', 'notnull' => true, 'primary' => true));
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

