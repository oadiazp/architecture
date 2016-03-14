<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseRemote extends Combobox 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('remote'); 
       $this->hasColumn('idcomponent', 'numeric', null, array('notnull' => true, 'primary' => true)); 
       $this->hasColumn('idfield', 'numeric', null, array('notnull' => true, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

