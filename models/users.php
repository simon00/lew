<?php

class M_Users {

    function __construct() {
        // create statements
    }
    
    function getUser($id) {
        $user = array('id' => $id, 'name' => 'test_name');
        
        return $user;
    }
    
}


