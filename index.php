<?php

require 'flight/Flight.php';
require 'config.php';

Flight::map('defaultRender', function($title) {

    Flight::render('core/head', array('title' => $title), 'head_content');
    Flight::render('core/header', '', 'header_content');
    Flight::render('core/footer', array('companyName' => 'Company Name'), 'footer_content');
    
});

Flight::route('/users(/@id:[0-9]+)', function($id) {

    Flight::defaultRender('page title');
    
    Flight::render('users', array('user_id' => $id), 'main_content');
    
    Flight::render('core/layout');
    
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

