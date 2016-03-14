<?php
	class Access_mdl extends Model {
		function Access_mdl () {
			parent :: Model ();
		}
		
		function load ($pIdParent, $pRol) {
			$children = Doctrine :: getTable ('Modulo')->find ($pIdParent)->getNode ()->getChildren ();
			
			$result = array ();
			if ($children) 
				foreach ($children as $child) {
					$item->text = $child->modulo;
					$item->id = $child->idmodulo;
					$result[] = $item; $item = null;
		
					$funcs = Doctrine :: getTable ('Modulo')->find ($pIdParent)->Funcionalidad;
					if ($funcs) {
						foreach ($funcs as $func) {
							$item->id = "f{$func->idfuncionalidad}";
							$item->text = $func->funcionalidad;
							$item->leaf = true;
							$item->checked = $this->get_access ($func->idfuncionalidad, $pRol);
							$result[] = $item;
						}
					}
				}
				
			return $result;
        }
		
		function get_access ($pId, $pRol) {
			$temp = Doctrine :: getTable ('RolesFuncionalidades')->findOneByIdRolAndIdFuncionalidad ($pRol, $pId);
			return $temp != null;
		}
		
		function check ($pRol, $pFunc, $pStatus) {
			if ($pStatus) {
				$roles_funcs = new RolesFuncionalidades ();
				$roles_funcs->idfuncionalidad = $pFunc;
				$roles_funcs->idrol = $pRol;
				$roles_funcs->save ();
			} else {
				Doctrine :: getTable ('RolesFuncionalidades')->findOneByIdRolAndIdFuncionalidad ($pRol, $pFunc)->delete ();
			}
		}
		
		function roots ($pRol) {
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