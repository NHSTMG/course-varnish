<!DOCTYPE html>
<html>
   <head>
     <meta http-equiv='content-type' content='text/html;charset=utf-8' />
     <title>ESI exercise</title>
     <meta charset="utf-8">
     <style>
       body {
         font-size: 24px;
       }
     </style>
   </head>
<body>

  <!-- Add ESI markup to hide the following element when ESI is enabled -->

    <div style="border: 4px solid #f00; padding: 20px; margin: 20px;">
      ESI is not enabled for this page.
    </div>

  <!-- Add ESI markup to make the following element visible when ESI is enabled -->

    <div style="border: 4px solid #00f; padding: 20px; margin: 20px;">
      ESI is enabled for this page.
    </div>  

  <div style="padding: 20px; margin: 20px; border: 4px dashed #000;">
    <div>
      The time when this page was cached was <strong>
	<?php
	  echo date('Y-m-d H:i:s');
	?>
        </strong>
    </div>
  </div>

  <!-- Add ESI markup to include content from the file current_time.php in the following element --> 

  <div style="margin: 20px;">
  </div>

</body>
</html>

