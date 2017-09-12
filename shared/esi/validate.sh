#! /bin/bash

source ~/shared/.scripts/base

require_body_content "http://localhost:6081/esi/" "ESI is enabled for this page."

require_body_content "http://localhost:6081/esi/" "This element is loaded by Varnish with ESI"

require_body_content "http://localhost:6081/esi/noesi/" "ESI is not enabled for this page."

report_success
