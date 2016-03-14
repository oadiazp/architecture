<?php 
/* 
* Esta clase ha sido generada por Doctrine Generator 
*/ 
class RolesFuncionalidadesModel extends ZendExt_Model 
 { 
   public function init() 
    { 
        parent::ZendExt_Model(); 
    } 
 
   public function Guardar($RolesFuncionalidades) 
    { 
            $RolesFuncionalidades->save();
    } 
 
   public function Eliminar($RolesFuncionalidades) 
    { 
            $RolesFuncionalidades->delete();
    } 
 }

