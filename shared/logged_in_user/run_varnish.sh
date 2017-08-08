#! /bin/bash

source ~/shared/.scripts/base
set -o xtrace

varnishd -F -a :6081 -S ${VARNISH_SECRET_FILE} -f logged_in_user.vcl -p feature=+esi_disable_xml_check
