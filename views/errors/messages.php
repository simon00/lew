<script>

$(function(){
	$('#errors_corp').on('click', function(){
		$('#errors_corp').fadeOut(100, function() { $(this).remove(); });
        //$('#errors_corp').remove();
	});
})

</script>


<?php

if( Messages::$nb_errors > 0 ){

    echo '<div id="errors_corp" class="container"  >';
    foreach( Messages::$errors as $e ){
        echo '<div class=error>' . $e . '</div>';	
    }
    echo '</div>';

}

?>
