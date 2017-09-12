<?php
  header("X-Testing: Test header");
  header("Cache-Control: max-age=0, s-maxage=86400, public=true");

?>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Test</title>

    <?php
      $referer = $_SERVER['HTTP_REFERER'];

      if (strpos($referer, 'blackwhite') !== false) {
        echo("<!-- referrer=blackwhite -->");
      } else if (strpos($referer, 'color') !== false) {
        echo("<!-- referrer=color -->");
      } else {
        echo("<!-- referrer=unknown -->");
      }
    ?>

    <style type="text/css">
      html,body {
      }
      body {
        overflow: hidden;
        text-align: center;
        padding-top: 20px;
        font-size: 40px;
        background-color: <?php
          $i = $_GET["i"];

          if (strpos($referer, 'blackwhite') !== false) {
              $r = min(255, round(($i/26)*255));
              $g = $r;
              $b = $r;
              
              echo "rgb(",$r,",",$g,",",$b,")";
          } else {
              $factor = $i/26;
              $r = min(255, round($factor*255));
              $g = min(255, round(abs($factor - 0.5)*255));             
              $b = 255 - $r;
              
              echo "rgb(",$r,",",$g,",",$b,")";
          }

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
        if($i) {
          echo $i;
        } else {
          echo "?";
        }
      ?>
    </span>

  </body>
</html>

