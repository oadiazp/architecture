<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
class EntidadModel extends ZendExt_Model 
 { 
   public function init() 
    { 
        parent::ZendExt_Model(); 
    } 
 
   public function Guardar($Entidad) 
    { 
            $Entidad->save();
    } 
 
   public function Eliminar($Entidad) 
    { 
            $Entidad->delete();
    } 
 }

