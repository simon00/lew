<?php

/*
    List of users
*/

require_once(MODELSPATH . 'users.php');
require_once('db/connect.php');

$m_user = new M_Users($db);

$users = $m_user->getUsers();
$count = $m_user->c;

// Render page
Flight::defaultRender('page title');
    
Flight::render('users', array('users' => &$users, 'nbUsers' => $count), 'main_content');

Flight::render('core/layout');

