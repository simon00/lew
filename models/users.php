<?php

class M_Users {
    
    public $data;
    public $c;
    
    private $db;
    private $statements = array();
    
    public function __construct($db) {

        $this->db = $db;
        
        $this->statements['user_by_password'] = $this->db->prepare('SELECT * FROM user WHERE user_password = :pw AND user_name = :name');
        
        $this->statements['users'] = $this->db->prepare('SELECT * FROM user');
        
        $this->statements['usernameExist'] = $this->db->prepare('SELECT * FROM user WHERE user_name = :name');
        
        $this->statements['emailExist'] = $this->db->prepare('SELECT * FROM user WHERE user_email = :email');
        
        $this->statements['user_by_id'] = $this->db->prepare('SELECT * FROM user WHERE user_id = :id');
        
        $this->statements['teachers'] = $this->db->prepare('SELECT * FROM (user INNER JOIN teacher) ON (user_id = teacher_id)');
        
        $this->statements['learners'] = $this->db->prepare('SELECT * FROM (user INNER JOIN learner) ON (user_id = teacher_id)');

        $this->statements['addUser'] = $this->db->prepare('INSERT INTO user (user_name, user_email, user_password) VALUES(:name, :email, :password)');

	}
    
    public function usernameExist($username) {
        
        $stm = &$this->statements['usernameExist'];
        
        $stm->execute(array(':name' => $username));
        
        $this->data = $stm->fetch();
        
        return $this->data ? true : false;
         
    }
    
    public function emailExist($email) {
    
        $stm = &$this->statements['emailExist'];
        
        $stm->execute(array(':email' => $email));
        
        $this->data = $stm->fetch();
        
        return $this->data ? true : false;
    }
    
    
    public function addUser($username, $email, $password) {
        
        $stm = &$this->statements['addUser'];
    
        $stm->execute( 
            array(
                ':name' => $username,
                ':email' => $email,
                ':password' => $password
        ));
        
        $this->data = $stm;

        return $this->data; 
    
    }
    
    public function &getUserLogin($name, $pw) {
        $stm = &$this->statements['user_by_password'];
        
        $stm->execute(array(':pw' => $pw, ':name' => $name));
        
        $this->data = $stm->fetch();
        
        return $this->data;
    }
    
    public function &getUsers() {
        
        $stm = &$this->statements['users'];
        
        $stm->execute();
        
        $this->data = $stm->fetchAll();
        $this->c = count($this->data);
        
        return $this->data;
        
    }
    
    public function &getUser($id) {
    
        $stm = &$this->statements['user_by_id'];
    
        $stm->execute(array(':id' => $id));
        
        $this->data = $stm->fetch();
        $this->c = count($this->data);
        
        return $this->data;        
    }    
}


