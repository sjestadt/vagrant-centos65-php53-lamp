#!/bin/bash
sudo yum install -y phpmyadmin /usr/share/phpMyAdmin
sudo rm -fR /etc/httpd/conf.d/phpMyAdmin.conf
sudo ./http-host.sh phpmyadmin.cent /usr/share/phpMyAdmin