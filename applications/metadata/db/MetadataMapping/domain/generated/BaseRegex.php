<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseRegex extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('regex'); 
       $this->hasColumn('idregex', 'numeric', null, array('notnull' => true, 'primary' => true, 'sequence' => 'mod_metadata.seq_regex')); 
       $this->hasColumn('regex', 'character varying', 255 , array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('denominacion', 'character varying', 50 , array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

