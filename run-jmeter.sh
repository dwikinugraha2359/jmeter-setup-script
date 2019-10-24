#!/bin/bash
var1=$(docker inspect $(docker ps -a | grep -v "master" | awk 'NR>1 {print $1}' ) | grep -Po '"IPAddress":.*?[^\\]?[^\\]",' |awk '{print $2}'| sort -u | tr -d '"'| tr -d '\n')

docker exec -it master /bin/bash -c "rm -rf $1 $2"
docker cp /home/skeithnight/$1 master:$1
docker exec -it master /bin/bash -c "jmeter -n -t /$1 -R${var1::-1} -l /$2"

wait 
docker cp master:$2 /home/skeithnight/$2
