# vagrant-install-kernel
Downloads, compiles and installs the latest Linux kernel on the vagrant box

# Requirements

1. VirtualBox
2. Vagrant
3. Vagrant disk-size plugin (`vagrant plugin install vagrant-disksize`)

# Run

```bash
git clone https://github.com/frelon/vagrant-install-kernel.git
cd vagrant-install-kernel
vagrant up
# Wait ~1hr (or until compiling is done)
vagrant ssh
uname -r
```
