#!/usr/bin/env bash
export_project(){
   PROJECT_TYPE=$1
   PROJECT_ID=$2
   curl --location --request GET "http://$EC2/castlemock/web/$PROJECT_TYPE/project/$PROJECT_ID/export" \
   --header 'accept: */*' \
   --header 'Authorization: Basic YWRtaW46YWRtaW4=' \
   -H "Cookie: $COOKIE" \
   > "project-$PROJECT_TYPE-$PROJECT_ID.xml"
   RESULT="$PROJECT_ID exported correctly!!!"
   echo $RESULT
}
cd ../data/projects/castlemock
for line in `ls`;
  do
   IFS='-|.'
   read -ra arr <<< "$line"
   export_project "${arr[1]}" "${arr[2]}"
  done

