#!/bin/sh
cd /var/www/wordpress;
if ! wp core --allow-root is-installed; then

    echo "wordpress is not installed , installing ...";
    wp core --allow-root download --locale=fr_FR --force;

    wp config --allow-root create  --force --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST:$WORDPRESS_DB_PORT;
    wp core --allow-root install  --locale=fr_FR --url=$WORDPRESS_DOMAIN --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email;
    wp user create --allow-root $WORDPRESS_USER_LOGIN $WORDPRESS_USER_EMAIL --user_pass="$WORDPRESS_USER_PASSWORD" --role=author;
else
    echo "Wordpress is already installed";
fi

 echo "Starting php fpm..."; 
 
 /usr/sbin/php-fpm7.3 --nodaemonize --fpm-config /etc/php/7.3/fpm/php-fpm.conf 

 echo "php fpm stopped."