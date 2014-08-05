<?php

/**
*   My Profile Controller
*/

require_once(MODELSPATH . 'users.php');
require_once('db/connect.php');


// Check if this profile belong to the user currently logged in
if ( !( isset($_SESSION['user_id']) && $_SESSION['user_id'] ) ) {

    Flight::redirect('/');

} else {
    
    $m_user = new M_Users($db);
    
    $request = Flight::request();
    
    // If a post request has been made, update the profile
    if ( $request->method == 'POST' ) {
    
        $error = false;
         
        if ( !isset($request->data['password']) ) {
        
            $Messages::add_error('Password is missing.');
            $error = true;
        
        }
        
        if ( !isset($request->data['email']) ) {
        
            $Messages::add_error('Email is missing.');
            $error = true;
        
        }
        
        // if nothing is missing
        if ( !$error ) {
            
            // retrieve user informations
            $user = $m_user->getUser( intval($_SESSION['user_id']) );

            // Check if the password is correct
            $hash = hash("md5", $request->data['password']);
            
            if ( $hash === $user['user_password'] ) {
            
                // Update
                // m_user->updateUser($id, $datas);
            
            } else {
            
                Messages::add_error('Wrong password.');
                
            }
        
        }
                        
    }
    
    // Display the profile

    // Get user information
    $user = $m_user->getUser( intval($_SESSION['user_id']) );

    if ( $user ) {
        // Render page
        Flight::defaultRender('page title');
            
        Flight::render('my_profile', array('user' => &$user), 'main_content');

        Flight::render('core/layout');
    } else {
        // This should never happen, but whatever..
        Flight::render404();
    }
    
}
