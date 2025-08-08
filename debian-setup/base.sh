#!/bin/sh

set -xe

apt modernize-sources
apt update
apt install build-essential sudo interception-tools interception-caps2esc nix-setup-systemd kde-standard

adduser rabuu sudo
adduser rabuu nix-users

cp ./etc/interception/udevmon.d/caps2esc.yaml /etc/interception/udevmon.d
