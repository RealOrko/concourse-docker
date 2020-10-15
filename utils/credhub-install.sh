#!/usr/bin/env bash

if ! command -v credhub &> /dev/null
then
    rm -rf credhub-linux-2.7.0.*
    wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.7.0/credhub-linux-2.7.0.tgz /app
    tar -xvf /app/credhub-linux-2.7.0.tgz
    cp /app/credhub /usr/local/bin
    credhub --version
    credhub api https://credhub:9000 --skip-tls-validation
    credhub login -u credhub -p password
fi
