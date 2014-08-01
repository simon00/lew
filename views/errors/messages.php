<!--<script>

$(function(){
	$('.close_box').on('click', function(){
		$('.infos_corp').remove();
	});
})

</script>
-->

<?php

if( Messages::$nb_errors > 0 ){

    echo '<div>';
    foreach( Messages::$errors as $e ){
        echo '<div class=error>' . $e . '</div>';	
    }
    echo '</div>';

}

?>
