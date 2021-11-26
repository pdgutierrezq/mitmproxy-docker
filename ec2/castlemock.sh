#!/usr/bin/env bash
sh ./git.sh
ssh -i "rb-pb-dev-ecs-auto.pem" "ec2-user@$EC2" <<'ENDSSH'
  cd mitmproxy-docker
  git fetch
  git pull
  cd data/projects/castlemock
#  curl -X POST "http://10.5.10.86/castlemock/api/rest/core/project/soap/import" -H "accept: */*" -H "Authorization: YWRtaW46YWRtaW4x" -H "Content-Type: multipart/form-data" -F "file=@project-soap-7cGqrI.xml;type=text/xml"
  curl --location --request POST 'http://10.5.10.86/castlemock/api/rest/core/project/soap/import' \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4=' \
  --form 'file=@"project-soap-7cGqrI.xml"'
ENDSSH
