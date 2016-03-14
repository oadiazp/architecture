<?php
    class Url_mdl extends Model {
        function Url_mdl () {
            parent :: Model ();
        }
        
        function cargar ($pFunc, $pStart, $pLimit) {
            $q = Doctrine_Query :: create();

            $q->from ('Direccion u')
              ->where ('u.idfuncionalidad = ?', $pFunc)
              ->offset($pStart)->limit($pLimit)
              ->setHydrationMode(Doctrine::HYDRATE_SCALAR);

            return $q->execute ();
        }

        function contar ($pIdFuncs) {
            $q = Doctrine_Query :: create();

            $q->select ('COUNT(idfuncionalidad) as cant')
              ->from ('Direccion u')
              ->where ('u.idfuncionalidad = ?', $pIdFuncs);

            return $q->execute ()->getFirst()->cant;
        }

        function adicionar ($pFunc, $pUrl, $pPrincipal) {
            $direccion = new Direccion();
            $direccion->idfuncionalidad = $pFunc;
            $direccion->url = $pUrl;
			$direccion->principal = $pPrincipal;
            $direccion->save ();
        }

        function modificar ($pId, $pUrl, $pPrincipal) {
            $url = Doctrine::getTable('Direccion')->find($pId);
            $url->url = $pUrl;
			$url->principal = $pPrincipal;
            $url->save ();
        }

        function eliminar ($pId) {
            $url = Doctrine::getTable('Direccion')->find($pId);
            $url->delete ();
        }
    }
?>
