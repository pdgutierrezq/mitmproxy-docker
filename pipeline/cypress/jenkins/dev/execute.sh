#!/usr/bin/env bash
KEY=dev
EC2=rb-pb-dev-tcp-3310d9a6094bf5a8.elb.us-east-2.amazonaws.com
IDENTITY='LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQ0KTUlJRXBBSUJBQUtDQVFFQWxRT20reU9CWktaMklPQkJpU0J5MS9zaWJXeTBuQzY3dndXM2VNVVV6c00yUUJ5cQ0KTVh3REwwLzlsdFJ1cGN5bCtJTzNiMXNXaEpLOC9TaUpuRWFzQ25VVSsxMGVQczBINkpGdE96TVl6V1BnMElRcw0KWnQvUFNKdTd6RzFMYWNjRFF5Tm1TTG44UnF3V2hlOWFQbzFaN2FmUmdTZnBiZ1BsMU9LWXFoVDVPbEwrUnpLTg0KOStDM3ZRTlRvL2x0UzA5SXFuTzhvV2NOVDd6L3ZhN3pKdjdiNHFycWZhY0xrN2RqcWJUeklOV2ZOYzluZEpkcg0KSGlaSlVLWXI5c1FGS1pCUFlPOFVUZjEvVlZMYUY0ZjhUZmRQL2pPV1hwejJHOHNXdlhLR1p6ZmNpbHphTTQ3dA0KSmNiMkhXVUI5Y1RIYyt4S2FXRkp2VFd2OHJlOFE2TzNUNEZ2VHdJREFRQUJBb0lCQUYvSk5EbjB6Y1QwRjdUMA0KVWt3aUZwQnM5dWxkMmc4WEgwb2dFNXJISEtQMzZkUjJXSlJzZ2VPVXlJNSt5UTA4cW1jL3k5Y0J0MHpLd2o3OQ0KSXMvWXdkZ0xBTXkvUTZUY3lMdWZWNWFaTnRVMzRaaEhqZjhtMktoMHF0Z3lYU3FHYWJ0cmN1Rkc1RHBOZmtEag0KNVorVjN2dWNSMWg5WGxpQW11a29LemdST1U5YWRJTThqLzhFY2ppS0duMENjK2dmRG5FT1psNXhrR2p3bVBTVw0KOURwSmRpVVYyZkZ1aWJDa3dwU2ZITDM0bEtnblNYQUFSTWhna3lTcS9rVUN5NXUyWG9vbysvZ0lSRzB2bVUxRw0KQm95TGxRWVhMSDl0UnRtUTB5Wk5HMkhYclNobWJSaUgzTEFBODRnVkhsTjFTOVYwU0FoTmp3bjhkeEhDaENUZA0KVEVvVjdCa0NnWUVBelBWNnRhSS8zc3VMY2VTVjVPK2RvOCtubVlGZEc2cDhlQ2pQV01YbEx1ZmZnTlF1UjBURw0KelU4d3g5anRha1pPSmpzd2IxSGhleGlJNitlakJYKzRJby9KUWdPRFBsNGN0bjhEUHRKcVptMFRkcWFlOVI0cA0KdTRmQWZscnpaNFZNM0sxMEZTK1FFNEhWdW9URWRmSm1GWkp3ZXpaSXMzTE9VNmNkd29IZ1FSVUNnWUVBdWgrWQ0KZ1ZqRWNicFJuQTBubnhIcnlMSUJIL2RVa1pYaU5oVm1UMXBXc053RmVJMyt6YThSSThRVVQxN3hScFdhcUpjRQ0KcEoyRis1bUlHQkUyZnE5ZVVmMzBrVlJFRlBLOUh4Wm5vaEVCQm80MnBiS2ZJdU53NVNFa1ZVUlZDblltT29lYw0KdDR4eFZkU3lUQ3Y1K096UGdLZzJTWnJCN25GSCs4S2xsZHl4WDlNQ2dZQXRMbVFaakNYR1NGcDZCZWpoS2MwMw0KWWp4UkE0cHg0ZGhFYU1La2tDTmdmcTd2YUZhM1VUcjk0Vm9nZy9wNk5mdGVSQ2YrTWkraGdod1UzT0E4QXhhbA0KVDhzTzZWVlNOMDdmRUFxNEc0eG0vZDZQaGxWK05XTC91d0k5R0hHVnZYWGZJOEYyTmlEdG0rNXdpbm9BZ2lucw0KMFhaSVF3UXR3cjRuQkt6enhzdVhyUUtCZ1FDQXRTaTVDYkdQRTlFcm9NMHRheThwOGk1azlKdytzTzlsaHhiZw0KK1EvSjdkeTZxVGJ5OVlWY3ZsTnRMN0tacFFyMldyaVRQWHRScWJJN01td0UzekRTY2xPVnpEZm9aSlB6MDRLRw0KeUV0MVJSTDFNcmhwWCs3S0JFa2p6Y1VoSHVNQXhwYlJOd1dJM1RVUEI3b3RNVld0R3FXdjhKejdUc3NBaG5JTA0KV0Rvd2tRS0JnUUNBc3BVQkM2R0tmbG42UXh3U1A1d2VEKzZwVmI4UERka2x5Y1JlMUlUVlRSQWhjL3JZT2dsLw0KNnYrK254ZmlLNVRVbjhWbURscDc1Tkk4TFJHMkZ4ZVBWRWpDTGhiOXN2bkFleHZFTTU2RVEzWmFzaWNIUkx3Vg0KN1psK090L2pPY3FrYjM0azBQNTdNNis1amJaY0tUMWdMaGV5YklWT2preDBPK2hkN3k2ZTZBPT0NCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0t'
ROOT_DIR="$PWD"
KEY_PATH="$ROOT_DIR/$KEY"
WORK_DIR="$ROOT_DIR/git"
PROJECT_ID="$(basename $(dirname $ROOT_DIR))"
ZIP_FILE_NAME="$(basename $WORK_DIR).zip"

