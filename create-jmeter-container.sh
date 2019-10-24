#!/bin/bash
docker rm -f $(docker ps -a -q)
docker run -dit --name master vinsdocker/jmmaster /bin/bash
for ((i = 1; i <= $1; i++ )); do  
   docker run -dit --name slave$i vinsdocker/jmserver /bin/bash
done
