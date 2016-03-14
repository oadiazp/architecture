<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
class TrazaModel extends ZendExt_Model 
 { 
   public function init() 
    { 
        parent::ZendExt_Model(); 
    } 
 
   public function Guardar($Traza) 
    { 
            $Traza->save();
    } 
 
   public function Eliminar($Traza) 
    { 
            $Traza->delete();
    } 
 }

