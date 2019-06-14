FROM mysql:5.7

# Also see README.txt
#
# Starting with our base docker image
#
#  we then apply our custom mysqld.cnf file
COPY mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
#  Then run a script to help configure things such as creating databases or users.
COPY ./setup.sh /docker-entrypoint-initdb.d/setup.sh

EXPOSE 3306

CMD ["mysqld"]
