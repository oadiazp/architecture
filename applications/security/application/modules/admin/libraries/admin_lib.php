<?php
    class Admin_lib {
        function delete_access ($pRol = null, $pIdFunc = null) {
            $q = Doctrine_Query :: create();
            $q->from ('RolesFuncionalidades rf');

            if ($pRol)
                $q->addWhere ('rf.idrol = ?', $pRol);

            if ($pIdFunc)
                $q->addWhere ('rf.idfuncionalidad = ?', $pIdFunc);

            $q->execute ()->delete ();
        }
    }
?>
