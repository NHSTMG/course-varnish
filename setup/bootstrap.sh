#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

function ai {
  apt-get install -qq -y $@ > /dev/null
}

cat ~ubuntu/.git_logs_HEAD | grep "clone:" | head -n 1 | sed -rn 's/^\w+ \w+ (.+) <.*/\1/p' > /etc/who_am_i

update-locale LANG="en_US.UTF-8" LANGUAGE="en_US:en" LC_ALL="en_US.UTF-8" &> /dev/null

echo "Installing tmate"
yes | ssh-keygen -b 2048 -t rsa -f /home/ubuntu/.ssh/id_rsa -q -N ""
chown ubuntu:ubuntu /home/ubuntu/.ssh/id_rsa
ai software-properties-common
add-apt-repository -y ppa:tmate.io/archive > /dev/null 2>&1
apt-get -y update > /dev/null
ai tmate

echo "Installing nginx with PHP"
ai nginx php7.0 php7.0-fpm
sudo systemctl enable nginx &> /dev/null

echo "Installing Varnish"
ai varnish varnish-modules

# Varnish will be started manually as a different user, so just disable the default daemon.
systemctl stop varnish varnishncsa &> /dev/null
systemctl disable varnish varnishncsa &> /dev/null
chown -R ubuntu:ubuntu /var/lib/varnish/

rm -f /etc/update-motd.d/*
echo '#!/bin/sh' > /etc/update-motd.d/99-custom-message
echo 'echo "Welcome, $(cat /etc/who_am_i)! (Wrong name? Type change_name to fix it)."' >> /etc/update-motd.d/99-custom-message
echo 'echo' >> /etc/update-motd.d/99-custom-message
echo 'echo "To share your terminal session, type: share"' >> /etc/update-motd.d/99-custom-message
echo 'echo' >> /etc/update-motd.d/99-custom-message
chmod a+rx /etc/update-motd.d/99-custom-message

echo
echo "Done! Read the information at http://stash.nhst.kunder.linpro.no/projects/UTV/repos/khp/browse/course-varnish if you are unsure of what to do."

