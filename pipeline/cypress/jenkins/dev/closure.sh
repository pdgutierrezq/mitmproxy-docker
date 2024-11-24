#!/usr/bin/env bash
KEY=dev
EC2=rb-pb-dev-tcp-3310d9a6094bf5a8.elb.us-east-2.amazonaws.com
IDENTITY='LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQ0KTUlJRXBBSUJBQUtDQVFFQWxRT20reU9CWktaMklPQkJpU0J5MS9zaWJXeTBuQzY3dndXM2VNVVV6c00yUUJ5cQ0KTVh3REwwLzlsdFJ1cGN5bCtJTzNiMXNXaEpLOC9TaUpuRWFzQ25VVSsxMGVQczBINkpGdE96TVl6V1BnMElRcw0KWnQvUFNKdTd6RzFMYWNjRFF5Tm1TTG44UnF3V2hlOWFQbzFaN2FmUmdTZnBiZ1BsMU9LWXFoVDVPbEwrUnpLTg0KOStDM3ZRTlRvL2x0UzA5SXFuTzhvV2NOVDd6L3ZhN3pKdjdiNHFycWZhY0xrN2RqcWJUeklOV2ZOYzluZEpkcg0KSGlaSlVLWXI5c1FGS1pCUFlPOFVUZjEvVlZMYUY0ZjhUZmRQL2pPV1hwejJHOHNXdlhLR1p6ZmNpbHphTTQ3dA0KSmNiMkhXVUI5Y1RIYyt4S2FXRkp2VFd2OHJlOFE2TzNUNEZ2VHdJREFRQUJBb0lCQUYvSk5EbjB6Y1QwRjdUMA0KVWt3aUZwQnM5dWxkMmc4WEgwb2dFNXJISEtQMzZkUjJXSlJzZ2VPVXlJNSt5UTA4cW1jL3k5Y0J0MHpLd2o3OQ0KSXMvWXdkZ0xBTXkvUTZUY3lMdWZWNWFaTnRVMzRaaEhqZjhtMktoMHF0Z3lYU3FHYWJ0cmN1Rkc1RHBOZmtEag0KNVorVjN2dWNSMWg5WGxpQW11a29LemdST1U5YWRJTThqLzhFY2ppS0duMENjK2dmRG5FT1psNXhrR2p3bVBTVw0KOURwSmRpVVYyZkZ1aWJDa3dwU2ZITDM0bEtnblNYQUFSTWhna3lTcS9rVUN5NXUyWG9vbysvZ0lSRzB2bVUxRw0KQm95TGxRWVhMSDl0UnRtUTB5Wk5HMkhYclNobWJSaUgzTEFBODRnVkhsTjFTOVYwU0FoTmp3bjhkeEhDaENUZA0KVEVvVjdCa0NnWUVBelBWNnRhSS8zc3VMY2VTVjVPK2RvOCtubVlGZEc2cDhlQ2pQV01YbEx1ZmZnTlF1UjBURw0KelU4d3g5anRha1pPSmpzd2IxSGhleGlJNitlakJYKzRJby9KUWdPRFBsNGN0bjhEUHRKcVptMFRkcWFlOVI0cA0KdTRmQWZscnpaNFZNM0sxMEZTK1FFNEhWdW9URWRmSm1GWkp3ZXpaSXMzTE9VNmNkd29IZ1FSVUNnWUVBdWgrWQ0KZ1ZqRWNicFJuQTBubnhIcnlMSUJIL2RVa1pYaU5oVm1UMXBXc053RmVJMyt6YThSSThRVVQxN3hScFdhcUpjRQ0KcEoyRis1bUlHQkUyZnE5ZVVmMzBrVlJFRlBLOUh4Wm5vaEVCQm80MnBiS2ZJdU53NVNFa1ZVUlZDblltT29lYw0KdDR4eFZkU3lUQ3Y1K096UGdLZzJTWnJCN25GSCs4S2xsZHl4WDlNQ2dZQXRMbVFaakNYR1NGcDZCZWpoS2MwMw0KWWp4UkE0cHg0ZGhFYU1La2tDTmdmcTd2YUZhM1VUcjk0Vm9nZy9wNk5mdGVSQ2YrTWkraGdod1UzT0E4QXhhbA0KVDhzTzZWVlNOMDdmRUFxNEc0eG0vZDZQaGxWK05XTC91d0k5R0hHVnZYWGZJOEYyTmlEdG0rNXdpbm9BZ2lucw0KMFhaSVF3UXR3cjRuQkt6enhzdVhyUUtCZ1FDQXRTaTVDYkdQRTlFcm9NMHRheThwOGk1azlKdytzTzlsaHhiZw0KK1EvSjdkeTZxVGJ5OVlWY3ZsTnRMN0tacFFyMldyaVRQWHRScWJJN01td0UzekRTY2xPVnpEZm9aSlB6MDRLRw0KeUV0MVJSTDFNcmhwWCs3S0JFa2p6Y1VoSHVNQXhwYlJOd1dJM1RVUEI3b3RNVld0R3FXdjhKejdUc3NBaG5JTA0KV0Rvd2tRS0JnUUNBc3BVQkM2R0tmbG42UXh3U1A1d2VEKzZwVmI4UERka2x5Y1JlMUlUVlRSQWhjL3JZT2dsLw0KNnYrK254ZmlLNVRVbjhWbURscDc1Tkk4TFJHMkZ4ZVBWRWpDTGhiOXN2bkFleHZFTTU2RVEzWmFzaWNIUkx3Vg0KN1psK090L2pPY3FrYjM0azBQNTdNNis1amJaY0tUMWdMaGV5YklWT2preDBPK2hkN3k2ZTZBPT0NCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0t'
ROOT_DIR="$PWD"
KEY_PATH="$ROOT_DIR/$KEY"
set_ssh_key(){
  KEY_PATH=$1
  IDENTITY=$2
  echo $IDENTITY | base64 -d > "$KEY_PATH"
  chmod -R 700 "$KEY_PATH"
}
set_ssh_key "$KEY_PATH" "$IDENTITY"
ssh -o StrictHostKeyChecking=no -i "$KEY_PATH" "ec2-user@$EC2" <<'ENDSSH'
  WORK_DIR="/home/ec2-user/jenkins"
  . "$WORK_DIR/env"
  REPORT_ABSOLUTE_PATH="$WORK_DIR/$GIT_PROJECT_NAME/$REPORT_PATH"
  cd "$WORK_DIR/$GIT_PROJECT_NAME"
  if [ $? -eq 0 ];then
  #  docker run --rm -v $PWD:/app -w /app -e JIRA_TOKEN="$JIRA_TOKEN" -e XRAY_CLIENT_ID="$XRAY_CLIENT_ID" -e XRAY_CLIENT_TOKEN="$XRAY_CLIENT_TOKEN" -e XRAY_TEST_PLAN_KEY="$XRAY_TEST_PLAN_KEY" node:$NODEJS_VERSION /bin/bash -c "apt update && apt-get install -y software-properties-common && add-apt-repository 'deb http://security.debian.org/debian-security stretch/updates main' && apt update && apt install -y openjdk-8-jdk && chmod -R 777 /app && export npm_config_cache=./.npm-cache && npm run test:reports"
    docker run --rm -v $PWD:/app -w /app -e JIRA_TOKEN="$JIRA_TOKEN" -e XRAY_CLIENT_ID="$XRAY_CLIENT_ID" -e XRAY_CLIENT_TOKEN="$XRAY_CLIENT_TOKEN" -e XRAY_TEST_PLAN_KEY="$XRAY_TEST_PLAN_KEY" node:$NODEJS_VERSION /bin/bash -c "chmod -R 777 /app && export npm_config_cache=./.npm-cache && npm run test:reports"
    cd $REPORT_ABSOLUTE_PATH
    REPORT_INDEX_FILE=$(find . -type f -regex ".*.html" | head -n 1)
    echo "[INFO] REPORT PATH: $WORK_DIR/$GIT_PROJECT_NAME/$REPORT_PATH"
    echo "[INFO] REPORT_INDEX_FILE: $REPORT_INDEX_FILE"
    sudo mv -f $REPORT_INDEX_FILE index.html
    ZIP_FILE="$WORK_DIR/report.zip"
    zip $ZIP_FILE -rq .
  else
    echo "Error un-existent directory:$WORK_DIR/$GIT_PROJECT_NAME"
  fi
