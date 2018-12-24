#!/usr/bin/env bash
set -e

red='\e[21;31m%s\e[0m\n'
green='\e[21;32m%s\e[0m\n'
yellow='\e[21;33m%s\e[0m\n'
blue='\e[21;34m%s\e[0m\n'
magenta='\e[21;35m%s\e[0m\n'
cyan='\e[21;36m%s\e[0m\n'

### ------------------------------------
### CONFIG
### ------------------------------------
LOCAL_PORT=9595
DOCKER_PORT=80
DOCKER_TAG=tda-local-dev/$name$
DOCKER_DEBUG=-q


printf "\$yellow" "[1/4] >> install dependencies via npm install"
printf "\$green" "------------------------------------"
npm i --log-level warn


printf "\$yellow" "[2/4] >> run npm build"
printf "\$green" "------------------------------------"
npm run build --silent


printf "\$yellow" "[3/4] >> build docker container with tag: \$DOCKER_TAG"
printf "\$green" "------------------------------------"
docker build \${DOCKER_DEBUG} -t  \${DOCKER_TAG} .


printf "\$green" "[4/4] >> Starting HTTP Server on port: \$LOCAL_PORT"
printf "\$green" "------------------------------------"
docker run --rm -p\${LOCAL_PORT}:\${DOCKER_PORT} \${DOCKER_TAG}
