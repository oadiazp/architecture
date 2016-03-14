<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseCombobox extends Component 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('combobox'); 
       $this->hasColumn('value_field', 'character varying', 50 , array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('idcomponent', 'numeric', null, array('notnull' => true, 'primary' => false)); 
       $this->hasColumn('display_field', 'character varying', 50 , array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

