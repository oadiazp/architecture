<?php 
class RolesFuncionalidades extends BaseRolesFuncionalidades
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasOne('Funcionalidad', array('local'=>'idfuncionalidad','foreign'=>'idfuncionalidad')); 
         $this->hasOne('Rol', array('local'=>'idrol','foreign'=>'idrol')); 

    } 
 
 
}//fin clase


