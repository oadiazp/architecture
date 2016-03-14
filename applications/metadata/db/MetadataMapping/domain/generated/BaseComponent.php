<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseComponent extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('component'); 
       $this->hasColumn('idcomponent', 'numeric', null, array('notnull' => true, 'primary' => true, 'sequence' => 'mod_metadata.seq_component')); 
       $this->hasColumn('idtype', 'numeric', null, array('notnull' => true, 'primary' => false)); 
       $this->hasColumn('idfield', 'numeric', null, array('notnull' => true, 'primary' => false)); 
       $this->hasColumn('field_label', 'character varying', 50 , array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

