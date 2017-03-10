FROM mysql:latest 

RUN mkdir -p /var/cu-db
VOLUME /var/cu-db
COPY Resources/Company.sql /var/cu-db/Company.sql
COPY Resources/init-db.sh /var/cu-db/init-db.sh
ENV MYSQL_ROOT_PASSWORD=pass
# RUN ["mysql", "-uroot", "<", "/var/cu-db/Company.sql"]
