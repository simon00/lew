<div id="content-main" class="container">
    
    <form action="#" method="post">
        
        <label for="username"> Username </label>
        <input name="username" value="<?php echo $signup_data['username']; ?>" required>
        
        <label for="email"> Email </label>
        <input name="email" type="email" value="<?php echo $signup_data['email']; ?>" required>
        
        <label for="password"> Password </label>
        <input name="password" type="password" required>
        
        <label for="password-confirm"> Confirmation </label>
        <input name="password-confirm" type="password" required>
        
        <input type="submit" name="submit" id="submit" value="Sign-up !" />

    </form>

</div>