<?php

$db_info = $GLOBALS['db_info'];

try {
	$db = new PDO('mysql:host='.$db_info['host'].';dbname='.$db_info['name'], $db_info['user'], $db_info['password']);
}
catch(Exception $e) {
    die('Error : '.$e->getMessage());
}

?>