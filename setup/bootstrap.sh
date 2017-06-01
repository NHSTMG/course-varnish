#!/usr/bin/env bash


function ai {
  apt-get install -qq -y $@ > /dev/null
}

cat ~ubuntu/.git_logs_HEAD | grep "clone:" | head -n 1 | sed -rn 's/^\w+ \w+ ([^<]+)(<.*| [0-9]{5}).*/\1/p' > /etc/who_am_i

echo "Installing nginx"
ai nginx

echo "Installing Varnish"
ai varnish

# Varnish will be started manually as a different user, so just disable the default daemon.
systemctl stop varnish varnishncsa &> /dev/null
systemctl disable varnish varnishncsa &> /dev/null
chown -R ubuntu:ubuntu /var/lib/varnish/

echo
echo "Done! Read the information at http://stash.nhst.kunder.linpro.no/projects/UTV/repos/khp/browse/course_varnish if you are unsure of what to do."

