<?php

/*
    Environment setting
*/

define('ENVIRONMENT', 'development');

if (defined('ENVIRONMENT')) {
	switch (ENVIRONMENT) {
		case 'development':
			error_reporting(E_ALL);
		break;

		case 'production':
			error_reporting(0);
		break;

		default:
			exit('Environment setting incorrect.');
	}
}

/*
    Folder names
*/

$site_root = '/lew';
$views_folder = 'views';
$models_folder = 'models';

/*
    Database
*/

$db_host = 'localhost';
$db_name = 'lew';
$db_user = 'root';
$db_password = '';

/*
    //
*/

$system_path = dirname(__FILE__);
$system_path = realpath($system_path ).'/';

define('BASEPATH', str_replace("\\", "/", $system_path));
define('RELATIVE_BASEPATH', $site_root . '/');

if (is_dir($views_folder)) {
    define('VIEWSPATH', $views_folder . '/');
} else {
    exit('Error : couldn\'t set VIEWSPATH ' . $views_folder);
}

if (is_dir($models_folder)) {
    define('MODELSPATH', $models_folder . '/');
} else {
    exit('Error : couldn\'t set MODELSPATH ' . $models_folder);
}

// Setting Flight view directory
Flight::set('flight.views.path', VIEWSPATH);

$GLOBALS['db_info'] = array('host' => $db_host, 'name' => $db_name, 'user' => $db_user, 'password' => $db_password);
