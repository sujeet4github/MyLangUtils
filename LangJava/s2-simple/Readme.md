# Exposing the Person Aggregate Root

# Getting Started

## Docker setup
With help from
* https://github.com/spring-guides/gs-spring-boot-docker

### Building a docker image
`mvnw dockerfile:build`
This unpacks the 'fat' jar so that it can be used by docker to build the image

### running the built docker image
`docker run -p 8080:8080 -t springio/persons:latest`

### Using a Docker Multi-Stage Build
See DockerFile.multi-stage
The first image is labeled "build" and it is used to run Maven and build the fat jar, then unpack it.

## Docker-Postgres setup
### Enable Shared Drives on Docker
Docker -> Settings -> Shared Drives -> expose "C Drive" and Apply
This threw up an error "Firewall detected. A firewall is blocking file sharing between Windows and the container..."

To fix this - start powershell as Administrator
and run following command: `Set-NetConnectionProfile -interfacealias "vEthernet (DockerNAT)" -NetworkCategory Private`
with help from:
* https://stackoverflow.com/questions/42203488/settings-to-windows-firewall-to-allow-docker-for-windows-to-share-drive/43904051

### 

With help from
* https://rominirani.com/docker-on-windows-mounting-host-directories-d96f3f056a2c


# Reference Documentation
For further reference, please consider the following sections:

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)

