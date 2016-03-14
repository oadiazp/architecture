<?php 
class Remote extends BaseRemote
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasOne('Field', array('local'=>'idfield','foreign'=>'idfield')); 

    } 
 
 
}//fin clase


