<?php 
class Component extends BaseComponent
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasOne('Field', array('local'=>'idfield','foreign'=>'idfield')); 
         $this->hasOne('Type', array('local'=>'idtype','foreign'=>'idtype')); 

    } 
 
 
}//fin clase


