#!/bin/sh

set -xe

echo 'TODO: Enable non-free and contrib repositories'
apt update

# apt install nvidia-detect

apt install linux-headers-amd64 nvidia-open-kernel-dkms nvidia-driver firmware-misc-nonfree nvidia-suspend-common
apt install nvidia-cuda-dev nvidia-cuda-toolkit

systemctl enable nvidia-suspend.service
systemctl enable nvidia-hibernate.service
systemctl enable nvidia-resume.service

echo "options nvidia-drm modeset=1" >> /etc/modprobe.d/nvidia-options.conf
