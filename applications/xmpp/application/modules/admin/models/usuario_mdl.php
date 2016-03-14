<?php
	class Usuario_mdl extends Model {
		function Usuario_mdl () {
			parent :: Model ();
		}
		
		function adicionar ($pUsuario, $pCorreo, $pPasswd, $pRol, $pEntidad) {
			$usuario = new Usuario ();
			$usuario->usuario = $pUsuario;
			$usuario->correo = $pCorreo;
			$usuario->passwd = base64_encode ($pPasswd);
			
			$usuario->save ();
			
			$rol = new RolesUsuariosEntidades ();
			$rol->idusuario = $usuario->idusuario;
			$rol->identidad = $pEntidad;
			$rol->idrol = $pRol;
			$rol->save ();
		}
		
		function cargar ($pLimit, $pStart) {
			$q = Doctrine_Query :: create ();
			return $q->select ('u.idusuario, u.usuario, u.correo, r.rol, r.idrol, e.entidad, e.identidad')
					 ->from ('Usuario u, u.Entidad e, u.Rol r')
					 ->setHydrationMode (Doctrine :: HYDRATE_SCALAR)
					 ->orderBy ('u.idusuario', 'ASC')
					 ->limit ($pLimit)->offset ($pStart)->execute ();
		}
		
		function modificar ($pUsuario, $pCorreo, $pPasswd, $pRol, $pEntidad, $pId) {
			$user = Doctrine :: getTable ('Usuario')->find ($pId);
					  
			$user->usuario = $pUsuario;
			$user->correo = $pCorreo;
			$user->passwd = $pPasswd;
			
			$roles_usuarios_entidades = $user->RolesUsuariosEntidades->getFirst ();
			
			$roles_usuarios_entidades->identidad = $pEntidad;
			$roles_usuarios_entidades->idrol = $pRol;
			
			$user->save ();
		}
		
		function contar () {
			$q = Doctrine_Query :: create ();
			return $q->select ('COUNT(u.idusuario) as cant')
					 ->from ('Usuario u')->execute ()->getFirst ()->cant;
		}
		
		function eliminar ($pId) {
			$user = Doctrine :: getTable ('Usuario')->find ($pId);
			$roles_usuarios_entidades = $user->RolesUsuariosEntidades->getFirst ();
			
			if ($roles_usuarios_entidades) 
				$roles_usuarios_entidades->delete ();
			$user->delete ();
		}
	}
?>