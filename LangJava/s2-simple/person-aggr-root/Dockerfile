FROM openjdk:12-jdk-alpine

MAINTAINER ss

## We added a VOLUME pointing to "/tmp" because that is where a Spring
## Boot application creates working directories for Tomcat by default.
## The effect is to create a temporary file on your host under "/var/lib/docker"
## and link it to the container under "/tmp".
## This step is optional for the simple app that we wrote here, but can
## be necessary for other Spring Boot applications if they need to
## actually write in the filesystem.
VOLUME /tmp

# A Spring Boot fat jar naturally has "layers" because of the way that the jar itself is packaged.
# If we unpack it first it will already be divided into external and internal dependencies.
# To do this in one step in the docker build, we need to unpack the jar first.
# For example (in Maven)
# $ mkdir target/dependency
# $ (cd target/dependency; jar -xf ../*.jar)
# $ docker build -t myorg/myapp .
# 
ARG DEPENDENCY=target/dependency
# There are now 3 layers - if the application dependencies do not change then
# the first layer ... BOOT-INF/lib will not change
#
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT ["java","-cp","app:app/lib/*","t.learn.spring.boot.min.Application"]