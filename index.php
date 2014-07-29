<?php
require 'flight/Flight.php';
require 'config.php';


Flight::route('/*', function(){
    
    Flight::render('core/head', array('title' => 'Title'), 'head_content');
    Flight::render('core/header', '', 'header_content');
    Flight::render('core/footer', array('companyName' => 'Company Name'), 'footer_content');
    
    Flight::render('body', '', 'main_content');
    
    Flight::render('core/layout', array('test' => 'Title'));
    
});

Flight::start();
?>
