#!/usr/bin/env bash
sh ./git.sh
ssh -i "rb-pb-dev-ecs-auto.pem" "ec2-user@$EC2" <<'ENDSSH'
  cd mitmproxy-docker
  git fetch
  git pull
  cd data/projects/castlemock
  curl --location --request POST 'http://10.5.10.86/castlemock/api/rest/core/project/soap/import' \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4=' \
  --form 'file=@"project-soap-7cGqrI.xml"'
  curl --location --request POST 'http://10.5.10.86/castlemock/api/rest/core/project/soap/import' \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4=' \
  --form 'file=@"project-rest-WJBLM5.xml"'
ENDSSH
