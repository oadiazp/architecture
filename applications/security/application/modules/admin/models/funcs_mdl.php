<?php
class Funcs_mdl extends MY_Model {
    function Funcs_mdl () {
        parent :: MY_Model ();
    }

    function cargar ($pModule, $pLimit, $pStart) {
            $q = Doctrine_Query :: create ();
            return $q->from ('Funcionalidad f')
                     ->setHydrationMode (Doctrine :: HYDRATE_SCALAR)
                     ->where ('f.idmodulo = ?', $pModule)
                     ->orderBy ('f.idfuncionalidad', 'ASC')
                     ->limit ($pLimit)->offset ($pStart)->execute ();
    }

    function contar ($pModule) {
            $q = Doctrine_Query :: create ();
            return $q->select ('COUNT(f.idfuncionalidad) as cant')
					 ->where ('f.idmodulo = ?', $pModule)
                     ->from ('Funcionalidad f')->execute ()->getFirst ()->cant;
    }

    function adicionar ($pFuncionalidad, $pAncho, $pAlto, $pMenu, $pIdModulo) {
            $func = new Funcionalidad ();

            $func->funcionalidad = $pFuncionalidad;
            $func->ancho = $pAncho;
            $func->alto = $pAlto;
            $func->menu = $pMenu;
            $func->idmodulo = $pIdModulo;

            $func->save ();
    }

    function modificar ($pFuncionalidad, $pAncho, $pAlto, $pMenu, $pIdFuncionalidad) {
            $func = Doctrine :: getTable ('Funcionalidad')->find ($pIdFuncionalidad);

            $func->funcionalidad = $pFuncionalidad;
            $func->ancho = $pAncho;
            $func->alto = $pAlto;
            $func->menu = $pMenu;

            $func->save ();
    }

    function eliminar ($pIdFuncionalidad) {
        Doctrine :: getTable ('Funcionalidad')->find ($pIdFuncionalidad)->delete ();
    }
}
?>