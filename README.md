**Description**


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


**Thanks:**

        Dan Parriott, too many things to list!

        Xetus OSS for the original OSSEC Docker project: https://github.com/xetus-oss/docker-ossec-server


