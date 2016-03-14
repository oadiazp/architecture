<?php 
class Usuario extends BaseUsuario
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasMany('Rol', array('local'=>'idusuario','foreign'=>'idrol', 'refClass' => 'RolesUsuariosEntidades')); 
		 $this->hasMany('Entidad', array('local'=>'idusuario','foreign'=>'identidad', 'refClass' => 'RolesUsuariosEntidades')); 
         $this->hasMany('Traza', array('local'=>'idusuario','foreign'=>'idusuario')); 

    } 
 
 
}//fin clase


