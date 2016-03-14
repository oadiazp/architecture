<?php 
class Rol extends BaseRol
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasMany('Funcionalidad', array('local'=>'idrol','foreign'=>'idfuncionalidad', 'refClass'=>'RolesFuncionalidades')); 
         $this->hasMany('Usuario', array('local'=>'idrol','foreign'=>'idusuario', 'refClass'=>'RolesUsuariosEntidades')); 
         $this->hasMany('Entidad', array('local'=>'idrol','foreign'=>'identidad', 'refClass'=>'RolesUsuariosEntidades')); 

    } 
 
 
}//fin clase


