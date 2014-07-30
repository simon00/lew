<?php

require_once(MODELSPATH . 'users.php');
require_once('db/connect.php');

$m_user = new M_Users();

// Check variables validity
// ...

// Get user
$user = $m_user->getUser($user_id);

// Check if $user_id exist
if (!$user) {
    // Do something
}

?>

<div id="content-main" class="container">

User id : <?php echo $user['id']; ?>
User name : <?php echo $user['name']; ?>

</div>