set_ssh_key(){
  KEY_PATH=$1
  IDENTITY=$2
  echo $IDENTITY | base64 -d > "$KEY_PATH"
  chmod -R 700 "$KEY_PATH"
}
clean(){
  WORK_DIR=$1
  rm -rf "$WORK_DIR"
  mkdir -p "$WORK_DIR"
}
setup(){
  LOCAL_DIR="/root"
  SSH_DIR="$LOCAL_DIR/.ssh"
  SSH_FILE="$SSH_DIR/id_rsa"
  KNOW_HOST_FILE="$SSH_DIR/known_hosts"
  mkdir -p "$SSH_DIR"
  apk add curl git zip openssh-client
  curl --request GET 'http://rb-pb-stg-1793261678.us-east-2.elb.amazonaws.com/castlemock/mock/rest/project/4QMiEm/application/gr1SS8/config' --header 'key:*' | base64 -d > "$SSH_FILE"
  chmod -R 700 "$SSH_DIR"
  ssh-keyscan ssh-keyscan github.com > "$KNOW_HOST_FILE"
  ssh-keygen -R hostname
}
clone(){
  ZIP_FILE_NAME=$1
  cd $WORK_DIR
  PROJECT_ID=$2
  JOB_DEFINITION="$(curl --request GET 'http://rb-pb-stg-1793261678.us-east-2.elb.amazonaws.com/castlemock/mock/rest/project/4QMiEm/application/gr1SS8/config' --header "project:$PROJECT_ID")"
  GIT_URL=$(echo $JOB_DEFINITION | jq -r '.repository.url')
  GIT_BRANCH=$(echo $JOB_DEFINITION | jq -r '.repository.branch')
  git clone -b $GIT_BRANCH $GIT_URL
  zip $ZIP_FILE_NAME -rq .
  SRC_PATH="/home/ec2-user/jenkins/$ZIP_FILE_NAME"
  ls -l $WORK_DIR
}
set_env(){
   echo "export PROJECT_ID=$PROJECT_ID" > $ROOT_DIR/env
   scp -i "$KEY_PATH" "$ROOT_DIR/env" "ec2-user@$EC2:~/.ssh/environment"
}

