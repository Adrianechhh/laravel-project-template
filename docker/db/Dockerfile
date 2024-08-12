FROM mysql:8.3

COPY mysql.cnf /etc/my.cnf.d/custom.cnf
COPY envsubst /usr/local/bin/envsubst

ARG MYSQL_USER
ARG MYSQL_DATABASE

USER root
RUN chmod +x /usr/local/bin/envsubst

USER mysql
