<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
class RolModel extends ZendExt_Model 
 { 
   public function init() 
    { 
        parent::ZendExt_Model(); 
    } 
 
   public function Guardar($Rol) 
    { 
            $Rol->save();
    } 
 
   public function Eliminar($Rol) 
    { 
            $Rol->delete();
    } 
 }

