<?php 
class Funcionalidad extends BaseFuncionalidad
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasOne('Modulo', array('local'=>'idmodulo','foreign'=>'idmodulo')); 
         $this->hasMany('Traza', array('local'=>'idfuncionalidad','foreign'=>'idfuncionalidad')); 
         $this->hasMany('Rol', array('local'=>'idfuncionalidad','foreign'=>'idrol', 'refClass'=>'RolesFuncionalidades')); 

    } 
 
 
}//fin clase


