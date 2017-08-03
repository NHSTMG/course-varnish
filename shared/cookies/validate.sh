#! /bin/bash

source ~/shared/.scripts/base

set -e # exit on all errors

echo "Testing varnish..."

output=$(curl_get -H "Cookie: COURSE_ID=123; RANDOMCOOKIE=321;" http://localhost:6081/simple_cookie/)

if [[ ! $output =~ COURSE_ID ]]; then fail "The COURSE_ID cookie did not get through to the back-end."; fi
if [[ $output =~ RANDOMCOOKIE ]]; then fail "A non-COURSE_ID cookie was passed to the back-end."; fi

sleep 2s
age_header_1=$(curl_get_headers -H "Cookie: COURSE_ID=123; RANDOMCOOKIE=321321;" http://localhost:6081/simple_cookie/ | egrep -e '^Age:')
age_header_2=$(curl_get_headers -H "Cookie: COURSE_ID=${RANDOM}; RANDOMCOOKIE=3212;" http://localhost:6081/simple_cookie/ | egrep -e '^Age:')

if [[ ! ${age_header_1} =~ ^Age:\ [1-9] ]]; then fail "The content does not seem to be cached. ${age_header_1}"; fi
if [[ ! ${age_header_2} =~ ^Age:\ 0 ]]; then fail "Tested with a different COURSE_ID, but the content was still cached."; fi

report_success
