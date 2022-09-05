#!/usr/bin/env bash
sh ./git.sh
ssh -i "$KEY" "ec2-user@$EC2" <<'ENDSSH'
   #commands to run on remote host
  docker logs --tail 100 proxy
ENDSSH
