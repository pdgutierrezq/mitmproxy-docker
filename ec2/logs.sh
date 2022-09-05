#!/usr/bin/env bash
ssh -i "$KEY" "ec2-user@$EC2" <<'ENDSSH'
   #commands to run on remote host
  docker logs --follow --tail 100 proxy
ENDSSH
