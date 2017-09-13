#! /bin/bash

source ~/shared/.scripts/base

ping_server "http://localhost:6081" "Varnish server on localhost"

if ! curl -H "Referer: /vary_header/color.php" -s "http://localhost:6081/vary_header/tile.php?i=1" | grep -q "referrer=color"
then
  echo "Didn't get a color tile for color.php referrer."
  fail_exercise
fi

if ! curl -H "Referer: /vary_header/blackwhite.php" -s "http://localhost:6081/vary_header/tile.php?i=1" | grep -q "referrer=blackwhite"
then
  echo "Didn't get a black&white tile for blackwhite.php referrer."
  fail_exercise
fi

require_header_value "http://localhost:6081/vary_header/tile.php" "Vary" "Referer"

report_success

