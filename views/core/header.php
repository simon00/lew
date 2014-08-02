<div id="header-top-space"></div>

<nav class="clear">
    
    <ul >
    
        <?php
        if ( isset($_SESSION['user_id']) ) {
            echo '<li><a href="#"> Profile : ' . $_SESSION['user_name'] . '</a></li>';
            echo '<li><a href="/lew/logout/"> Logout </a></li>';
        } else {
            echo '<li><a href="/lew/sign-in/"> Login </a></li>';
            echo '<li><a href="/lew/sign-up/"> Register </a></li>';
        }
        
        ?>
		<li><a href="#">Work with us!</a></li>
		<li><a href="#">Events</a></li>
		<li><a href="#">Find Language Partner</a></li>
    </ul>
</nav>

