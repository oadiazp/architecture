<?php 
class Textfield extends BaseTextfield
 { 
   public function setUp() 
    {   parent::setUp(); 
         $this->hasOne('Regex', array('local'=>'idregex','foreign'=>'idregex')); 

    } 
 
 
}//fin clase


