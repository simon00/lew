<?php

class Messages {

	public static $nb_errors = 0;
	public static $errors = array();
    
	public static $nb_infos = 0;
	public static $infos = array();
    /*
	public function __construct() {
    
	}
	*/
	public static function add_error($s) {
    
		self::$errors[self::$nb_errors] = $s;
		self::$nb_errors++;
	
    }

	public static function add_info($s) {
    
		self::$infos[self::$nb_infos] = $s;
		self::$nb_infos++;
	
    }
	
	public static function clear() {
    
		self::$nb_errors = 0;
		self::$infos = 0;

		unset(self::$errors);
		self::$errors = array();
        
		unset(self::$infos);
		self::$infos = array();
	
    }	
}

?>