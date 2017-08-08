<?php
    session_start();
    echo isset($_SESSION['login']);
    if(isset($_SESSION['login'])) {
      header('Location: admin/'); die();
    }
?>
<!DOCTYPE html>
<html>
   <head>
     <meta http-equiv='content-type' content='text/html;charset=utf-8' />
     <title>Login</title>
     <meta charset="utf-8">
   </head>
<body>

  <div style="width: 200px; float: right;">
    <esi:include src="/logged_in_user/current_time.php" />
  </div>

  <div class="container">
    <h2 class="text-center">You are not logged in.</h2>
    <h3 class="text-center">Login with any username and the password 'password'</h3>
    <?php
      if(isset($_POST['submit'])){
        $username = $_POST['username']; $password = $_POST['password'];
        if($password === 'password') {
          $_SESSION['username'] = $username;
          $_SESSION['login'] = true; header('Location: /logged_in_user/admin/'); die();
        } {
          echo "<div class='alert alert-danger'>Username and password do not match (use password 'password').</div>";
        }

      }
    ?>
    <form action="" method="post">
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" class="form-control" id="username" name="username" required>
      </div>
      <div class="form-group">
        <label for="pwd">Password:</label>
        <input type="password" class="form-control" id="pwd" name="password" required autocomplete="off">
      </div>
      <button type="submit" name="submit" class="btn btn-default">Login</button>
    </form>
  </div>
</body>
</html>

