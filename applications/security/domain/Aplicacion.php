<?php 
class Aplicacion extends BaseAplicacion
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasMany('Modulo', array('local'=>'idaplicacion','foreign'=>'idaplicacion')); 

    } 
 
 
}//fin clase


