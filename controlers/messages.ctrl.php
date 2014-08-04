<?php

/*
    List of Messages
*/

require_once(MODELSPATH . 'messages.php');
require_once('db/connect.php');

$m_messages = new M_Messages($db);

// Check if $id_sender is a valid id (should be a number)
if ( isset($id_sender) && is_numeric($id_sender)) {

    // Retrieve all the messages this user sent (first parameter is the name of the column)
    $messages = $m_messages->getMessages('message_recipient', $id_sender);
    
    echo $m_messages->c;
    
    // Display messages
    echo '<pre>';
    print_r($messages);
    echo '</pre>';

} else {
    echo 'Error, value is null or incorrect';
}


