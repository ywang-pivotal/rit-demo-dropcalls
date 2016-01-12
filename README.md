## Telco Demo : Showing drop calls

### Prerequisites
1. JDK 1.7 (not supported for JDK 1.8)
2. [TcServer (using tomcat 7.x)] (https://network.pivotal.io/products/pivotal-tcserver)
 * Go to <TcServer Instlalation Path>, create an instance by running 
 ```shell
 ./tcruntime-instance.sh create demo
 ``` 
 * Enviroment variable $TOMCAT_HOME points to <TcServer Instlalation Path>/demo 
3. [GemFire 7 and above] (https://network.pivotal.io/products/pivotal-gemfire) 
 * Environment variable $GEMFIRE_HOME points to GemFire version
 * $GEMFIRE_HOME/bin is in $PATH

 
### Local Demo Setup
```shell
git clone https://github.com/ywang-pivotal/rit-demo-dropcalls.git
```


