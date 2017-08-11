<?php
  /* Delete all cookies. */
  if (isset($_SERVER['HTTP_COOKIE'])) {
    $cookies = explode(';', $_SERVER['HTTP_COOKIE']);
    foreach($cookies as $cookie) {
        $parts = explode('=', $cookie);
        $name = trim($parts[0]);
        setcookie($name, '', time()-1000);
        setcookie($name, '', time()-1000, '/');
    }
  }
?>

Hi! Put any HTML or web resources here, and they will be served by nginx at http://localhost:10080/ on your host machine.

<?php print "PHP is enabled. By the way, all cookies on this domain have also been deleted."; ?>
