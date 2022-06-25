#!/usr/bin/env bash
sh ./git.sh
ssh -i "$KEY" "ec2-user@$EC2" <<'ENDSSH'
  import_project(){
     PROJECT_TYPE=$1
     PROJECT_ID=$2
     curl --location --request DELETE "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/$PROJECT_TYPE/$PROJECT_ID" \
     --header 'accept: */*' \
     --header 'Authorization: Basic YWRtaW46YWRtaW4='
     curl --location --request POST "http://$CASTLEMOCK_HOST/castlemock/api/rest/core/project/$PROJECT_TYPE/import" \
     --header 'accept: */*' \
     --header 'Authorization: Basic YWRtaW46YWRtaW4=' \
     --form "file=@\"$PROJECT_TYPE-$PROJECT_ID.xml\""
     RESULT="$PROJECT_ID imported correctly!!!"
     echo $RESULT
  }
  CASTLEMOCK_HOST=localhost
  cd mitmproxy-docker
  git fetch
  git pull
  cd data/projects/castlemock
  for line in `ls`;
    do
     IFS='-|.'
     read -ra arr <<< "$line"
     import_project "${arr[1]}" "${arr[2]}"
    done
ENDSSH
