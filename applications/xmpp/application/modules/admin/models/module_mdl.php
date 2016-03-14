<?php
	class Module_mdl extends Model {
		function Module_mdl () {
			parent :: Model ();
		}
		
		function load ($pIdParent) {
			$children = Doctrine :: getTable ('Modulo')->find ($pIdParent)->getNode ()->getChildren ();
			
			$result = array ();
			if ($children) 
				foreach ($children as $child) {
					$item->text = $child->modulo;
					$item->id = $child->idmodulo;
					$result[] = $item; $item = null;
				}
				
			return $result;
        }
		
		function roots () {
			$q = Doctrine_Query :: create ();
			$q->select ('e.idmodulo as id, e.modulo as text')->from ('Modulo e');
		
            $tree = Doctrine :: getTable ('Modulo')->getTree ();
			$tree->setBaseQuery ($q);
			return $tree->fetchRoots ()->toArray ();
        }
		
		function adicionar ($pParent, $pModulo) {
			$child = new Modulo ();
			$child->modulo = $pModulo;
			
			if ($pParent) {
				$parent = Doctrine :: getTable ('Modulo')->find ($pParent)->getNode ();
				$parent->addChild ($child);
			} else {
				$child->save ();
				Doctrine :: getTable ('Modulo')->getTree ()->createRoot ($child);
			}
		}
		
		function move ($pNode, $pParent) {
			$node = Doctrine :: getTable ('Modulo')->find ($pNode)->getNode ();
			$parent = Doctrine :: getTable ('Modulo')->find ($pParent);
			
			$node->moveAsLastChildOf ($parent);
		}		
		
		function modificar ($pId, $pModulo) {
			$parent = Doctrine :: getTable ('Modulo')->find ($pId);
			$parent->modulo = $pModulo;
			
			$parent->save ();
		}
		
		function eliminar ($pId) {
			$module = Doctrine :: getTable ('Modulo')->find ($pId);
			
			if (isset ($module->Funcionalidad)) 
				$module->Funcionalidad->delete ();
			
			$module->getNode ()->delete ();
		}
	}
?>