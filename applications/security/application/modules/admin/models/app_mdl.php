<?php
class App_mdl extends MY_Model {
    function App_mdl () {
        parent :: MY_Model();
    }

    function load ($pLimit, $pStart) {
        $q = Doctrine_Query::create();
        $q = $q->from ('Aplicacion a');
        
        if ($pLimit)
            $q->offset($pStart)->limit($pLimit);

        return $q->execute();
    }

    function count () {
        $q = Doctrine_Query::create();
        return $q->select ('count(idaplicacion) as cant')->from ('Aplicacion a')
                 ->execute()->getFirst()->cant;
    }

    function add ($pApp) {
        $app = new Aplicacion();
        $app->aplicacion = $pApp;
        $app->save ();
    }

    function upd ($pId, $pApp) {
        $app = Doctrine::getTable('Aplicacion')->find ($pId);
        $app->aplicacion = $pApp;
        $app->save ();
    }

    function get_modules_by_app ($pId) {
        return Doctrine::getTable('Aplicacion')->find ($pId)->Modulo;
    }

    function rem ($pId) {
        Doctrine::getTable('Aplicacion')->find ($pId)->delete ();
    }
}
?>
