<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
class UsuarioModel extends ZendExt_Model 
 { 
   public function init() 
    { 
        parent::ZendExt_Model(); 
    } 
 
   public function Guardar($Usuario) 
    { 
            $Usuario->save();
    } 
 
   public function Eliminar($Usuario) 
    { 
            $Usuario->delete();
    } 
 }

