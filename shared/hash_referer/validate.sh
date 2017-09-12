#! /bin/bash

source ~/shared/.scripts/base

if ! curl -H "Referer: color" -s http://localhost:6081/vary_header/tile.php?i=1 | grep -q "referrer=color2"
then
  echo "Didn't get a color tile for color referrer."
  fail_exercise
fi

if ! curl -H "Referer: blackwhite" -s http://localhost:6081/vary_header/tile.php?i=1 | grep -q "referrer=blackwhite2"
then
  echo "Didn't get a black&white tile for blackwhite referrer."
  fail_exercise
fi

report_success

