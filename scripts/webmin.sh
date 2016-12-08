#!/bin/bash
wget http://prdownloads.sourceforge.net/webadmin/webmin-1.820-1.noarch.rpm
sudo yum -y install perl perl-Net-SSLeay openssl perl-IO-Tty
sudo rpm -U webmin-1.820-1.noarch.rpm