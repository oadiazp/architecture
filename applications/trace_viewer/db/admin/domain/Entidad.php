<?php 
class Entidad extends BaseEntidad
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasMany('Rol', array('local'=>'identidad','foreign'=>'idrol', 'refClass'=>'RolesUsuariosEntidades')); 
         $this->hasMany('Usuario', array('local'=>'identidad','foreign'=>'idusuario', 'refClass'=>'RolesUsuariosEntidades')); 
         $this->actAs ('NestedSet', array ('hasManyRoots' => true, 'rootColumnName' => 'idraiz')); 

    } 
 
 
}//fin clase


