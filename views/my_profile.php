<div id="content-main" class="container">

<form action="#" method="post">
    
    <span><?php echo $user['user_name']; ?> </span>
    
    <label for="firstname"> First Name : </label>
    <input name="firstname" type="text" value="<?php echo $user['user_firstname']; ?>">
    
    <label for="lastname"> Last Name : </label>
    <input name="lastname" type="text" value="<?php echo $user['user_lastname']; ?>">
    
    <label for="gender"> Age : </label>
    <input name="age" type="text" value="<?php echo $user['age']; ?>">
        
    <label for="email"> Email </label>
    <input name="email" type="email" value="<?php echo $user['user_email']; ?>" required>
    
    <label for="password"> Password </label>
    <input name="password" type="password" required>
    
    <input type="submit" name="submit" value="Update !" />

</form>

</div>