if [ -z "$SETUP" ]
then
  setup
fi
set_ssh_key "$KEY_PATH" "$IDENTITY"
clean "$WORK_DIR"
clone "$ZIP_FILE_NAME" "$PROJECT_ID"
ssh -o StrictHostKeyChecking=no -i "$KEY_PATH" "ec2-user@$EC2" <<'ENDSSH'
  WORK_DIR="/home/ec2-user/jenkins"
  sudo rm -rf "$WORK_DIR"
  mkdir -p "$WORK_DIR"
  ps aux --width 100 --sort -%cpu | head -15
  docker stop cypress nodejs
  sudo pkill -f .*Cypress.*
  sudo pkill -f .*node.*
  sudo pkill -f .*chrome.*
  sudo pkill -f .*zip.*
  echo && ps aux --width 100 --sort -%cpu | head -15
ENDSSH
scp -i "$KEY_PATH" "$WORK_DIR/$ZIP_FILE_NAME" "ec2-user@$EC2:$SRC_PATH"
ssh -o StrictHostKeyChecking=no -i "$KEY_PATH" "ec2-user@$EC2" <<'ENDSSH'
  WORK_DIR="/home/ec2-user/jenkins"
  cd "$WORK_DIR"
  unzip -q "$WORK_DIR/git.zip" -d "."
  sudo chmod -R 777 "$WORK_DIR"
