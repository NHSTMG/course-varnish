#! /bin/bash

source ~/shared/.scripts/base
set -o xtrace

varnishd -F -a :6081 -S ${VARNISH_SECRET_FILE} -f esi.vcl -p feature=+esi_disable_xml_check
