<?php 
class Field extends BaseField
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasMany('Component', array('local'=>'idfield','foreign'=>'idfield')); 
         $this->hasOne('Table', array('local'=>'idtable','foreign'=>'idtable')); 
         $this->hasMany('Relation', array('local'=>'idfield','foreign'=>'target_field')); 
         $this->hasMany('Relation', array('local'=>'idfield','foreign'=>'source_field')); 
         $this->hasMany('Remote', array('local'=>'idfield','foreign'=>'idfield')); 

    } 
 
 
}//fin clase


