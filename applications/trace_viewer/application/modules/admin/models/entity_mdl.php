<?php
	class Entity_mdl extends Model {
		function Entity_mdl () {
			parent :: Model ();
		}
		
		function load ($pIdParent) {
			$children = Doctrine :: getTable ('Entidad')->find ($pIdParent)->getNode ()->getChildren ();
			
			$result = array ();
			if ($children) 
				foreach ($children as $child) {
					$item->text = $child->entidad;
					$item->id = $child->identidad;
					$result[] = $item; $item = null;
				}
				
			return $result;
        }
		
		function roots () {
			$q = Doctrine_Query :: create ();
			$q->select ('e.identidad as id, e.entidad as text')->from ('Entidad e');
		
            $tree = Doctrine :: getTable ('Entidad')->getTree ();
			$tree->setBaseQuery ($q);
			return $tree->fetchRoots ()->toArray ();
        }
		
		function adicionar ($pParent, $pEntidad) {
			$child = new Entidad ();
			$child->entidad = $pEntidad;
			
			if ($pParent) {
				$parent = Doctrine :: getTable ('Entidad')->find ($pParent)->getNode ();
				$parent->addChild ($child);
			} else {
				$child->save ();
				Doctrine :: getTable ('Entidad')->getTree ()->createRoot ($child);
			}
		}
		
		function move ($pNode, $pParent) {
			$node = Doctrine :: getTable ('Entidad')->find ($pNode)->getNode ();
			$parent = Doctrine :: getTable ('Entidad')->find ($pParent);
			
			$node->moveAsLastChildOf ($parent);
		}		
		
		function modificar ($pId, $pEntidad) {
			$parent = Doctrine :: getTable ('Entidad')->find ($pId);
			$parent->entidad = $pEntidad;
			
			$parent->save ();
		}
		
		function eliminar ($pId) {
			$parent = Doctrine :: getTable ('Entidad')->find ($pId);
			
			$parent->RolesUsuariosEntidades->delete ();
			$parent->getNode ()->delete ();
		}
	}
?>