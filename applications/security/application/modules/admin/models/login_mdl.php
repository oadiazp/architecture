<?php
    class Login_mdl extends Model {
        function Login_mdl () {
            parent::Model();
        }
        
        function login ($pUser, $pPasswd, $pEntidad) {
            $q = Doctrine_Query::create();

            return $q->select ('count(idusuario) as cant')
                     ->from('Usuario u, u.RolesUsuariosEntidades rue')
                     ->where ('u.usuario = ? and u.passwd = ? and rue.identidad = ?', array ($pUser,  base64_encode($pPasswd), $pEntidad))
                     ->execute ()->getFirst()->cant > 0;
        }
    }
?>
