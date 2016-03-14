<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseFuncionalidad extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('funcionalidad'); 
       $this->hasColumn('idfuncionalidad', 'numeric', null, array('notnull' => true, 'primary' => true, 'sequence' => 'mod_admin.seq_funcionalidad')); 
       $this->hasColumn('url', 'character varying', 255 , array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('alto', 'integer', null, array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('idmodulo', 'numeric', null, array('notnull' => true, 'primary' => false)); 
       $this->hasColumn('menu', 'numeric', null, array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('ancho', 'integer', null, array('notnull' => false, 'primary' => false)); 
       $this->hasColumn('funcionalidad', 'character varying', 255 , array('notnull' => false, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

