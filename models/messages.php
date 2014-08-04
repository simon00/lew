<?php

class M_Messages {
    
    public $data;
    public $c;
    
    private $db;
    private $statements = array();
    
    public function __construct($db) {

        $this->db = $db;
        
        // INSERT
        
        $this->statements['addMessage'] = $this->db->prepare('INSERT INTO message (message_sender, message_recipient, content, date, reported, moderated) 
                                                              VALUES(:sender, :recipient, :content, :date, :reported, :moderated)');
             
	}
    
    public function addMessage($sender, $recipient, $content, $date, $reported = 0, $moderated = 0) {
        $stm = &$this->statements['addMessage'];
    
        $stm->execute( 
            array(
                ':sender' => $sender,
                ':recipient' => $recipient,
                ':content' => $content,
                ':date' => $date,
                ':reported' => $reported,
                ':moderated' => $moderated
        ));
        
        $this->data = $stm;

        return $this->data; 
    }

    public function &getMessages($column, $value) {
    
        $stm = $this->db->prepare("SELECT * FROM message WHERE $column = :d");
        
        $stm->execute(array(':d' => $value));
    
        $this->data = $stm->fetchAll();
        $this->c = count($this->data);
        
        return $this->data;    
    
    }
    
   
}


