#!/bin/bash

export MARATHON_VERSION=v0.13.0
export MESOS_VERSION=0.26.0-0.2.145.ubuntu1404
#export MESOS_VERSION=0.22.1-1.0.ubuntu1404

docker-compose up -d mesosmaster mesosslave zookeeper
docker-compose logs
