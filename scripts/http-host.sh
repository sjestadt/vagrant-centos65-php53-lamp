#!/bin/bash
## Apache VirtualHost Template with variable replacement

if [ $# -lt 2 ]; then
  echo "Usage: $(basename $0) domain path" >&2
  exit 1
fi

domain="$1"
path="$2"

config="/etc/httpd/conf.d/"
configdomain=$config$domain.conf
rootDir=$path

if [ ! -d "$path" ]; then
  echo "Web directory $path doesn’t exists" >&2
  exit 2
fi

if ! echo "
NameVirtualHost *:80
<VirtualHost *:80>
    ServerName $domain
    ServerAlias $domain
    DocumentRoot $rootDir

    <Directory $rootDir>
        AllowOverride All
        Order allow,deny
        Allow From All
    </Directory>

    ErrorLog /var/log/httpd/$domain-error.log
    LogLevel error
    CustomLog /var/log/httpd/$domain-access.log combined
</VirtualHost>" > $configdomain
then
    echo -e $"There is an ERROR creating $configdomain file"
    exit;
else
    echo -e $"\nNew Virtual Host Created\n"
fi
sudo /etc/init.d/httpd restart