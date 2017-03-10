FROM mysql:latest 

RUN mkdir -p /var/cu-db
VOLUME /var/cu-db
ADD https://raw.githubusercontent.com/sitdh/cu-database-management/master/Resources/Company.sql /var/cu-db/Company.sql

ENV MYSQL_ALLOW_EMPTY_ROOT_PASSWORD=YES
