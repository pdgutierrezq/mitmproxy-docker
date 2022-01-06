#!/usr/bin/env bash
sh ./git.sh
ssh -i "rb-pb-dev-ecs-auto.pem" "ec2-user@$EC2" <<'ENDSSH'
  CASTLEMOCK_HOST=localhost
  cd mitmproxy-docker
  git fetch
  git pull
  cd data/projects/castlemock
  curl --location --request DELETE "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/soap/7cGqrI" \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4='
  curl --location --request DELETE "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/rest/WJBLM5" \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4='
  curl --location --request DELETE "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/soap/WHtzrB" \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4='
  curl --location --request DELETE "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/soap/wn0iz3" \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4='
  curl --location --request POST "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/soap/import" \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4=' \
  --form 'file=@"project-soap-7cGqrI.xml"'
  curl --location --request POST "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/rest/import" \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4=' \
  --form 'file=@"project-rest-WJBLM5.xml"'
  curl --location --request POST "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/soap/import" \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4=' \
  --form 'file=@"project-soap-WHtzrB.xml"'
  curl --location --request POST "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/soap/import" \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4=' \
  --form 'file=@"project-soap-wn0iz3.xml"'
ENDSSH
