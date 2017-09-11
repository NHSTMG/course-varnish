#! /bin/bash

source ~/shared/.scripts/base
set -o xtrace

varnishd -F -a :6081 -S ${VARNISH_SECRET_FILE} -f debugging.vcl & varnishlog 2>&1 > varnish.log
