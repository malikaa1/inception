#!/bin/sh

install_mysql_db;

#/etc/init.d/mysql start;

exec sleep infinity;

/etc/init.d/mysql stop;