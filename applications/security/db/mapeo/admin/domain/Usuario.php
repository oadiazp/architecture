<?php 
class Usuario extends BaseUsuario
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasMany('Traza', array('local'=>'idusuario','foreign'=>'idusuario')); 
         $this->hasMany('Rol', array('local'=>'idusuario','foreign'=>'idrol', 'refClass'=>'RolesUsuariosEntidades')); 

    } 
 
 
}//fin clase


