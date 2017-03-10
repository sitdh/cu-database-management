#!/bin/bash
# /usr/bin/mysqld_self &
# sleep 5
mysql -uroot --password="$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS `Company`"
mysql -uroot --password="$MYSQL_ROOT_PASSWORD" Company < /var/cu-db/Company.sql
