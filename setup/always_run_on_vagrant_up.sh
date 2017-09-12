#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

/etc/init.d/nginx restart
cp -n ~ubuntu/shared/.config/vcl.nanorc /usr/share/nano/vcl.nanorc
cp -n ~ubuntu/shared/.config/.nanorc ~ubuntu/.nanorc
