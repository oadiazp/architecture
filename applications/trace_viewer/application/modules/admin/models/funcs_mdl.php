  <?php
	class Funcs_mdl extends Model {
		function Funcs_mdl () {
			parent :: Model ();
		}
		
		function cargar ($pLimit, $pStart) {
			$q = Doctrine_Query :: create ();
			return $q->from ('Funcionalidad f')
					 ->setHydrationMode (Doctrine :: HYDRATE_SCALAR)
					 ->orderBy ('f.idfuncionalidad', 'ASC')
					 ->limit ($pLimit)->offset ($pStart)->execute ();
		}
		
		function contar () {
			$q = Doctrine_Query :: create ();
			return $q->select ('COUNT(f.idfuncionalidad) as cant')
					 ->from ('Funcionalidad f')->execute ()->getFirst ()->cant;
		}
		
		function adicionar ($pFuncionalidad, $pUrl, $pAncho, $pAlto, $pMenu, $pIdModulo) {
			$func = new Funcionalidad ();
			
			$func->funcionalidad = $pFuncionalidad;
			$func->url = $pUrl;
			$func->ancho = $pAncho;
			$func->alto = $pAlto;
			$func->menu = $pMenu;
			$func->idmodulo = $pIdModulo;
			
			$func->save ();
		}
		
		function modificar ($pFuncionalidad, $pUrl, $pAncho, $pAlto, $pMenu, $pIdFuncionalidad) {
			$func = Doctrine :: getTable ('Funcionalidad')->find ($pIdFuncionalidad);
			
			$func->funcionalidad = $pFuncionalidad;
			$func->url = $pUrl;
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