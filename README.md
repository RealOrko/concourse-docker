# Concourse with Credhub and UAA using Docker Compose

This is a local development environment for concourse with credhub.

## Prerequisites

You must make sure you have the following pre-requisites installed: 

 - [docker ce](https://docs.docker.com/get-docker/)
 - [fly cli](https://github.com/concourse/concourse/releases)

## Getting Started

Please run the following the following command from your the directory
where you checked the project out.

```shell
docker-compose up -d
```

This should launch:
 
 - concourse web
 - concourse worker
 - credhub 
 - uaa
 - postgresql

To make sure everything has started properly please run: 

```shell
docker ps
```

You can also see logs from docker-compose by running: 

```shell
docker-compose logs -f
```

### Gaining access to the credhub via the CLI

First you need a shell to the container running credhub, please run:

[./utils/credhub-shell.sh](https://github.com/RealOrko/concourse-docker/blob/master/utils/credhub-shell.sh)

Next you will need to install the credhub cli, please run this once: 

[./credhub-install.sh](https://github.com/RealOrko/concourse-docker/blob/master/utils/credhub-install.sh)

If this fails, please give it some time and run it again. Once this is done, you are in a position to start setting some secrets:

```shell
credhub set -n /concourse/main/parameters/cat-name --type value --value garfield
credhub set -n /concourse/main/parameters/dog-name --type value --value odie
```

## Creating a pipeline in concourse and testing secret access via credhub

You can login, create, unpause and run the test pipeline by running the 
following script:

[./utils/install-and-run-pipeline.sh](https://github.com/RealOrko/concourse-docker/blob/master/utils/install-and-run-pipeline.sh)

## Credentials

Below are the details of the credentials for your development envirnment.

### Credhub

Details for accessing credhub.

 - shell: `./utils/credhub-shell.sh`
 - username: `credhub`
 - password: `password`

### Concourse

Details for accessing concourse.

 - url: `http:/localhost:8080`
 - username: `test`
 - password: `test`

## Tutorials

You can find a great tutorial for concourse [here](https://concoursetutorial.com/).