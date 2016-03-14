<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseOption extends Component 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('option'); 
       $this->hasColumn('idoption', 'numeric', null, array('notnull' => true, 'primary' => true, 'sequence' => 'mod_metadata.seq_option')); 
       $this->hasColumn('idcomponent', 'numeric', null, array('notnull' => true, 'primary' => false)); 
       $this->hasColumn('option', 'character varying', 50 , array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

