#! /bin/bash

source ~/shared/.scripts/base

set -e # exit on all errors

URL="http://localhost:6081/cache_control/random_number.php"

echo "Testing varnish..."

random_number_1=$(curl_get "${URL}")
echo "Fetched: ${random_number_1}"

sleep 2s
random_number_2=$(curl_get "${URL}")
echo "Fetched: ${random_number_2}"

if [ "${random_number_1}" != "${random_number_2}" ]; then fail "Varnish does not seem to cache the content."; fi

echo "Issuing an HTTP PURGE."
curl -sS -X PURGE -H "Host: localhost:6081" "${URL}" &> /dev/null

sleep 1s
random_number_3=$(curl_get "${URL}")
echo "Fetched: ${random_number_3}"

if [ "${random_number_2}" == "${random_number_3}" ]; then fail "The content does not seem to have been purged. The url is still giving the same results."; fi

report_success
