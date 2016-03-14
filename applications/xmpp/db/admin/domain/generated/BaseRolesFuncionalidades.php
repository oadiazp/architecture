<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseRolesFuncionalidades extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('roles_funcionalidades'); 
       $this->hasColumn('idfuncionalidad', 'numeric', null, array('notnull' => true, 'primary' => true)); 
       $this->hasColumn('idrol', 'numeric', null, array('notnull' => true, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

