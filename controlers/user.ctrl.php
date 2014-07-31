<?php

/**
*   Profile of 1 user
*/

require_once(MODELSPATH . 'users.php');
require_once('db/connect.php');

$m_user = new M_Users($db);

// Get user
$user = $m_user->getUser(intval($user_id));

if ( $user ) {
    // Render page
    Flight::defaultRender('page title');
        
    Flight::render('user', array('user' => &$user), 'main_content');

    Flight::render('core/layout');
} else {
    Flight::render404();
}
