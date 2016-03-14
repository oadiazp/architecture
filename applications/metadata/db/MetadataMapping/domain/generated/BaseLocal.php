<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseLocal extends Combobox 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('local'); 
       $this->hasColumn('idcomponent', 'numeric', null, array('notnull' => true, 'primary' => true)); 
       $this->hasColumn('idoption', 'numeric', null, array('notnull' => true, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

