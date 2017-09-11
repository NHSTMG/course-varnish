#! /bin/bash
set -e
source ~/shared/.scripts/base

require_status_code "http://localhost:6081/synth/error/" 418

require_body_content "http://localhost:6081/synth/content/" "This is the file content.html"

require_status_code "http://localhost:6081/synth/error/" 404

require_status_code "http://localhost:6081/synth/redirect/" 302

require_header_value "http://localhost:6081/synth/redirect/" "Location" "synth/content"

report_success

