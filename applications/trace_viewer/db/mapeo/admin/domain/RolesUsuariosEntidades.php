<?php 
class RolesUsuariosEntidades extends BaseRolesUsuariosEntidades
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasOne('Rol', array('local'=>'idrol','foreign'=>'idrol')); 
         $this->hasOne('Usuario', array('local'=>'idusuario','foreign'=>'idusuario')); 

    } 
 
 
}//fin clase


