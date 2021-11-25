#!/usr/bin/env bash
#docker exec -it proxy /bin/bash
#apt-get update
#apt-get install curl
git add .
git commit -m "auto-commit"
git push
ssh -i "rb-pb-dev-ecs-auto.pem" ec2-user@ec2-3-15-4-198.us-east-2.compute.amazonaws.com <<'ENDSSH'
   #commands to run on remote host
  cd mitmproxy-docker
   docker ps
   docker stop proxy
   git fetch
   git pull
   ./run.sh
ENDSSH

