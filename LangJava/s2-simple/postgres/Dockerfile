FROM postgres:11.1

MAINTAINER ss

COPY schema.sql /docker-entrypoint-initdb.d/
COPY data.sql /docker-entrypoint-initdb.d/
