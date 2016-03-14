<?php
class Access_mdl extends Model {
    function Access_mdl () {
        parent :: Model ();
    }

    function load ($pIdParent, $pRol, $pEntidad) {
        $result = array ();
        $children_modules = Doctrine :: getTable ('Modulo')->find ($pIdParent)->getNode ()->getChildren ();
                       
        if ($children_modules)
            foreach ($children_modules as $child) {
                $item->text = $child->modulo;
                $item->id = $child->idmodulo;

                $result[] = $item; $item = null;
            }

        $children_funcs = Doctrine :: getTable('Modulo')->find ($pIdParent)->Funcionalidad;

        if ($children_funcs)
            foreach ($children_funcs as $child) {
                $item->text = $child->funcionalidad;
                $item->id = "f{$child->idfuncionalidad}";
                $item->leaf = true;
                $item->checked = $this->get_access($child->idfuncionalidad, $pRol, $pEntidad);

                $result[] = $item; $item = null;
            }

        return $result;
    }

    function get_access ($pId, $pRol, $pEntidad) {
        $q = Doctrine_Query::create();
        return $q->select('count(idrol) as cant')->from ('RolesFuncionalidades rf, rf.Rol r, r.RolesUsuariosEntidades rue')
                 ->where('rf.idrol = ? and rf.idfuncionalidad = ? and rue.identidad = ?', array ($pRol, $pId, $pEntidad))
                 ->execute ()->getFirst()->cant > 0;
    }

    function roots ($pApp) {
        $q = Doctrine_Query :: create ();
        $q->select ('m.idmodulo as id, m.modulo as text')
          ->from ('Modulo m')->where ('m.idaplicacion = ?', $pApp);

        $tree = Doctrine :: getTable ('Modulo')->getTree ();
        $tree->setBaseQuery ($q);
        return $tree->fetchRoots ()->toArray ();
    }

    function check ($pRol, $pFunc, $pStatus) {
//        debug (array  ($pFunc, $pRol));
        if ($pStatus == 'true') {
            $roles_funcs = new RolesFuncionalidades ();
            $roles_funcs->idfuncionalidad = $pFunc;
            $roles_funcs->idrol = $pRol;
            $roles_funcs->save ();
        } else {
            $q = Doctrine_Query::create();
            $q->from ('RolesFuncionalidades rf')
               ->where('rf.idrol = ? and rf.idfuncionalidad = ?', array ($pRol, $pFunc))
               ->execute ()->delete();
        }
    }
}
?>