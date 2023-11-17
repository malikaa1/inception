#!/bin/sh

if [ ! -d "/var/lib/mysql/mysql" ] || [ ! -d "/var/lib/mysql/wordpress" ]; then

    # secure installation
    echo "UPDATE mysql.user SET Password=PASSWORD('$MYSQL_ROOT_PASSWORD') WHERE User='root';" >> /tmp/init_script.sql;
    echo "DELETE FROM mysql.user WHERE User='';" >> /tmp/init_script.sql;
    echo "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');" >> /tmp/init_script.sql;
    echo "DROP DATABASE IF EXISTS test;" >> /tmp/init_script.sql;
    echo "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';" >> /tmp/init_script.sql;
    echo "UPDATE mysql.user SET plugin = '' WHERE user = 'root' AND host IN ('localhost', '127.0.0.1', '::1');" >> /tmp/init_script.sql;
    echo "FLUSH PRIVILEGES;" >> /tmp/init_script.sql;

    # create wordpress database and wordpress database user
    echo "CREATE DATABASE $WORDPRESS_DB_NAME;" >> /tmp/init_script.sql;
    echo "CREATE USER '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';" >> /tmp/init_script.sql;
    echo "GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%';" >> /tmp/init_script.sql;
    echo "FLUSH PRIVILEGES;" >> /tmp/init_script.sql;
    
    echo "initializing mysqld db...";
    
    # create database "mysql"
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql;
fi


echo "starting mysqld...";

# execute mysqld in foreground.
mysqld --user=mysql;

echo "mysqld stopped";

