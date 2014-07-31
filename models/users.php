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
        
        $this->statements['user_by_id'] = $this->db->prepare('SELECT * FROM user WHERE user_id = :id');
        
        $this->statements['teachers'] = $this->db->prepare('SELECT * FROM (user INNER JOIN teacher) ON (user_id = teacher_id)');
        
        $this->statements['learners'] = $this->db->prepare('SELECT * FROM (user INNER JOIN learner) ON (user_id = teacher_id)');


	}
    
    public function &getUserLogin($pw, $name) {
        $res = $this->statements['user_by_password']->execute(array(':pw' => $pw, ':name' => $name));
        
        return $res;
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


