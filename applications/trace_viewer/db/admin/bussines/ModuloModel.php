<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
class ModuloModel extends ZendExt_Model 
 { 
   public function init() 
    { 
        parent::ZendExt_Model(); 
    } 
 
   public function Guardar($Modulo) 
    { 
            $Modulo->save();
    } 
 
   public function Eliminar($Modulo) 
    { 
            $Modulo->delete();
    } 
 }

