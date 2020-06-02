#!/usr/bin/env bash

CREDHUB_CONTAINER_ID=$(docker ps | grep pcfseceng/credhub | awk '{print $1}')

docker exec -it $CREDHUB_CONTAINER_ID /bin/bash