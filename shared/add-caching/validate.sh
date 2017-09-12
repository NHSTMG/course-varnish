#! /bin/bash

source ~/shared/.scripts/base

require_header_present "http://localhost:6081/add_caching/tile.php" "Cache-Control"

report_success

