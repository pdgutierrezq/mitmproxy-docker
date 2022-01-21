#!/usr/bin/env bash
sh ./git.sh
ssh -i "rb-pb-dev-ecs-auto.pem" "ec2-user@$EC2" <<'ENDSSH'
  import_project(){
     PROJECT_TYPE=$1
     PROJECT_ID=$2
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
  import_project rest a3ymXG
  import_project rest WJBLM5
  import_project soap 7cGqrI
  import_project soap szT8NH
  import_project soap WHtzrB
  import_project soap wn0iz3
ENDSSH
