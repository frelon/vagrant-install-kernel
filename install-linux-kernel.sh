#!/bin/bash

KERNEL_VERSION=5.0-rc7
echo "Going to install kernel version ${KERNEL_VERSION}"

if [ ! -f /tmp/kernels/linux-${KERNEL_VERSION}.tar.gz ]; then
    echo "Getting latest version of kernel from kernel.org"
    wget https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/snapshot/linux-${KERNEL_VERSION}.tar.gz \
        -P /tmp/kernels/
fi

echo "Updating apt sources"
sudo apt update

# install linux kernel manager
echo "Attempting to install build dependencies."
sudo apt install \
    make \
    gcc \
    build-essential \
    libncurses5-dev \
    bison \
    flex \
    libssl-dev \
    libelf-dev \
    qt4-default \
    qt4-dev-tools \
    -y

# unpack kernel
echo "Unpacking kernel"
cd /usr/src/kernels
tar xvzf /tmp/kernels/linux-${KERNEL_VERSION}.tar.gz
cd linux-${KERNEL_VERSION}

echo "Unpacking done, starting build."

# sudo make defconfig
echo "Copying current boot configuration into new kernel"
cp /boot/config-$(uname -r) .config

echo "Starting make process"

time ( \
sudo make -j 6; \
echo "Making modules"; \
sudo make modules_install; \
echo "Installing"; \
sudo make install; \
)

echo "Make complete"

sudo reboot;

