<?php 
class Usuario extends BaseUsuario
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasMany('RolesUsuariosEntidades', array('local'=>'idusuario','foreign'=>'idusuario')); 
         $this->hasMany('Traza', array('local'=>'idusuario','foreign'=>'idusuario')); 

    } 
 
 
}//fin clase


