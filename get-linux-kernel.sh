#!/bin/bash

# locate our most up to date preempt_rt kernel patch, default to 3.14 if not set
PREEMPT_RT_VERSION=${PREEMPT_RT_VERSION:-"4.20"}
# the linux kernel must match the patch version.
LINUX_KERNEL_VERSION=${PREEMPT_RT_VERSION}
# to ensure our kernel does not contain any malware, we grab the signer's public key 
KERNEL_GPG_KEY=${KERNEL_GPG_KEY:-"00411886"}

echo "GET KERNAL VERSION --> ${PREEMPT_RT_VERSION}"

echo "Adding apt-repository universe"
sudo apt update

# install linux kernel manager ketchup
echo "Attempting to install ketchup kernel manager."
sudo apt install ketchup make gcc build-essential libncurses-dev bison flex libssl-dev libelf-dev -y
mkdir /usr/src/kernels
cd /usr/src/kernels
mkdir linux
cd linux

# setup our loading key
gpg --recv-keys ${KERNEL_GPG_KEY}

# grab the kernel source 
echo "Grabbing kernel version ${LINUX_KERNEL_VERSION}... (may take a while to grab source files)"
ketchup -r -G ${PREEMPT_RT_VERSION} > /dev/null 2>&1
echo "Completed linux kernel source download."

sudo make defconfig
sudo make
sudo make modules_install
sudo make install

echo "Make complete"

