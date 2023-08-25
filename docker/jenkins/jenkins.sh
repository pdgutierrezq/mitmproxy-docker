#!/usr/bin/env bash
sh ./git.sh
ssh -i "$KEY" "ec2-user@$EC2" <<'ENDSSH'
   #commands to run on remote host
   ROOT_PATH="mitmproxy-docker"
   BASE_PATH="$BASE_PATH/docker/jenkins"
   cd $ROOT_PATH
   git fetch
   git pull
   cd $BASE_PATH
   docker ps
   docker-compose down
   docker-compose -f jenkins.yml up -d
ENDSSH
