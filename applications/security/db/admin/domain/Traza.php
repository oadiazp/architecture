<?php 
class Traza extends BaseTraza
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasOne('Funcionalidad', array('local'=>'idfuncionalidad','foreign'=>'idfuncionalidad')); 
         $this->hasOne('Usuario', array('local'=>'idusuario','foreign'=>'idusuario')); 

    } 
 
 
}//fin clase


