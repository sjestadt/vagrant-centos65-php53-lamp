Usage
=====

`vagrant box install senta/centos65-php53-lamp` then `vagrant up` to run Vagrant VM.

Instructions
============
- Open cmd.exe as Administrator and run these commands
 * `@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"`
 * `choco install chocolateygui filezilla git greenshot mls-software-openssh git nodejs PowerShell putty virtualbox tortoisegit chefdk Cygwin`
- Open Cygwin and run these commands
 * `git clone https://github.com/sjestadt/vagrant-centos65-php53-lamp.git php53`
 * `vagrant box add senta/centos65-php53-lamp`
- Edit Vagrantfile - change synched folders
 * `cd php53`
 * `vagrant up`
 * `vagrant ssh`  - Get into the box
 

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
sudo yum update -y
sudo yum install kernel-devel-$(uname -r) kernel-headers-$(uname -r) dkms -y
exit
vagrant reload
vagrant ssh
/etc/init.d/vboxadd setup

#executables copied from windows to the virtual box will not run properly until this command is run on them
sed -i -e 's/\r$//' /home/vagrant/bash-script.sh
