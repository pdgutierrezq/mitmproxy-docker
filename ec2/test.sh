#!/usr/bin/env bash
#docker exec -it proxy /bin/bash
#apt-get update
#apt-get install curl
EC2_0='ec2-user@ec2-3-15-4-198.us-east-2.compute.amazonaws.com'
EC2_1='ec2-user@ec2-3-135-221-17.us-east-2.compute.amazonaws.com'
git commit -am "auto-commit"
git push
ssh -i "rb-pb-dev-ecs-auto.pem" "$EC2" <<'ENDSSH'
   #commands to run on remote host
  cd mitmproxy-docker
   docker ps
   docker stop proxy
   git fetch
   git pull
   ./run.sh
ENDSSH

