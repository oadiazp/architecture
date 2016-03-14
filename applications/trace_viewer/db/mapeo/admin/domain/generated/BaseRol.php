<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseRol extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('rol'); 
       $this->hasColumn('idrol', 'numeric', null, array('notnull' => true, 'primary' => true, 'sequence' => 'mod_admin.seq_rol')); 
       $this->hasColumn('rol', 'character varying', 255 , array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

