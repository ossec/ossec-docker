FROM centos:latest
MAINTAINER Support <support@atomicorp.com>


ADD default_agent /var/ossec/default_agent
# copy base config
ADD ossec.conf /var/ossec/etc/
# Initialize the data volume configuration
ADD data_dirs.env /data_dirs.env
ADD init.sh /init.sh



#
# Add the bootstrap script
#
ADD ossec-server.sh /ossec-server.sh

RUN \
	yum -y update && \
	yum -y install wget postfix && \
	yum clean all && \
	cd /root; NON_INT=1 wget -q -O - https://updates.atomicorp.com/installers/atomic |sh && \
	yum -y install ossec-hids-server && \
	chmod 755 /ossec-server.sh && \
	chmod 755 /init.sh && \
  	sync && /init.sh &&\
  	sync && rm /init.sh

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
