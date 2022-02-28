FROM rockylinux:latest
MAINTAINER Support <support@atomicorp.com>


ADD default_agent /var/ossec/default_agent

# copy base config
COPY --chmod=755 ossec.conf /var/ossec/etc/ossec.conf

# Initialize the data volume configuration
ADD data_dirs.env /data_dirs.env
COPY --chmod=755 init.sh /init.sh

# Add the bootstrap script
COPY --chmod=755 ossec-server.sh /ossec-server.sh

RUN \
	yum -y update && \
	yum -y install wget postfix && \
	yum clean all && \
	cd /root; NON_INT=1 wget -q -O - https://updates.atomicorp.com/installers/atomic |sh && \
	yum -y install ossec-hids-server && \
  	sync && /init.sh &&\
  	sync && rm /init.sh

# Specify the data volume 
VOLUME ["/var/ossec/data"]

# Define default command.
ENTRYPOINT ["/ossec-server.sh"]
