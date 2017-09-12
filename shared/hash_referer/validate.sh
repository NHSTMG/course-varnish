#! /bin/bash

source ~/shared/.scripts/base

ping_server "http://localhost:6081" "Varnish server on localhost"

if ! curl -H "Referer: /hash_referer/color.php" -s "http://localhost:6081/hash_referer/tile.php?i=1" | grep -q "referrer=color2"
then
  echo "Didn't get a color tile for color.php referrer."
  fail_exercise
fi

if ! curl -H "Referer: /hash_referer/blackwhite.php" -s "http://localhost:6081/hash_referer/tile.php?i=1" | grep -q "referrer=blackwhite2"
then
  echo "Didn't get a black&white tile for blackwhite.php referrer."
  fail_exercise
fi

report_success

