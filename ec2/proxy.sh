#!/usr/bin/env bash
#docker exec -it proxy /bin/bash
#apt-get update
#apt-get install curl
sh ./git.sh
ssh -i "rb-pb-dev-ecs-auto.pem" "ec2-user@$EC2" <<'ENDSSH'
   #commands to run on remote host
   cd mitmproxy-docker
   docker ps
   docker stop proxy
   git fetch
   git pull
   ./run.sh
ENDSSH