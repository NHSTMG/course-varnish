#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

function ai {
  apt-get install -qq -y $@ > /dev/null
}

cat ~ubuntu/.git_logs_HEAD | grep "clone:" | head -n 1 | sed -rn 's/^\w+ \w+ ([^<]+)(<.*| [0-9]{5}).*/\1/p' > /etc/who_am_i

apt-get update

echo "Installing nginx with PHP"
ai nginx php7.0 php7.0-fpm

echo "Installing Varnish"
ai varnish varnish-modules

# Varnish will be started manually as a different user, so just disable the default daemon.
systemctl stop varnish varnishncsa &> /dev/null
systemctl disable varnish varnishncsa &> /dev/null
chown -R ubuntu:ubuntu /var/lib/varnish/

echo
echo "Done! Read the information at http://stash.nhst.kunder.linpro.no/projects/UTV/repos/khp/browse/course_varnish if you are unsure of what to do."

