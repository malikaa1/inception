#!/bin/sh
cd /var/www/wordpress;
# install wordpress if not installed
if ! wp core --allow-root is-installed; then

    echo "wordpress is not installed , installing ...";
    # download wordpress
    wp core --allow-root download --locale=fr_FR --force;

    # create wordpress wp-config.php file 
    wp config --allow-root create  --force --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST:$WORDPRESS_DB_PORT;
    
    # install wordpress (create database) and admin user
    wp core --allow-root install  --locale=fr_FR --url=$WORDPRESS_DOMAIN --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email;
    
    # create wordpress user.
    wp user create --allow-root $WORDPRESS_USER_LOGIN $WORDPRESS_USER_EMAIL --user_pass="$WORDPRESS_USER_PASSWORD" --role=author;

    # install theme 
    wp theme --allow-root install royal-elementor-kit --activate
else
    echo "Wordpress is already installed";
fi

 echo "Starting php fpm..."; 
 
 /usr/sbin/php-fpm7.3 --nodaemonize --fpm-config /etc/php/7.3/fpm/php-fpm.conf 

 echo "php fpm stopped."