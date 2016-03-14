<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseAplicacion extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('aplicacion'); 
       $this->hasColumn('idaplicacion', 'numeric', null, array('notnull' => true, 'primary' => true, 'sequence' => 'mod_admin.seq_aplicacion')); 
       $this->hasColumn('aplicacion', 'character varying', 50 , array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

