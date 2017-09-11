#! /bin/bash
set -e
source ~/shared/.scripts/base

echo "Doing some requests to create log entries"

curl -s "http://localhost:6081/" > /dev/null
curl -s "http://localhost:6081/" > /dev/null
curl -s "http://localhost:6081/" > /dev/null
curl -s "http://localhost:6081/" > /dev/null

sleep 3

if grep VCL_Log varnish.log | grep -i -q "UA"
then
  echo "Found logging of User-Agent"
else
  echo "Couldn't find logging of User-Agent. Looking for a log line with \"UA\" in it"
  exit 1
fi

if grep VCL_Log varnish.log | grep -i -q "HIT"
then
  echo "Found logging of hit count"
else
  echo "Couldn't find logging of hit count. Looking for log line with \"HIT\" in it"
  exit 1
fi

require_header_present "http://localhost:6081/" "X-Cache"

report_success

