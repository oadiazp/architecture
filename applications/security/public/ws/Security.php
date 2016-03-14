<?php
    include 'config_doctrine.php';
    include 'Zend/Soap/AutoDiscover.php';
    include 'Zend/Soap/Server.php';
    include 'Zend/Soap/Wsdl/Strategy/ArrayOfTypeSequence.php';

    class CAplicacion {
        /**
         *
         * @var int
         */
        var $idAplicacion;

        /**
         *
         * @var string
         */
        var $aplicacion;
    }

    class CModulo {
        /**
         *
         * @var int
         */
        var $idModulo;

        /**
         *
         * @var string
         */
        var $modulo;
    }

    class CFuncionalidad {
        /**
         *
         * @var int
         */
        var $idFuncionalidad;

        /**
         *
         * @var string
         */
        var $funcionalidad;

        /**
         *
         * @var int
         */
        var $alto;

        /**
         *
         * @var int
         */
        var $ancho;

        /**
         *
         * @var boolean
         */
        var $menu;
    }

    class CUrl {
        /**
         *
         * @var int
         */
        var $idUrl;

        /**
         *
         * @var string
         */
        var $url;
    }

    class CUsuario {
        /**
         *
         * @var string
         */
        var $usuario;

        /**
         *
         * @var string
         */
        var $password;

        /**
         *
         * @var string
         */
        var $correo;
    }

    class CEntidad {
        /**
         *
         * @var int
         */
        var $idEntidad;

        /**
         *
         * @var string
         */
        var $entidad;
    }

    class CToken {
        var $usuario;
        var $password;
        var $entidad;
		
		public function __construct ($pUsuario, $pPassword, $pIdEntidad) {
			$this->usuario = $pUsuario;
			$this->password = $pPassword;
			$this->entidad = $pIdEntidad;
		}

        public function  __toString() {
            $date = date ('d/m/Y h:i:s');
            return base64_encode("{$this->usuario}/{$this->password}/{$this->entidad}/$date");
        }
        public static function parse ($pString) {
            $parts = explode('/', base64_decode($pString));
            return new CToken ($parts [0], $parts [1], $parts [2]);
        }
    }

    class Security {
        /**
         *
         * @param string $pUsuario
         * @param string $pPassword
         * @param int $pIdEntidad
         * @return string
         */
        public function autenticarUsuario ($pUsuario, $pPassword, $pIdEntidad) {
            $q = Doctrine_Query :: create();
            $cant = $q->select ('COUNT(u.idusuario) as cantidad')
                      ->from ('Usuario u, u.Entidad e')
                      ->where ('u.usuario = ? and u.passwd = ? and e.identidad = ?', array ($pUsuario, base64_encode($pPassword), $pIdEntidad))
                      ->execute ()->getFirst ()->cantidad;

            if ($cant > 0) {
                $result = $q->from ('Usuario u, u.Entidad e')
                            ->where ('u.usuario = ? and u.passwd = ? and e.identidad = ?', array ($pUsuario, base64_encode($pPassword), $pIdEntidad))
                            ->execute ()->getFirst ();

                $token = new CToken($pUsuario, base64_encode ($pPassword), $pIdEntidad);
                return $token->__toString();
            } else return "0";
        }

        /**
         *
         * @param string $pToken
         * @return CAplicacion[]
         */
        public function obtenerAplicacionesDadoToken ($pToken) {
            $token = CToken::parse($pToken);

            $q = Doctrine_Query::create();
            $result = $q->select ('a.idaplicacion, a.aplicacion')
                        ->from ('Aplicacion a, a.Modulo m, m.Funcionalidad f, f.Rol r, r.Entidad e, r.Usuario u')
                        ->where ('u.usuario = ? and u.passwd = ? and e.identidad = ?', array ($token->usuario, $token->password, $token->entidad))
                        ->orderBy('a.idaplicacion', 'ASC')
                        ->setHydrationMode(Doctrine::HYDRATE_RECORD)
                        ->execute ();

            $array = array ();

            foreach ($result as $app) {
                $a = new CAplicacion();
                $a->idAplicacion = $app->idaplicacion;
                $a->aplicacion = $app->aplicacion;
                $array [] = $a;
            }

            return $array;
        }

        /**
         *
         * @param int $pIdAplicacion
         * @param string $pToken
         * @return CModulo[]
         */
        public function obtenerModulosDadoIdAplicacionYToken ($pIdAplicacion, $pToken) {
            $token = CToken::parse($pToken);
            
            $q = Doctrine_Query::create();
            $result = $q->select ('m.idmodulo, a.modulo')
                        ->from ('Modulo m, m.Funcionalidad f, f.Rol r, r.Entidad e, r.Usuario u')
                        ->where ('m.idaplicacion = ? and u.usuario = ? and u.passwd = ? and e.identidad = ?', array ($pIdAplicacion, $token->usuario, $token->password, $token->entidad))
                        ->orderBy('m.idmodulo', 'ASC')
                        ->setHydrationMode(Doctrine::HYDRATE_RECORD)
                        ->execute ();

            $array = array ();

            foreach ($result as $app) {
                $a = new CModulo();
                $a->idModulo= $app->idmodulo;
                $a->modulo = $app->modulo;
                $array [] = $a;
            }

            return $array;
        }

        /**
         *
         * @param int $pIdModulo
         * @param string $pToken
         * @return CFuncionalidad[]
         */
        public function obtenerFuncionalidadesDadoIdModuloYToken ($pIdModulo, $pToken)  {
            $token = CToken::parse($pToken);
			
            $q = Doctrine_Query::create();
            $result = $q->select ('f.idfuncionalidad, f.funcionalidad, f.menu, f.alto, f.ancho')
                        ->from ('Funcionalidad f, f.Rol r, r.Entidad e, r.Usuario u')
                        ->where ('f.idmodulo = ? and u.usuario = ? and u.passwd = ? and e.identidad = ?', array ($pIdModulo, $token->usuario, $token->password, $token->entidad))
                        ->orderBy('f.idfuncionalidad', 'ASC')
                        ->setHydrationMode(Doctrine::HYDRATE_RECORD)
                        ->execute ();

            $array = array ();

            foreach ($result as $app) {
                $a = new CFuncionalidad();
                $a->idFuncionalidad= $app->idfuncionalidad;
                $a->funcionalidad = $app->funcionalidad;
                $a->menu = $app->menu;
                $a->alto = $app->alto;
                $a->ancho = $app->ancho;
                
                $array [] = $a;
            }

            return $array;
        }

        /**
         *
         * @param int $pIdFuncionalidad
         * @param CToken $pToken
         * @return CUrl[]
         */
        public function obtenerUrlsDadoIdFuncionalidadYToken ($pIdFuncionalidad, $pToken) {
            $token = CToken::parse($pToken);
            
            $q = Doctrine_Query::create();
            $result = $q->select ('url.idurl, url.url')
                        ->from ('Direccion url, url.Funcionalidad f, f.Rol r, r.Entidad e, r.Usuario u')
                        ->where ('url.idfuncionalidad = ? and u.usuario = ? and u.passwd = ? and e.identidad = ?', array ($pIdFuncionalidad, $token->usuario, $token->password, $token->entidad))
                        ->orderBy('url.idurl', 'ASC')
                        ->setHydrationMode(Doctrine::HYDRATE_RECORD)
                        ->execute ();

            $array = array ();

            foreach ($result as $app) {
                $a = new CUrl();
                $a->idUrl= $app->idurl;
                $a->url = $app->url;
                
                $array [] = $a;
            }

            return $array;
        }

        /**
         * @return CEntidad[]
         */
        public function obtenerEntidades () {
            $q = Doctrine_Query :: create ();
            $q->select ('m.entidad, m.entidad')->from ('Entidad m');

            $tree = Doctrine :: getTable ('Entidad')->getTree ();
            $tree->setBaseQuery ($q);
            $result = $tree->fetchRoots ();

            $array = array ();

            foreach ($result as $value) {
                $m = new CEntidad();
                $m->idEntidad = $value->identidad;
                $m->entidad = $value->entidad;

                $array[] = $m;
            }

            return $array;
        }

        /**
         *
         * @param int $pIdEntidad
         * @return CEntidad[]
         */
        public function obtenerEntidadesSubordinadasDadoIdEntidad ($pIdEntidad) {
            $entidades = Doctrine::getTable ('Entidad')->find ($pIdEntidad)->getNode()->getChildren ();

            $array = array ();

            foreach ($entidades as $entidad) {
                $e = new CEntidad();
                $e->idEntidad = $entidad->identidad;
                $e->entidad = $entidad->entidad;

                $array[] = $e;
            }
            
            return $array;
        }

        /**
         *
         * @param string $pEntidad
         * @return int
         */
        public function obtenerIdEntidadDadoEntidad ($pEntidad) {
            return Doctrine :: getTable ('Entidad')->findOneByEntidad ($pEntidad)->identidad;
        }

        /**
         *
         * @param string $pAplicacion
         * @return int
         */
        public function obtenerIdAplicacionDadoAplicacion ($pAplicacion) {
            return Doctrine :: getTable ('Aplicacion')->findOneByAplicacion ($pAplicacion)->idaplicacion;
        }
		
        /**
         *
         * @param int $pIdFuncionalidad
         * @return string
         */
        public function obtenerUrlPrincipalDadoIdFuncionalidad ($pIdFuncionalidad) {
                return Doctrine :: getTable ('Direccion')->findOneByIdfuncionalidadAndPrincipal ($pIdFuncionalidad, 1)->url;
        }
    }
	
//  $token = Security :: autenticarUsuario ('oadiaz', 'a', 2);
//  echo '<pre>';
//  print_r (Security :: obtenerModulosDadoIdAplicacionYToken (14, $token));
//  die;

if (isset($_GET['wsdl'])) {
    $autodiscover = new Zend_Soap_AutoDiscover(new Zend_Soap_Wsdl_Strategy_ArrayOfTypeSequence ());
    ini_set("soap.wsdl_cache_enabled", 0);
    $autodiscover->setClass('Security');
    $autodiscover->handle();
} else {
    $server = new Zend_Soap_Server($config ['base_url'] . 'Security.php?wsdl');
    $server->setClass('Security');
    $server->handle();
}