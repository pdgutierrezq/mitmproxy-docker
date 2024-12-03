#!/usr/bin/env bash
KEY=stg
EC2=rb-pb-stg-tcp-2657b3834f30a55c.elb.us-east-2.amazonaws.com
IDENTITY='LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQ0KTUlJRXBRSUJBQUtDQVFFQTFDbW5MUlVpTU03VXhuRldPdHkyU0dtdUVYU0ZrdklmUzhuL09HSmVDRUdNbDVsag0KYUJnbENCWnhRYk9lYW5PZ1JaZUNJSzE2YnhYeEZTaFRuM2pTRGZsd0tIcytkTG1IZzgwZll2Rm1pNyszTjFhSQ0KSkRPcm5zdUNiM1VaTHZPNXNJSlpHNkVqamxpRFBxTUNYbUNJWlBFRm8wdUE3dVRrUkdYaFBYMWJnbVlvd05wVA0KV3VGcEllWW45MUVkMVF4bldXNzZIeklhaVJkamhlMjZkc3NGMGd6Yi90UURtaXg0VnV1YmJGUUgwL1o2OENUMg0KdnhkWlJ4MWRwRmpaL2UyQkdJRXpCcWQzcFhJTUhHU0pmZW9PZ2lWQU83ZUdpMjhGaFgxQVV3REJEazVIU2RkRA0KdWdMM09WUjNtOFZ4NWJxVVJ1VzVDdGhqVXhwZXBNdmJCVnJQN3dJREFRQUJBb0lCQVFESGZzTXJxUXVWU1diWg0Ka2dpN0lINW1hTGk4d1F3NHVHS2xLVE5MR1hQQjM2RUxpN2ZsVVk3QXBCbXE1ZkszdGpHbVBtaWx3WG0ycXJNZQ0KYWVUM3R1d05KOWRHdVZ4bzlXdHZpNWxQdUIzc21rRDFUL0NEMmZJdVJyNUhmNXhHZ2ZiQStsQS9vcTJFVThaVg0KUjRJYXJEcVViKzRWTmhIdWtGdnoxTGlPMFNrUzJyUzlRSlNxU1BzdW4rTllSck9ad2d5ajVOOEs3Y3VQNUxKVA0KQkxEZldwZkJRY3VxM3kwZU45NzhTSU53UU1rVVlqaHB6VEkzd2VKT2N3YnBVcVRFTS8xdVB0Q01QVW1XUjZZTg0KdWszbzQ2NktISjRDK0ZPVjRGSjlpR0xrU2Q1VTdKdTNCdG1RU3lJaEtjVWREUm5jdEYyN0F3clhoSEZYZXU1UA0KS3N3Znk2UEJBb0dCQVA3ZjFBQWtza1FlK0JnUkRHVkc1VHVIUjVxN1FSM0xOUEwvUzlkYk9ram5UaXdRTzJVUg0KSU00eEFHMHVuSFZDbnhyMkVZODNwODhmYXBNNUdWV3VvZEpNSldrbUovcU4xYjFHOENldk5LRG5BejZRUGJQZA0KcmxWTHlkMm5Vc2xsdjAyS0N6Y05UWi9mK01SMUIxeG1VR1Y0UzdTMWNIcSt2amp2azNHeTh1b2xBb0dCQU5VWg0KaUlieDNYL29WSU9FNndvOStEZnRNeWlPTWRVcmZSRTJhUG1HRUxtY1g0UzFiQllGalVuQXVVdy9mb0VxUElDSA0KZnQybmxzZThaY1FGSFRvOGcvRGJtR0Q2ZG16Q2RkOGxXT0h4bVB0OWdpYkNyaEtQd25MQWM2eXBzdkVNeDRsdg0KNUhEUHlLUFYzbnRqMFNvcFlUdWF5WE5TNnBTTVZUWHEwbWMzcDFPREFvR0JBUForVmpRRlNYcmtVS0JGN0swTw0KRWFpdXZxdUFxZ3M4ZWVzQXlNSndja0FMbytpdGtpTyttdkdQSnBCeFlkTnVLUjRVR1F0ZmtpV1locVAzdHU3TQ0KdzZmMUNNRldxNWVBRU5UTGhIdDgwUE5FT0RrTG13RVhSZ0VzR1FFTFQ5K0RUYTZaOFJxKy9QRy8xSUY3aFREeA0KcXBOWDhpL0V3aEdUNDdpQXl5Sk5KTzBaQW9HQkFKSzl2MmIxWEVxODZKMmNST0hMcElhV2Z6ajVHZFdwMmJpbA0KbUFualNOY1htQ3JoWnltTzd5a1BYa25rR3kvRXJ0N3U3dXloZjlIUXFOOGZpbTNVeUNKdWhQS2E1anVrZU5pTg0KZGpRNFV0a3pKeEdiMDVTU2pCcks3WnpEU3FaMDMxNkR2M0h6a3oxR2c2ckNKSUY4OXlpOVFPVjUvbkVHWlpMNA0KUGFTNERUQVRBb0dBV01nVlRQcEdvWlhlcTdYemhSbm1HcWx0QlJ3NGVtZGtNenMzOCtndWIzOHlzbW84NUY1eQ0KcWdRTlk1c1VoY3BLS2ZhcnU4QWFiTkJYbThGaVdlZXlBUjN3UGlQdVo3cFY3MHpzbVVva3p2U3B6bUJjM0Yzbg0KZVBXaUl0S1Y1VzZwOTRDSXFrMzF4Y09MUlFDa04rQXduUHdiVjBBRHVneXQ5dEFpUTBBR1dDcz0NCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0t'
PROJECT_ID='bavv-pasivo-qa-frontend-stg'
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
  docker rm -f nodejs cypress
  docker run --rm --name nodejs -v $PWD:/app -w /app node:$NODEJS_VERSION chmod -R 777 /root && npm install
  docker run --rm --name cypress --cpus="3.5" --entrypoint /bin/bash -v $PWD:/e2e -w /e2e -e LIBVA_DRIVER_NAME="radeonsi chromium" -e ELECTRON_EXTRA_LAUNCH_ARGS=--disable-gpu -e CYPRESS_BROWSER -e ENVIRONMENT -e CYPRESS_TAGS cypress/included:$CYPRESS_VERSION -c "npm i typescript && export ENVIRONMENT=${ENVIRONMENT} && cypress run -b ${CYPRESS_BROWSER} --headless --reporter cypress-multi-reporters --reporter-options configFile=config.json -s \"${CYPRESS_SPEC}\" --env grepTags=\"${CYPRESS_TAGS}\""
#  docker run --rm --entrypoint /bin/bash -v $PWD:/e2e -w /e2e -e LIBVA_DRIVER_NAME="radeonsi chromium" -e ELECTRON_EXTRA_LAUNCH_ARGS=--disable-gpu cypress/included:$CYPRESS_VERSION -c "npm i typescript && export ENVIRONMENT=${ENVIRONMENT} CYPRESS_BROWSER=${CYPRESS_BROWSER} CYPRESS_TAGS=${CYPRESS_TAGS} && npm run test"
ENDSSH
