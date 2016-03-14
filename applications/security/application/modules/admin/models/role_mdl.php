<?php
	class Role_mdl extends MY_Model {
		function Role_mdl () {
			parent :: MY_Model ();
		}
		
		function cargar () {
			return Doctrine :: getTable ('Rol')->findAll ()->toArray ();
		}
		
		function contar () {
			$q = Doctrine_Query :: create ();
			return $q->select ('count(idrol) as cant')->from ('Rol')->execute ()->getFirst ()->cant;
		}
		
		function adicionar ($pRol) {
			$rol = new Rol ();
			$rol->rol = $pRol;
			
			$rol->save ();
		}
		
		function modificar ($pId, $pRol) {
			$rol = Doctrine :: getTable ('Rol')->find ($pId);
			
			$rol->rol = $pRol;
			$rol->save ();
		}
		
		function eliminar ($pId) {
                    $q = Doctrine_Query :: create ();
                    Doctrine :: getTable ('Rol')->find ($pId)->delete ();
		}
	}
?>