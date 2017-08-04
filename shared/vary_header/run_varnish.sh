#! /bin/bash

source ~/shared/.scripts/base
set -o xtrace

varnishd -F -a :6081 -S ${VARNISH_SECRET_FILE} -f vary.vcl
