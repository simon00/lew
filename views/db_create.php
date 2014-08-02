<?php

require_once('db/connect.php');

$sql = file_get_contents('db/lew.sql');


$qr = $db->exec($sql) ;

?>

<div id="content-main" class="container">

<?php 

echo $qr; 

?>

</div>