ENDSSH
FILE_NAME="report.zip"
SRC_PATH="/home/ec2-user/jenkins/$FILE_NAME"
TARGET_PATH="."
PIPELINE_TARGET_PATH="./target/site/serenity"
scp -i "$KEY_PATH" "ec2-user@$EC2:$SRC_PATH" "$TARGET_PATH"
rm -rf "$PIPELINE_TARGET_PATH"
mkdir -p "$PIPELINE_TARGET_PATH"
unzip -q "$TARGET_PATH/$FILE_NAME" -d "$PIPELINE_TARGET_PATH"
ls -Rl $PIPELINE_TARGET_PATH
ssh -o StrictHostKeyChecking=no -i "$KEY_PATH" "ec2-user@$EC2" <<'ENDSSH'
  ps aux --width 100 --sort -%cpu | head -15
  sudo pkill -f .*Cypress.*
  sudo pkill -f .*node.*
  sudo pkill -f .*chrome.*
  sudo pkill -f .*zip.*
  echo && ps aux --width 100 --sort -%cpu | head -15
ENDSSH
REPORT_RAW='<!DOCTYPE html> <html lang="en"> <head> <title>RPT</title> <script> let BASE_URL = ""; BASE_URL = "https://rb-pasivo.adl-avvillas-stg.net/castlemock/mock/rest/project/4QMiEm/application/zDkEGo/"; </script> <script> document.head.innerHTML += `<link rel="stylesheet" href="${BASE_URL}rpt/style.css">`; </script> </head> <body> <div id="root"></div> <script> document.write(`<script src="${BASE_URL}rpt/script.js"><\/script>`); </script> </body> </html>'
echo $REPORT_RAW > "$PIPELINE_TARGET_PATH/rpt.html"
