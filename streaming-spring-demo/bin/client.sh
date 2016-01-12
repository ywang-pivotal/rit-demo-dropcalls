#!/bin/bash


pushd  `pwd` > /dev/null
cd `dirname $0`/..
export APP_HOME=`pwd`
popd > /dev/null

for file in ${APP_HOME}/target/*.jar
do
  export CLASSPATH=$file:$CLASSPATH
done

for file in ${APP_HOME}/target/lib/*.jar
do
  export CLASSPATH=$file:$CLASSPATH
done

echo CLASSPATH = $CLASSPATH

options="-D-Dsun.net.inetaddr.ttl=300"
options=" $options -Xmx1g  -Xms1g"
options=" $options -XX:+UseParNewGC"
options=" $options -XX:+UseConcMarkSweepGC"
options=" $options -XX:CMSInitiatingOccupancyFraction=50"
#options=" $options -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005"

pushd ${APP_HOME}
mkdir -p diskstores/client/pdxStore > /dev/null

java  $options  com.gopivotal.rti.streaming.spring.demo.ClientEventSetTester

popd