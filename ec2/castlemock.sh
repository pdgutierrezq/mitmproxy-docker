#!/usr/bin/env bash
sh ./git.sh
ssh -i "rb-pb-dev-ecs-auto.pem" "ec2-user@$EC2" <<'ENDSSH'
import_project(){
   PROJECT_ID=$1
   PROJECT_TYPE=$2
   curl --location --request DELETE "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/$PROJECT_TYPE/$PROJECT_ID" \
   --header 'accept: */*' \
   --header 'Authorization: Basic YWRtaW46YWRtaW4='
   curl --location --request POST "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/$PROJECT_TYPE/import" \
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
ENDSSH
