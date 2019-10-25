#!/bin/bash
int='^[0-9]+$'

# 1. setup the docker and jmeter if needed
while true; do
    read -p "Do you wish to setup the Docker and JMeter ?[Y/N]    " yn1
    case $yn1 in
        [Yy]* ) ans1=true; break;;
        [Nn]* ) ans1=false; break;;
        * ) echo "Please answer Y or N.";;
    esac
done

if [ "$ans1" = true ]
then
    # if true then setup the docker and jmeter
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

    echo "Setup is done"
fi

# 2. create container if needed
wait
while true; do
    read -p "Do you wish to create a container ?[Y/N]  " yn2
    case $yn2 in
        [Yy]* ) ans2=true; break;;
        [Nn]* ) ans2=false; break;;
        * ) echo "Please answer Y or N.";;
    esac
done

if [ "$ans2" = true ]
then
    # create n container 
    while true; do
        read -p "how many slave container do you needed ?[1..n]  " amountSlaveCont
        if [[ $amountSlaveCont =~ $int ]] ; then
            break
        else
            echo "Please answer with number"
        fi
    done
    # set the name of master and slave
    while true; do
        read -p "name for the master ?  " nameMaster
        if [[ ! -z "$nameMaster" ]] ; then
            break
        else
            echo "Please answer"
        fi
    done
    while true; do
        read -p "name for the slave ?  " nameSlave
        if [[ ! -z "$nameSlave" ]] ; then
            break
        else
            echo "Please answer"
        fi
    done

    # create the docker container master
    docker run -dit --name $nameMaster vinsdocker/jmmaster /bin/bash
    for ((i = 1; i <= $amountSlaveCont; i++ )); do  
        docker run -dit --name $nameSlave$i vinsdocker/jmserver /bin/bash
    done
fi
