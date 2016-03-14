<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseTextfield extends Component 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('textfield'); 
       $this->hasColumn('idcomponent', 'numeric', null, array('notnull' => true, 'primary' => true)); 
       $this->hasColumn('blank_text', 'character varying', 100 , array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('idregex', 'numeric', null, array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

