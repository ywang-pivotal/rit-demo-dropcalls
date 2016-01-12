#!/bin/bash

pushd  `pwd` > /dev/null
cd `dirname $0`/..
export APP_HOME=`pwd`
popd > /dev/null

$GEMFIRE/bin/gfsh -e "connect --locator=localhost[41111]" -e "shutdown --time-out=15"

# $GEMFIRE/bin/gfsh stop locator --dir=${APP_HOME}/log/locator


$GEMFIRE/bin/gfsh stop locator --dir=${APP_HOME}/log/locator

