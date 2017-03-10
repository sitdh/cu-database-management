FROM mysql:latest 

RUN mkdir -p /var/cu-db
VOLUME /var/cu-db
ADD https://raw.githubusercontent.com/sitdh/cu-database-management/master/Resources/Company.sql /var/cu-db/Company.sql

ENV MYSQL_ROOT_PASSWORD=pass
ENTRYPOINT Resources/init-db.sh
