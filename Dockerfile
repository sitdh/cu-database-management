FROM mysql:latest

WORKDIR /var/cu-db
ADD https://raw.githubusercontent.com/sitdh/cu-database-management/master/Resources/Company.sql /var/cu-db
