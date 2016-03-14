<?php
	$config['base_url'] = ((isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') ? 'https' : 'http');
        $config['base_url'] .= '://' . $_SERVER['HTTP_HOST'];
        $config['base_url'] .= str_replace(basename($_SERVER['SCRIPT_NAME']),'' , $_SERVER['SCRIPT_NAME']);
	
	
	//Ruta de la carpeta del ckeckout
	$config ['co_path'] = substr ($config ['base_url'], 0, strpos ($config ['base_url'], 'applications'));
	
	//Rutas para localizaci�n de los ficheros del lado del cliente
	$config ['paths']['js'][] = $config['co_path'] . 'public/js/ciext';
	$config ['paths']['js'][] = $config['co_path'] . 'public/js/components';
	$config ['paths']['js'][] = $config['co_path'] . 'public/js/encrypt';
        $config ['paths']['js'][] = $config['co_path'] . 'public/js/ext';
        $config ['paths']['js'][] = $config['co_path'] . 'public/js/portal-desktop/js';
	$config ['paths']['js'][] = $config['base_url'] . 'public/js';
	
	$config ['paths']['css'][] = $config['co_path'] . 'public/css';
	$config ['paths']['css'][] = $config['co_path'] . 'public/js/portal-desktop/css';
        $config ['paths']['css'][] = $config['co_path'] . 'public/js/ext/resources/css';
	$config ['paths']['css'][] = $config['base_url'] . 'public/css';

        //Titulo de las páginas
        $config['title'] = 'Cliente XMPP';
	
	//Rutas del include path
	$config ['fw_common'] = substr ($_SERVER ['SCRIPT_FILENAME'], 0, strpos ($_SERVER ['SCRIPT_FILENAME'], '/applications'));
		
	$config ['include_paths'][] = $config ['fw_common'].'/common/ciext/';
	
	//Configuración de Doctrine
	$config['doctrine']['host'] = 'localhost';
	$config['doctrine']['user'] = 'postgres';
	$config['doctrine']['passwd'] = 'postgres';
	$config['doctrine']['db'] = 'security';
	$config['doctrine']['dbdriver'] = 'pgsql';
?>