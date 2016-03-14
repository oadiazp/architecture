<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseType extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('type'); 
       $this->hasColumn('idtype', 'numeric', null, array('notnull' => true, 'primary' => true, 'sequence' => 'mod_metadata.seq_type')); 
       $this->hasColumn('type', 'character varying', 50 , array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('table', 'character varying', 50 , array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

