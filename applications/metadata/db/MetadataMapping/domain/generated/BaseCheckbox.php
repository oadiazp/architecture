<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseCheckbox extends Component 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('checkbox'); 
       $this->hasColumn('idcomponent', 'numeric', null, array('notnull' => true, 'primary' => false)); 
       $this->hasColumn('box_label', 'character varying', 50 , array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

