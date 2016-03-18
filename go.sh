#!/bin/bash

. mesos-env

docker-compose up -d mesosmaster mesosslave zookeeper
docker-compose logs

