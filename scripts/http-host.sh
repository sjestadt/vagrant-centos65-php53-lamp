#!/bin/bash
## Apache VirtualHost Template with variable replacement

if [ $# -lt 1 ]; then
  echo "Usage: $(basename $0) domain" >&2
  exit 1
fi

domain="$1"
path="$2"

if [ -z "$path" ]
then
$path="/vagrant/public/$domain"
fi

config="/etc/httpd/conf.d/"
configdomain=$config$domain.conf
rootDir=$path

if [ ! -d "$path" ]; then
  echo "Web directory $path doesn’t exists" >&2
  exit 2
fi

if ! echo "
<VirtualHost $domain:80>
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