#!/usr/bin/env bash

rm -rf credhub-linux-2.7.0.*
wget https://github.com/cloudfoundry-incubator/credhub-cli/releases/download/2.7.0/credhub-linux-2.7.0.tgz /app
tar -xvf /app/credhub-linux-2.7.0.tgz
cp /app/credhub /usr/local/bin
credhub --version
credhub api https://credhub:9000 --skip-tls-validation
credhub login -u credhub -p password
credhub set -n /concourse/main/parameters/cat-name --type value --value garfield
credhub set -n /concourse/main/parameters/dog-name --type value --value odie
