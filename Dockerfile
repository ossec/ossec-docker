FROM centos:latest
MAINTAINER Support <support@atomicorp.com>

RUN yum -y update
RUN yum -y install wget useradd postfix && yum clean all

RUN cd /root; NON_INT=1 wget -q -O - https://updates.atomicorp.com/installers/atomic |sh


RUN yum -y install ossec-hids-server

ADD default_agent /var/ossec/default_agent

# copy base config
ADD ossec.conf /var/ossec/etc/

#
# Initialize the data volume configuration
#
ADD data_dirs.env /data_dirs.env
ADD init.sh /init.sh
# Sync calls are due to https://github.com/docker/docker/issues/9547
RUN chmod 755 /init.sh &&\
  sync && /init.sh &&\
  sync && rm /init.sh


#
# Add the bootstrap script
#
ADD ossec-server.sh /ossec-server.sh
RUN chmod 755 /ossec-server.sh

#
# Specify the data volume 
#
VOLUME ["/var/ossec/data"]

# Expose ports for sharing
EXPOSE 1514/udp 1515/tcp

#
# Define default command.
#
ENTRYPOINT ["/ossec-server.sh"]
