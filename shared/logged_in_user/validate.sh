#! /bin/bash

source ~/shared/.scripts/base

require_body_content "http://localhost:6081/logged_in_user/" "This element is loaded by Varnish"

#report_success
