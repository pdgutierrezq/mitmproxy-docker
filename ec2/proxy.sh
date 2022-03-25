#!/usr/bin/env bash
sh ./git.sh
ssh -i "$KEY" "ec2-user@$EC2" <<'ENDSSH'
   #commands to run on remote host
   cd mitmproxy-docker
   docker ps
   docker stop proxy
   git fetch
   git pull
   ./run.sh
ENDSSH
