#!/bin/bash
var1=$(docker inspect $(docker ps -a | grep -v "master" | awk 'NR>1 {print $1}' ) | grep -Po '"IPAddress":.*?[^\$

docker exec -it master /bin/bash -c "rm -rf $1 $2 $3"

docker cp /home/ubuntu/$1 master:$1
docker exec -it master /bin/bash -c "jmeter -n -t /$1 -R${var1::-1} -l /$2 -e -o $3"

wait 
docker cp master:$2 /home/ubuntu/$2
docker cp master:$3 /home/ubuntu/$3
