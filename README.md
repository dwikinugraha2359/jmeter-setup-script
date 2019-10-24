# Setup Server JMeter Distributed

Script bash for setup server to run JMeter Distributed

    ```
    based on M Kurniawan Reference
    https://docs.google.com/presentation/d/1v8kQDvFLvTfLshBScUNMyKHmcJ4gJyVDiiBiXzL2yfE/edit?usp=sharing
	```

## Step-Step

1. Preparing compute engine cloud server (you can use GCP or AWS)
	```
	OS: Ubuntu 16.04 LTS
	```
2. Upload script bash "setup-JRE-JDK-Docker-Jmeter.sh" into server
    1. make the script executable
    ```
	$ chmod +x setup-JRE-JDK-Docker-Jmeter.sh
	```
    2. run the script 
    ```
	$ ./setup-JRE-JDK-Docker-Jmeter.sh
	```
3. Upload script bash "create-jmeter-container.sh" into server and create 1 master and N slave of JMeter docker container
    1. make the script executable
    ```
	$ chmod +x create-jmeter-container.sh
	```
    2. run the script 
    ```
	$ ./create-jmeter-container.sh <Amount of slave container>

	Ex: $ ./create-jmeter-container.sh 2
    (its mean will create 1 master and 2 slave container)
	```
4. Upload your JMeter Script
5. Upload script bash "run-jmeter.sh" into server, and run the JMeter
    1. make the script executable
    ```
	$ chmod +x run-jmeter.sh
	```
    2. run the script 
    ```
	$ ./run-jmeter.sh <path JMeter Script> <name of report>

	Ex: $ ./run-jmeter.sh LoadTest.jmx ReportTest.jtl
    (its mean jmeter will run LoadTest.jmx and will get ReportTest.jtl)
    (the Report will exist on the root folder)
	```

## Built With

* [Docker](https://www.docker.com/) - Containers
* [JMeter](https://jmeter.apache.org/) - Java application for Load Testing
* [vinsdocker/jmmaster](https://hub.docker.com/r/vinsdocker/jmmaster/) - JMeter Master Docker Image
* [vinsdocker/jmserver](https://hub.docker.com/r/vinsdocker/jmserver/) - JMeter Server/Slave Docker Image

## Authors

Dwiki - QA Automation Engineer - 2359 Media

