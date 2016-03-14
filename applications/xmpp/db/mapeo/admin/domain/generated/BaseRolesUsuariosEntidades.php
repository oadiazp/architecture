<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
abstract class BaseRolesUsuariosEntidades extends Doctrine_Record 
 { 
   public function setTableDefinition() 
    { 
       $this->setTableName('roles_usuarios_entidades'); 
       $this->hasColumn('identidad', 'numeric', null, array('notnull' => true, 'primary' => true)); 
       $this->hasColumn('idrol', 'numeric', null, array('notnull' => true, 'primary' => false)); 
       $this->hasColumn('idusuario', 'numeric', null, array('notnull' => true, 'primary' => false)); 
    } 
 
   public function Setup() 
    { 
       parent::setUp(); 
    } 
 }//fin clase

