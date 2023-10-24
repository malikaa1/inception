#!/bin/sh

if [ ! -f "/var/www/wordpress/wp-config.php" ]; then

    echo "wordpress doesn't exist, downloading ...";
    
    wget https://wordpress.org/wordpress-6.3.2.tar.gz -P /temp/wordpress/
    tar xfz /temp/wordpress/wordpress-6.3.2.tar.gz -C /var/www/
    rm -rf /temp/wordpress
    echo "wordpress downloaded";

    cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php;

    sed -i "s|define( 'DB_NAME', 'database_name_here' );|define( 'DB_NAME', '$WORDPRESS_DB_NAME' );|" /var/www/wordpress/wp-config.php;
    sed -i "s|define( 'DB_USER', 'username_here' );|define( 'DB_USER', '$WORDPRESS_DB_USER' );|" /var/www/wordpress/wp-config.php;
    sed -i "s|define( 'DB_PASSWORD', 'password_here' );|define( 'DB_USER', '$WORDPRESS_DB_USER' );|" /var/www/wordpress/wp-config.php;
    sed -i "s|define( 'DB_HOST', 'localhost' );|define( 'DB_HOST', '$WORDPRESS_DB_HOST' );|" /var/www/wordpress/wp-config.php;

 fi

 echo "Starting php fpm..."; 
 
 /usr/sbin/php-fpm7.3 --nodaemonize --fpm-config /etc/php/7.3/fpm/php-fpm.conf 

 echo "php fpm stopped."