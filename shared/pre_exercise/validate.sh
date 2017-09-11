#! /bin/bash

source ~/shared/.scripts/base

set -e # exit on all errors

echo "Testing varnish..."

output=$(curl_get http://localhost:6081/pre_exercise/)
if [[ ! $output =~ Hello ]]; then fail "Did not receive the expected content via Varnish."; fi

report_success
