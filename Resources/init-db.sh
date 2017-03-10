#!/bin/bash
# /usr/bin/mysqld_self &
# sleep 5
mysql -u root -e "CREATE DATABASE IF NOT EXISTS `Company`"
mysql -u root Company < /var/cu-db/Company.sql
