#!/bin/sh

set -xe

git clone git@github.com:rabuu/home-manager.git ~/.config/home-manager

mkdir -p ~/.config/nix
echo 'experimental-features = nix-command flakes' > ~/.config/nix/nix.conf

nix run home-manager/master -- switch
