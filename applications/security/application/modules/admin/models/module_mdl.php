<?php
    class Module_mdl extends MY_Model {
        function Module_mdl () {
                parent :: MY_Model();
        }

        function load ($pIdParent) {
                $children = Doctrine :: getTable ('Modulo')->find ($pIdParent)->getNode()->getChildren ();

                $result = array ();
                if ($children)
                    foreach ($children as $child) {
                        $item->text = $child->modulo;
                        $item->id = $child->idmodulo;
                        $result[] = $item; $item = null;
                    }

                return $result;
           }

    function roots ($pApp) {
        $q = Doctrine_Query :: create ();
        $q->select ('m.idmodulo as id, m.modulo as text')->from ('Modulo m')->where ('m.idaplicacion = ?', $pApp);

        $tree = Doctrine :: getTable ('Modulo')->getTree ();
        $tree->setBaseQuery ($q);
        return $tree->fetchRoots ()->toArray ();
    }

        function adicionar ($pParent, $pModulo, $pApp) {
            $child = new Modulo ();
            $child->modulo = $pModulo;
            $child->idaplicacion = $pApp;

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
           $module->getNode ()->delete ();
        }
    }
 ?>