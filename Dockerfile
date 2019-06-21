#name of container: docker-xowa
#versison of container: 0.3.2
FROM quantumobject/docker-baseimage:18.04
MAINTAINER Angel Rodriguez  "angelrr7702@gmail.com"

# Update the container
# Installation of nesesary package/software for this containers...
RUN apt-get update && apt-get install -y -q openjdk-8-jre unzip bzip2 p7zip-full \
                    && apt-get clean \
                    && rm -rf /tmp/* /var/tmp/*  \
                    && rm -rf /var/lib/apt/lists/*

#pre-config scritp for different service that need to be run when container image is create 
#maybe include additional software that need to be installed ... with some service running ... like example mysqld
COPY pre-conf.sh /sbin/pre-conf
RUN chmod +x /sbin/pre-conf; sync \
    && /bin/bash -c /sbin/pre-conf \
    && rm /sbin/pre-conf

##startup scripts  
#Pre-config scrip that maybe need to be run one time only when the container run the first time .. using a flag to don't 
#run it again ... use for conf for service ... when run the first time ...
RUN mkdir -p /etc/my_init.d
COPY startup.sh /etc/my_init.d/startup.sh
RUN chmod +x /etc/my_init.d/startup.sh

# VOLUME for wiki folder . where all the data is loaded from wikipedia. 
VOLUME /opt/xowa

# to allow access from outside of the container  to the container service
# at that ports need to allow access from firewall if need to access it outside of the server. 
EXPOSE 8080

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]
