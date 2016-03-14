<?php 
class Regex extends BaseRegex
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasMany('Textfield', array('local'=>'idregex','foreign'=>'idregex')); 

    } 
 
 
}//fin clase


