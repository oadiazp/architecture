<?php 
class Type extends BaseType
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasMany('Component', array('local'=>'idtype','foreign'=>'idtype')); 

    } 
 
 
}//fin clase


