<?php 
class Relation extends BaseRelation
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasOne('Field', array('local'=>'target_field','foreign'=>'idfield')); 

    } 
 
 
}//fin clase


