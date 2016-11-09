Usage
=====

`vagrant box install senta/centos65-php53-lamp` then `vagrant up` to run Vagrant VM.


Description
===========

minimum LAMP Box for Vagrant

- CentOS 6.5
- PHP 5.3
- MySQL 5.1 (root user password is "rootpass")
- Apache 2.2.15
- phpMyAdmin - optional script

Requirements
============
- https://downloads.chef.io/chef-dk/windows/
- vagrant plugin install vagrant-berkshelf vagrant-omnibus
- VirtualBox
- Vagrant

Attributes
==========


TODO
==========
- memcache
- redis
- apc
- mcrypt
- cmposer
- PHPunit
- basic usage

Issues 
==========
# After yum updating everything sometimes vagrant refuses to mount local drives
# I fixed this by running the commands bellow
vagrant ssh
yum update -y
yum install kernel-devel-$(uname -r) kernel-headers-$(uname -r) dkms -y
/etc/init.d/vboxadd setup

#executables copied from windows to the virtual box will not run properly until this command is run on them
sed -i -e 's/\r$//' /home/vagrant/bash-script.sh
