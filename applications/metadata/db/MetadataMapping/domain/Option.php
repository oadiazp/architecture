<?php 
class Option extends BaseOption
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasMany('Local', array('local'=>'idoption','foreign'=>'idoption')); 

    } 
 
 
}//fin clase


