#!/bin/sh

set -xe

echo 'TODO: Enable non-free and contrib repositories'

apt update

# apt install nvidia-detect

apt install linux-headers-amd64 nvidia-kernel-dkms nvidia-driver firmware-misc-nonfre
# apt install nvidia-cuda-dev nvidia-cuda-toolkit

echo 'options nvidia-current NVreg_PreserveVideoMemoryAllocations=1' >> /etc/modprobe.d/nvidia-options.conf
echo 'options nvidia-current NVreg_TemporaryFilePath=/var/tmp' >> /etc/modprobe.d/nvidia-options.conf
echo "options nvidia-drm modeset=1" >> /etc/modprobe.d/nvidia-options.conf
