## Telco Demo : Showing drop calls

### Prerequisites
1. JDK 1.7 (not supported for JDK 1.8)
2. [TcServer (using tomcat 7.x)] (https://network.pivotal.io/products/pivotal-tcserver)
 * Go to <b>TcServer Instlalation Path</b>, create an instance by running 
 ```shell
 ./tcruntime-instance.sh create demo
 ``` 
 * Enviroment variable $TOMCAT_HOME points to <b>TcServer Instlalation Path</b>/demo 
 * $TOMCAT_HOME/demo/bin is in $PATH
3. [GemFire 7 and above] (https://network.pivotal.io/products/pivotal-gemfire) 
 * Environment variable $GEMFIRE_HOME points to GemFire version
 * $GEMFIRE_HOME/bin is in $PATH

 
### Local Demo Setup
```shell
git clone https://github.com/ywang-pivotal/rit-demo-dropcalls.git

cd rit-demo-dropcalls

cp rti-streaming-telco-demo-ui/build/libs/rti-streaming-telco-demo-ui.war $TOMCAT_HOME/demo/webapps
tcruntime-instance.sh start

sh streaming-spring/bin/start.sh 
//(starts 1x locator 2x servers)

sh streaming-spring-demo/bin/deploy.sh

```

Open the browswer and key in http://localhost:8080/rti-telco-demo-ui/

```shell
sh streaming-spring-demo/bin/client.sh
//use option 't' to load contracts
//when completed use option 'c' to load calls
```

Go back to broswer to refresh the page. 


