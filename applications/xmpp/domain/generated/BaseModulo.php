<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseModulo extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('modulo'); 
       $this->hasColumn('idmodulo', 'numeric', null, array('notnull' => true, 'primary' => true, 'sequence' => 'mod_admin.seq_modulo')); 
       $this->hasColumn('modulo', 'character varying', 255 , array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('level', 'numeric', null, array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('rgt', 'numeric', null, array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('lft', 'numeric', null, array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('idraiz', 'numeric', null, array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

