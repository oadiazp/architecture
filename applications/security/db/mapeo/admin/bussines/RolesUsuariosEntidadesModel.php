<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
class RolesUsuariosEntidadesModel extends ZendExt_Model 
 { 
   public function init() 
    { 
        parent::ZendExt_Model(); 
    } 
 
   public function Guardar($RolesUsuariosEntidades) 
    { 
            $RolesUsuariosEntidades->save();
    } 
 
   public function Eliminar($RolesUsuariosEntidades) 
    { 
            $RolesUsuariosEntidades->delete();
    } 
 }

