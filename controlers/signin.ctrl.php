<?php

/**
*   Sign-in Controler
*/

require_once(MODELSPATH . 'users.php');
require_once('db/connect.php');


// if user is already logged in, redirect to main page
if ( isset($_SESSION['user_id']) ) {
    Flight::redirect('/');
}

$m_user = new M_Users($db);

$request = Flight::request();

$values = array('username', 'password');

$signin_data = array();
$error = false;

foreach ( $values as $value ) {

    $signin_data[$value] = '';
    
}

// Sign-up
if ( $request->method === 'POST' ) {
    
    // Username
    if ( isset($request->data['username']) ) {
    
        $signin_data['username'] = $request->data['username'];
    
    } else {
    
        $error = true;

    }
    
    // Password
    if ( isset($request->data['password']) ) {
    
        $signin_data['password'] = $request->data['password'];
    
    } else {
         
         $error = true;

    }
    
    // if no information are missing, we check if the user exist
    if ( !$error ) {
    
        // password hashing
        $password_hash = hash("md5", $signin_data['password']);
        
        // Check user
        $user = $m_user->getUserLogin($signin_data['username'], $password_hash);
        
        if ( isset($user) && $user ) {
        
            // Log the user in by creating sessions variables
            $_SESSION['user_id'] = $user['user_id'];
            $_SESSION['user_name'] = $user['user_name'];
            
            // redirect to main page
            Flight::redirect('/');
            
        }
        
    } else {
    
        Messages::add_error('Username or password incorect');
    
    }
    
}

Flight::defaultRender('page title');
        
Flight::render('signin', array('signin_data' => &$signin_data), 'main_content');

Flight::render('core/layout');