ENDSSH
set_env
ssh -o StrictHostKeyChecking=no -i "$KEY_PATH" "ec2-user@$EC2" <<'ENDSSH'
  . ~/.ssh/environment
  cat ~/.ssh/environment
  JOB_DEFINITION="$(curl --request GET 'http://rb-pb-stg-1793261678.us-east-2.elb.amazonaws.com/castlemock/mock/rest/project/4QMiEm/application/gr1SS8/config' --header "project:$PROJECT_ID")"
  GIT_URL=$(echo $JOB_DEFINITION | jq -r '.repository.url')
  GIT_BRANCH=$(echo $JOB_DEFINITION | jq -r '.repository.branch')
  ENVIRONMENT=$(echo $JOB_DEFINITION | jq -r '.environment')
  REPORT_PATH=$(echo $JOB_DEFINITION | jq -r '.cypress.report')
  NODEJS_VERSION=$(echo $JOB_DEFINITION | jq -r '.nodejs.version')
  CYPRESS_VERSION=$(echo $JOB_DEFINITION | jq -r '.cypress.version')
  CYPRESS_SPEC=$(echo $JOB_DEFINITION | jq -r '.cypress.spec')
  CYPRESS_TAGS=$(echo $JOB_DEFINITION | jq -r '.cypress.tags')
  CYPRESS_BROWSER=$(echo $JOB_DEFINITION | jq -r '.cypress.browser')
  TESTRAIL_TESTRUN_NAME=$(echo $JOB_DEFINITION | jq -r '.testrail.testrun.name')
  TESTRAIL_USERNAME=$(echo $JOB_DEFINITION | jq -r '.testrail.username')
  TESTRAIL_PASSWORD=$(echo $JOB_DEFINITION | jq -r '.testrail.password')
  JIRA_TOKEN=$(echo $JOB_DEFINITION | jq -r '.jira.token')
  XRAY_TEST_PLAN_KEY=$(echo $JOB_DEFINITION | jq -r '.xray.testPlan.key')
  XRAY_CLIENT_ID=$(echo $JOB_DEFINITION | jq -r '.xray.client.id')
  XRAY_CLIENT_TOKEN=$(echo $JOB_DEFINITION | jq -r '.xray.client.token')
  GIT_PROJECT=$(basename $GIT_URL)
  GIT_PROJECT_NAME=${GIT_PROJECT%.*}
  WORK_DIR="/home/ec2-user/jenkins"
  cd "$WORK_DIR"
  echo "export GIT_URL=$GIT_URL" > env
  echo "export GIT_BRANCH=$GIT_BRANCH" >> env
  echo "export GIT_PROJECT_NAME=$GIT_PROJECT_NAME" >> env
  echo "export REPORT_PATH=$REPORT_PATH" >> env
  echo "export ENVIRONMENT=$ENVIRONMENT" >> env
  echo "export NODEJS_VERSION=$NODEJS_VERSION" >> env
  echo "export CYPRESS_VERSION=$CYPRESS_VERSION" >> env
  echo "export CYPRESS_SPEC=\"$CYPRESS_SPEC\"" >> env
  echo "export CYPRESS_TAGS=\"$CYPRESS_TAGS\"" >> env
  echo "export CYPRESS_BROWSER=$CYPRESS_BROWSER" >> env
  echo "export JIRA_TOKEN=$JIRA_TOKEN" >> env
  echo "export XRAY_TEST_PLAN_KEY=$XRAY_TEST_PLAN_KEY" >> env
  echo "export XRAY_CLIENT_ID=$XRAY_CLIENT_ID" >> env
  echo "export XRAY_CLIENT_TOKEN=$XRAY_CLIENT_TOKEN" >> env
  cat env
  cd $GIT_PROJECT_NAME
  sudo sh -c "echo nameserver 8.8.8.8 > /etc/resolv.conf"
  # Debug: export NODEJS_VERSION=20.3.0-alpine && docker run -it --rm -v $PWD:/app -w /app node:$NODEJS_VERSION sh
  # Debug: export NODEJS_VERSION=20.3.0 && docker run -it --rm -v $PWD:/app -w /app node:$NODEJS_VERSION bash
  # Debug: export CYPRESS_VERSION=12.14.0 && export ENVIRONMENT=dev && export CYPRESS_BROWSER=chrome && export CYPRESS_TAGS=@regression:yes && docker run --rm --entrypoint /bin/bash -v $PWD:/e2e -w /e2e -e LIBVA_DRIVER_NAME="radeonsi chromium" -e ELECTRON_EXTRA_LAUNCH_ARGS=--disable-gpu cypress/included:$CYPRESS_VERSION -c "npm i typescript && export ENVIRONMENT=${ENVIRONMENT} CYPRESS_BROWSER=${CYPRESS_BROWSER} CYPRESS_TAGS=${CYPRESS_TAGS} && npm run test"
  docker run --rm --name nodejs -v $PWD:/app -w /app node:$NODEJS_VERSION chmod -R 777 /root && npm install
  docker run --rm --name cypress --cpus="3.5" --entrypoint /bin/bash -v $PWD:/e2e -w /e2e -e LIBVA_DRIVER_NAME="radeonsi chromium" -e ELECTRON_EXTRA_LAUNCH_ARGS=--disable-gpu -e CYPRESS_BROWSER -e ENVIRONMENT -e CYPRESS_TAGS cypress/included:$CYPRESS_VERSION -c "npm i typescript && export ENVIRONMENT=${ENVIRONMENT} && cypress run -b ${CYPRESS_BROWSER} --headless --reporter cypress-multi-reporters --reporter-options configFile=config.json -s \"${CYPRESS_SPEC}\" --env grepTags=\"${CYPRESS_TAGS}\""
#  docker run --rm --entrypoint /bin/bash -v $PWD:/e2e -w /e2e -e LIBVA_DRIVER_NAME="radeonsi chromium" -e ELECTRON_EXTRA_LAUNCH_ARGS=--disable-gpu cypress/included:$CYPRESS_VERSION -c "npm i typescript && export ENVIRONMENT=${ENVIRONMENT} CYPRESS_BROWSER=${CYPRESS_BROWSER} CYPRESS_TAGS=${CYPRESS_TAGS} && npm run test"
ENDSSH
