<?php 
class Modulo extends BaseModulo
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasMany('Funcionalidad', array('local'=>'idmodulo','foreign'=>'idmodulo')); 
         $this->hasOne('Aplicacion', array('local'=>'idaplicacion','foreign'=>'idaplicacion')); 
         $this->actAs ('NestedSet', array ('hasManyRoots' => true, 'rootColumnName' => 'idraiz')); 

    } 
 
 
}//fin clase


