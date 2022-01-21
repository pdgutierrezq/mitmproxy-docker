#!/usr/bin/env bash
sh ./git.sh
ssh -i "rb-pb-dev-ecs-auto.pem" "ec2-user@$EC2" <<'ENDSSH'
import_project(){
   PROJECT_ID=$1
   PROJECT_TYPE=$2
   curl --location --request DELETE "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/$PROJECT_TYPE/$PROJECT_ID" \
   --header 'accept: */*' \
   --header 'Authorization: Basic YWRtaW46YWRtaW4='
   curl --location --request POST "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/rest/import" \
   --header 'accept: */*' \
   --header 'Authorization: Basic YWRtaW46YWRtaW4=' \
   --form "file=@\"project-$PROJECT_TYPE-$PROJECT_ID.xml\""
   RESULT="$PROJECT_ID imported correctly!!!"
   echo $RESULT
}
  CASTLEMOCK_HOST=localhost
  cd mitmproxy-docker
  git fetch
  git pull
  cd data/projects/castlemock
  import_project soap 7cGqrI
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
  curl --location --request DELETE "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/rest/a3ymXG" \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4='
  curl --location --request POST "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/rest/import" \
  --header 'accept: */*' \
  --header 'Authorization: Basic YWRtaW46YWRtaW4=' \
  --form 'file=@"project-rest-a3ymXG.xml"'
ENDSSH
