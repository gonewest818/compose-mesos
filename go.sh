#!/bin/bash

OPTIND=1
MESOS_HA="_nonha"
MARATHON=0

function show_help {
	printf "$0 [OPTIONS]\n\n"
	printf "Launches Mesos master and slave in docker\n\n"
	printf "Options:\n"
	printf "  -h|-?   show this help\n"
	printf "  -m      launch marathon also\n"
	printf "  -z      launch mesos in ha mode with zookeeper\n"
}

while getopts "h?zm" opt; do
    case "$opt" in
    h|\?)
        show_help
        exit 0
        ;;
    m) MARATHON=1
	    ;;
    z) MESOS_HA="_ha"
        ;;
    esac
done

. mesos-env

SERVICES="mesosslave${MESOS_HA} "

if [ $MARATHON -eq 1 ]; then SERVICES+="marathon${MESOS_HA}"; fi

docker-compose up -d $SERVICES
docker-compose logs -f

