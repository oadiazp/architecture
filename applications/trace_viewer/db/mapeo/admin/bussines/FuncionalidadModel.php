<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
class FuncionalidadModel extends ZendExt_Model 
 { 
   public function init() 
    { 
        parent::ZendExt_Model(); 
    } 
 
   public function Guardar($Funcionalidad) 
    { 
            $Funcionalidad->save();
    } 
 
   public function Eliminar($Funcionalidad) 
    { 
            $Funcionalidad->delete();
    } 
 }

