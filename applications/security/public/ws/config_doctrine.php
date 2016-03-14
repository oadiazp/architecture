<?php
    define ('BASEPATH', '');

    $path = __FILE__;
    $base = substr($path, 0, strpos($path, 'applications'));

    $doctrine_path = $base . 'common' .DIRECTORY_SEPARATOR . 'ciext'. DIRECTORY_SEPARATOR . 'Doctrine.php';
    include ($doctrine_path);

    spl_autoload_register (array ('Doctrine', 'autoload'));

    include $base . 'applications' . DIRECTORY_SEPARATOR . 'security' . DIRECTORY_SEPARATOR . 'application' . DIRECTORY_SEPARATOR .  'config' . DIRECTORY_SEPARATOR . 'ciext.php';

    $doctrine_config = $config ['doctrine'];

    if (! isset ($doctrine_config ['port']))
       $dsn =  "{$doctrine_config['dbdriver']}://{$doctrine_config['user']}:{$doctrine_config['passwd']}@{$doctrine_config['host']}/{$doctrine_config['db']}";
    else
        $dsn =  "{$doctrine_config['dbdriver']}://{$doctrine_config['user']}:{$doctrine_config['passwd']}@{$doctrine_config['host']}:{$doctrine_config['port']}/{$doctrine_config['db']}";

    // Load the Doctrine connection
    Doctrine_Manager::connection($dsn, $doctrine_config ['db']);

    Doctrine::loadModels($base . 'applications' . DIRECTORY_SEPARATOR . 'security' . DIRECTORY_SEPARATOR . 'domain/generated');
    Doctrine::loadModels($base . 'applications' . DIRECTORY_SEPARATOR . 'security' . DIRECTORY_SEPARATOR . 'domain');

    $concat = 'mod_admin';

    $dm = Doctrine_Manager::getInstance();
    $conn = $dm->getCurrentConnection()->exec ('set search_path = ' . $concat);
?>
