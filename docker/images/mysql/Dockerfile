FROM percona:5.7.26 as mysql

COPY docker/configuration/mysql/my_custom.cnf /etc/my.cnf.d/my_custom.cnf
COPY docker/configuration/mysql/* /docker-entrypoint-initdb.d
