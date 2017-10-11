OSSEC Server Centos 7 Docker container

Based on Centos 7, this can be easily adapted for RHEL 7 for FIPS-140-2 compliance.


  
Launch:

        docker run -d -p 1514:1514/udp -p 1515:1515/tcp --name ossec-server atomicorp/ossec-docker


Attach to running: 

        docker exec -it ossec-server  bash


Thanks:

        Dan Parriott, too many things to list!

        Xetus OSS for the original OSSEC Docker project: https://github.com/xetus-oss/docker-ossec-server



