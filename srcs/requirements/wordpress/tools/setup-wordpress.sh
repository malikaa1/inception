#!/bin/sh
 wget https://wordpress.org/wordpress-6.3.2.tar.gz -P /temp/wordpress/
 tar xfz /temp/wordpress/wordpress-6.3.2.tar.gz -C /var/www/
 rm -rf /temp/wordpress

 echo wordpress started 
 
 /usr/sbin/php-fpm7.3 --nodaemonize --fpm-config /etc/php/7.3/fpm/php-fpm.conf 