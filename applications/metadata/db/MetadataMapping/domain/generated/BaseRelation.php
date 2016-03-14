<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseRelation extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('relation'); 
       $this->hasColumn('idrelation', 'numeric', null, array('notnull' => true, 'primary' => true)); 
       $this->hasColumn('source_field', 'numeric', null, array('notnull' => true, 'primary' => false)); 
       $this->hasColumn('target_field', 'numeric', null, array('notnull' => true, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

