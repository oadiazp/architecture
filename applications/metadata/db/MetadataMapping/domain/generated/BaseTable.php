<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseTable extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('table'); 
       $this->hasColumn('idtable', 'numeric', null, array('notnull' => true, 'primary' => true, 'sequence' => 'mod_metadata.seq_table')); 
       $this->hasColumn('table', 'character varying', 50 , array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('schema', 'character varying', 50 , array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

