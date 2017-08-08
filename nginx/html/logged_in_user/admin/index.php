<?php
    session_start();
    if(!isset($_SESSION['login'])) {
        header('Location: /logged_in_user/'); die();
    }
?>
<html>
    <head>
        <title>Admin Page</title>
    </head>
    <body>
      You are logged in with username <strong><?php echo $_SESSION['username']; ?></strong>.
      <div style="margin-top: 20px;">
        <a href="/logged_in_user/logout.php">Click here to log out.</a>
      </div>
    </body> 
</html>

