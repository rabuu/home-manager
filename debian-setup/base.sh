#!/bin/sh

set -xe

apt modernize-sources
apt update
apt install build-essential sudo interception-tools interception-caps2esc nix-setup-systemd kde-standard

adduser rabuu sudo
adduser rabuu nix-users

echo 'TODO: Configure interception-tools'
