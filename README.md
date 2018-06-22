**Description**

OSSEC HIDS Server v2.9.4

Based on Centos 7, this is the official OSSEC project docker container. Note: this can be easily adapted for RHEL 7 for FIPS-140-2 compliance. 

By default this container will create a volume to store configuration, log and agent key data 
under /var/ossec/data.  Additionally it is configured with a local instance of postfix to 
send alert notifications.



  
**Launch:**

        docker run -d -p 1514:1514/udp -p 1515:1515/tcp --name ossec-server <image>


**Launch with a specified Volume:**


	docker volume create ossec-data


        docker run -d -p 1514:1514/udp -p 1515:1515/tcp -v ossec-data:/var/ossec/data --name ossec-server atomicorp/ossec-docker


**Stopping:**

       docker stop ossec-server

**Re-start:**

       docker start ossec-server


**Attach to running:**

        docker exec -it ossec-server  bash

**About**

Atomicorp is your OSSEC expert which developed a set of tools and rules for managing and securing the OSSEC host intrusion detection system. Our Atomic Secured OSSEC secures your entire system and its applications and includes a cognitive self healing system that will automatically fix vulnerabilities and problems on the system before damage and intrusions can occur.

We provide comprehensive services and support for OSSEC… We can Plan your Enterprise Monitoring Strategy for deployment, configuration, optimization, and even training your team to work with the open source software. 
Atomicorp is your comprehensive support team and we provide Threat Intelligence feeds for the OSSEC engine. For assistance with your OSSEC deployment contact us at OSSEC Help. 


**Thanks:**

        Dan Parriott, too many things to list!

        Xetus OSS for the original OSSEC Docker project: https://github.com/xetus-oss/docker-ossec-server


