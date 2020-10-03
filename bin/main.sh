#!/usr/bin/env bash
cd "$(dirname "$0")/.."
echo $(pwd)

export HOST_IP=$(ifconfig | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" | grep -v 127.0.0.1 | awk '{ print $2 }' | cut -f2 -d: | head -n1)

docker-compose  -f docker-compose-spark.yml down
docker-compose  -f docker-compose-spark.yml rm
docker-compose -f docker-compose-spark.yml up -d





