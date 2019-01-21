# vagrant-install-kernel
Downloads, compiles and installs the latest Linux kernel on the vagrant box

# Requirements

1. VirtualBox
2. Vagrant
3. Vagrand disk-size plugin

# Run

`
git clone https://github.com/frelon/vagrant-install-kernel.git
vagrant up
# Wait ~1hr
vagrant ssh
uname -r
`
