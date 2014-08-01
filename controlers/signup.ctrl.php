<?php

/**
*   Sign-up controler
*/

require_once(MODELSPATH . 'users.php');
require_once('db/connect.php');

$m_user = new M_Users($db);


$request = Flight::request();

// Init signup data

$values = array('username', 'email', 'password', 'password-confirm');

$signup_data = array();
$error = false;

foreach ( $values as $value ) {

    $signup_data[$value] = '';
    
}


// Sign-up
if ( $request->method === 'POST' ) {

    // Put every POST data in the signup_data array
    
    // Check username
    if ( isset($request->data['username']) ) {
        
        // Check if Username already exist     
        if ( $m_user->usernameExist($request->data['username']) ) {        
            
            $error = true;
            Messages::add_error('This username already exist.');
        
        }
        
        $signup_data['username'] = $request->data['username'];
        
    } else {
    
        $error = true;       
    
    }
    
    // Check email
    if ( isset($request->data['email']) ) {
        
        if ( $m_user->emailExist($request->data['username']) ) {
            
            $error = true;
            Messages::add_error('This email is already used.');
            
        }
        
        $signup_data['email'] = $request->data['email'];
        
    } else {
        
        $error = true;
  
    }
    
    // Check password
    if ( isset($request->data['password']) ) {
        if ( isset($request->data['password-confirm']) ) {
        
            if ( $request->data['password'] !== $request->data['password-confirm'] ) {
                
                Messages::add_error('Passwords do not match.');
                $error = true;
            }
            
            $signup_data['password-confirm'] = $request->data['password-confirm'];
        
        } else {
        
            $error = true;
        
        }
        
        $signup_data['password'] = $request->data['password'];
    
    } else {
    
        $error = true;
        
    }

    // if no informations are missing, we can add a new user
    if ( !$error ) {
        
        // Password hashing : need to change that, md5 sux
        $password = hash("md5", $signup_data['password']);
        
        // Add new user to the database
        $res = $m_user->addUser($signup_data['username'], $signup_data['email'], $password);
               
        // if the user has succefully been added, redirect to main page
        if ( isset($res) && $res ) {
        
            Flight::redirect('/');
        
        } else {
        
            Flight::defaultRender('page title');
            
            Flight::render('signup', array('signup_data' => &$signup_data, 'error' => 2), 'main_content');

            Flight::render('core/layout');

        }
        
    } else {
    
        Flight::defaultRender('page title');
            
        Flight::render('signup', array('signup_data' => &$signup_data, 'error' => 1), 'main_content');

        Flight::render('core/layout');
    
    }
    
} else {

    Flight::defaultRender('page title');
        
    Flight::render('signup', array('signup_data' => &$signup_data, 'error' => 0), 'main_content');

    Flight::render('core/layout');
    
}
