#!/bin/bash
#script for setup server to distributed jmeter

echo "Update OS"
apt-get update 

echo "Install JRE"
apt-get install default-jre -y

echo "Install JDK"
apt-get install default-jdk -y

echo "Install Docker"
apt-get install docker.io -y

echo "pull JMeter server and master docker image"
docker pull vinsdocker/jmmaster
docker pull vinsdocker/jmserver

