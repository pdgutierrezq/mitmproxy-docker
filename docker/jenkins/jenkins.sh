#!/usr/bin/env bash
sh ../ec2/git.sh
ssh -i "$KEY" "ec2-user@$EC2" <<'ENDSSH'
   #commands to run on remote host
   ROOT_PATH="mitmproxy-docker"
   BASE_PATH="docker/jenkins"
   cd $ROOT_PATH
   git fetch
   git pull
   docker ps
   docker-compose -f "$BASE_PATH/jenkins.yml" down
   docker-compose -f "$BASE_PATH/jenkins.yml" up -d
ENDSSH
