#!/usr/bin/env bash

fly -t tutorial login -u test -p test
fly -t tutorial sp -p parameters -c $(pwd)../test/pipeline.yml
fly -t tutorial up -p parameters
fly -t tutorial tj -j parameters/show-animal-names -w
echo "You can browse to http://localhost:8080/teams/main/pipelines/parameters/jobs/show-animal-names"
