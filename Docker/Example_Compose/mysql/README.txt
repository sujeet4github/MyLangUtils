We are starting with a base MySQL docker image from Docker Hub and adding some customizations to the my.cnf file.
Mainly we want to support full unicode using utf8mb4 see http://mysqlserverteam.com/mysql-8-0-when-to-use-utf8mb3-over-utf8mb4/

MySQL Dockerfile:
Starting with our base docker image we then apply our custom my.cnf file
then run a script to help configure things such as creating databases or users.
