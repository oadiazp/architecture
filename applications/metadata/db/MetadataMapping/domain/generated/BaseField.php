<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseField extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('field'); 
       $this->hasColumn('idfield', 'numeric', null, array('notnull' => true, 'primary' => true, 'sequence' => 'mod_metadata.seq_field')); 
       $this->hasColumn('idtable', 'numeric', null, array('notnull' => true, 'primary' => false)); 
       $this->hasColumn('field', 'character varying', 50 , array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('length', 'numeric', null, array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

