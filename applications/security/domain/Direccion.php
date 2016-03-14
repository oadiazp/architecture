<?php 
class Direccion extends BaseDireccion
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasOne('Funcionalidad', array('local'=>'idfuncionalidad','foreign'=>'idfuncionalidad')); 

    } 
 
 
}//fin clase


