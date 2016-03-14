<?php 
class Table extends BaseTable
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasMany('Field', array('local'=>'idtable','foreign'=>'idtable')); 

    } 
 
 
}//fin clase


