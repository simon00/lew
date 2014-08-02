<div id="content-main" class="container">
    
    <form action="#" method="post">
        
        <label for="username"> Username </label>
        <input name="username" value="<?php echo $signin_data['username']; ?>" required>
        
        <label for="password"> Password </label>
        <input name="password" type="password" required>

        
        <input type="submit" name="submit" value="Sign-in !" />

    </form>

</div>