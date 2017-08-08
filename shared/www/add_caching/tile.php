<?php
  header("X-Testing: Test header");

  // Add cache control header here
  header("Cache-Control: max-age=0, s-maxage=86400, public=true");

?>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Test</title>

    <style type="text/css">
      html,body {
      }
      body {
        text-align: center;
        padding-top: 20px;
        font-size: 40px;
        background-color: <?php
          $i = $_GET["i"];

          $r = min(255, round(($i/26)*255));
          $g = $r;
          $b = $r;
          
          echo "rgb(",$r,",",$g,",",$b,")";
        ?>;
        color: <?php
          $r = max(0, 255 - round(($i/18)*255));
          $g = $r;
          $b = $r;
          
          echo "rgb(",$r,",",$g,",",$b,")";
        ?>;
      }
    </style>
  </head>
  <body>
    
    <span> 
      <?php
        sleep(rand (0, 2));
        echo $i;
      ?>
    </span>

  </body>
</html>

