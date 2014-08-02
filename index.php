<?php

require 'flight/Flight.php';
require 'config.php';
require 'messages.class.php';

session_start();

Flight::map('defaultRender', function($title) {

    Flight::render('core/head', array('title' => $title), 'head_content');
    Flight::render('errors/messages', '', 'messages_content');
    Flight::render('core/header', '', 'header_content');
    Flight::render('core/footer', array('companyName' => 'Company Name'), 'footer_content');
    
});

Flight::map('render404', function() {

    Flight::defaultRender('page title');
    
    Flight::render('errors/404', '', 'main_content');
    
    Flight::render('core/layout');
    
});

Flight::map('notFound', function(){

    Flight::render404();

});

Flight::route ('/logout', function() {
    session_destroy();
    Flight::redirect('/');
});

Flight::route('/sign-in', function() {

    include CTRLPATH . 'signin.ctrl.php'; 
    
});

Flight::route('/sign-up', function() {

    include CTRLPATH . 'signup.ctrl.php'; 
    
});

Flight::route('/users(/@id:[0-9]+)', function($user_id) {

    if ( $user_id !== null ) {
        include CTRLPATH . 'user.ctrl.php';
    } else {
        include CTRLPATH . 'users.ctrl.php';
    }
    
});

Flight::route('/db_create', function() {

    Flight::defaultRender('page title');
    
    Flight::render('db_create', '', 'main_content');
    
    Flight::render('core/layout');

});

Flight::route('/', function() {

    Flight::defaultRender('page title');
    
    Flight::render('body', '', 'main_content');
    
    Flight::render('core/layout');

});

Flight::start();

