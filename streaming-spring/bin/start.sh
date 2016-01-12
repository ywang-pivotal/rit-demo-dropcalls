#!/bin/bash


pushd  `pwd` > /dev/null
cd `dirname $0`/..
export APP_HOME=`pwd`
popd > /dev/null

export CLASSPATH=

rm -rf   ${APP_HOME}/log/locator

mkdir -p ${APP_HOME}/log/locator

options="--name=Locator"
options=" $options  --J=-Xms128m --J=-Xmx128m"
options=" $options  --dir=${APP_HOME}/log/locator"
options=" $options --port=41111"
options=" $options --J=-Dgemfire.jmx-manager-http-port=9090"
options=" $options --J=-Dgemfire.distributed-system-id=10"
options=" $options --J=-Djava.net.preferIPv4Stack=true"
#options=" $options --J=-DDataSerializer.DEBUG=true"


pushd ${APP_HOME}/log/locator

# $GEMFIRE_HOME/bin/gfsh start locator $options
$GEMFIRE/bin/gfsh start locator $options

popd

for file in ${APP_HOME}/target/*.jar
do
  export CLASSPATH=$file:$CLASSPATH
done

for file in ${APP_HOME}/target/lib/*.jar
do
  export CLASSPATH=$file:$CLASSPATH
done

# export CLASSPATH=$GEMFIRE/lib/gemfire.jar:$CLASSPATH

echo CLASSPATH = $CLASSPATH

options="-Xmx1g  -Xms1g"
options=" $options -XX:+UseParNewGC"
options=" $options -XX:+UseConcMarkSweepGC"
options=" $options -XX:CMSInitiatingOccupancyFraction=50"
options=" $options -Dgemfire.locators=localhost:41111"
options=" $options -Djava.net.preferIPv4Stack=true"
options=" $options -Dgemfire.log-level=config"

pushd ${APP_HOME}
rm -rf   diskstores
mkdir -p diskstores/server1 > /dev/null
mkdir -p diskstores/server2 > /dev/null

cd  ${APP_HOME}/diskstores/server1
java  $options  com.gopivotal.rti.streaming.spring.deployment.Server server1  > output.log 2>&1 &
#sleep 30
cd  ${APP_HOME}/diskstores/server2
java  $options com.gopivotal.rti.streaming.spring.deployment.Server server2  > output.log 2>&1 &

popd
