<?php 
class Local extends BaseLocal
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasOne('Option', array('local'=>'idoption','foreign'=>'idoption')); 

    } 
 
 
}//fin clase


