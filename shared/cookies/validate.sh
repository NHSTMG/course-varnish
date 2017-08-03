#! /bin/bash

source ~/shared/.scripts/base

output=$(curl --silent -X GET -H "Cookie: COURSE_ID=123; RANDOMCOOKIE=321;" http://localhost:6081/simple_cookie/)

if [[ $output =~ "COURSE_ID" ]] && [[ ! $output =~ "RANDOMCOOKIE" ]]; then
  report_success
else
  report_failure
fi
