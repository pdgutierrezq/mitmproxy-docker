#!/usr/bin/env bash
KEY=stg
EC2=rb-pb-stg-tcp-2657b3834f30a55c.elb.us-east-2.amazonaws.com
IDENTITY='LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQ0KTUlJRXBRSUJBQUtDQVFFQTFDbW5MUlVpTU03VXhuRldPdHkyU0dtdUVYU0ZrdklmUzhuL09HSmVDRUdNbDVsag0KYUJnbENCWnhRYk9lYW5PZ1JaZUNJSzE2YnhYeEZTaFRuM2pTRGZsd0tIcytkTG1IZzgwZll2Rm1pNyszTjFhSQ0KSkRPcm5zdUNiM1VaTHZPNXNJSlpHNkVqamxpRFBxTUNYbUNJWlBFRm8wdUE3dVRrUkdYaFBYMWJnbVlvd05wVA0KV3VGcEllWW45MUVkMVF4bldXNzZIeklhaVJkamhlMjZkc3NGMGd6Yi90UURtaXg0VnV1YmJGUUgwL1o2OENUMg0KdnhkWlJ4MWRwRmpaL2UyQkdJRXpCcWQzcFhJTUhHU0pmZW9PZ2lWQU83ZUdpMjhGaFgxQVV3REJEazVIU2RkRA0KdWdMM09WUjNtOFZ4NWJxVVJ1VzVDdGhqVXhwZXBNdmJCVnJQN3dJREFRQUJBb0lCQVFESGZzTXJxUXVWU1diWg0Ka2dpN0lINW1hTGk4d1F3NHVHS2xLVE5MR1hQQjM2RUxpN2ZsVVk3QXBCbXE1ZkszdGpHbVBtaWx3WG0ycXJNZQ0KYWVUM3R1d05KOWRHdVZ4bzlXdHZpNWxQdUIzc21rRDFUL0NEMmZJdVJyNUhmNXhHZ2ZiQStsQS9vcTJFVThaVg0KUjRJYXJEcVViKzRWTmhIdWtGdnoxTGlPMFNrUzJyUzlRSlNxU1BzdW4rTllSck9ad2d5ajVOOEs3Y3VQNUxKVA0KQkxEZldwZkJRY3VxM3kwZU45NzhTSU53UU1rVVlqaHB6VEkzd2VKT2N3YnBVcVRFTS8xdVB0Q01QVW1XUjZZTg0KdWszbzQ2NktISjRDK0ZPVjRGSjlpR0xrU2Q1VTdKdTNCdG1RU3lJaEtjVWREUm5jdEYyN0F3clhoSEZYZXU1UA0KS3N3Znk2UEJBb0dCQVA3ZjFBQWtza1FlK0JnUkRHVkc1VHVIUjVxN1FSM0xOUEwvUzlkYk9ram5UaXdRTzJVUg0KSU00eEFHMHVuSFZDbnhyMkVZODNwODhmYXBNNUdWV3VvZEpNSldrbUovcU4xYjFHOENldk5LRG5BejZRUGJQZA0KcmxWTHlkMm5Vc2xsdjAyS0N6Y05UWi9mK01SMUIxeG1VR1Y0UzdTMWNIcSt2amp2azNHeTh1b2xBb0dCQU5VWg0KaUlieDNYL29WSU9FNndvOStEZnRNeWlPTWRVcmZSRTJhUG1HRUxtY1g0UzFiQllGalVuQXVVdy9mb0VxUElDSA0KZnQybmxzZThaY1FGSFRvOGcvRGJtR0Q2ZG16Q2RkOGxXT0h4bVB0OWdpYkNyaEtQd25MQWM2eXBzdkVNeDRsdg0KNUhEUHlLUFYzbnRqMFNvcFlUdWF5WE5TNnBTTVZUWHEwbWMzcDFPREFvR0JBUForVmpRRlNYcmtVS0JGN0swTw0KRWFpdXZxdUFxZ3M4ZWVzQXlNSndja0FMbytpdGtpTyttdkdQSnBCeFlkTnVLUjRVR1F0ZmtpV1locVAzdHU3TQ0KdzZmMUNNRldxNWVBRU5UTGhIdDgwUE5FT0RrTG13RVhSZ0VzR1FFTFQ5K0RUYTZaOFJxKy9QRy8xSUY3aFREeA0KcXBOWDhpL0V3aEdUNDdpQXl5Sk5KTzBaQW9HQkFKSzl2MmIxWEVxODZKMmNST0hMcElhV2Z6ajVHZFdwMmJpbA0KbUFualNOY1htQ3JoWnltTzd5a1BYa25rR3kvRXJ0N3U3dXloZjlIUXFOOGZpbTNVeUNKdWhQS2E1anVrZU5pTg0KZGpRNFV0a3pKeEdiMDVTU2pCcks3WnpEU3FaMDMxNkR2M0h6a3oxR2c2ckNKSUY4OXlpOVFPVjUvbkVHWlpMNA0KUGFTNERUQVRBb0dBV01nVlRQcEdvWlhlcTdYemhSbm1HcWx0QlJ3NGVtZGtNenMzOCtndWIzOHlzbW84NUY1eQ0KcWdRTlk1c1VoY3BLS2ZhcnU4QWFiTkJYbThGaVdlZXlBUjN3UGlQdVo3cFY3MHpzbVVva3p2U3B6bUJjM0Yzbg0KZVBXaUl0S1Y1VzZwOTRDSXFrMzF4Y09MUlFDa04rQXduUHdiVjBBRHVneXQ5dEFpUTBBR1dDcz0NCi0tLS0tRU5EIFJTQSBQUklWQVRFIEtFWS0tLS0t'
PROJECT_ID='bavv-pasivo-qa-frontend-stg'
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
REPORT_RAW='<!DOCTYPE html> <html lang="en"> <head> <title>Pasivo E2E Report</title> <style> .iframe { display: inline-block; width: 100%; height: 100%; } body { font-family: Arial, sans-serif; margin: 0; padding: 0; } .top-menu { top: 0; left: 0; width: 100%; background-color: #333; color: white; display: flex; justify-content: center; padding: 10px 0; } .menu-item { margin: 0 10px; cursor: pointer; } .content { padding-top: 0px; } .iframe-container { display: inline-block; width: 48%; margin-right: 1%; height: 500px; } .iframe-container input { width: 100%; font-size: 90%; padding-inline: 0px } </style> </head> <body> <div class="top-menu"> <div class="menu-item" onclick="loadPage(`dev`)">Develop</div> <div class="menu-item" onclick="loadPage(`stg`)">Stage</div> </div> <div class="content" id="content"> <!-- The iframe containers will be generated here --> </div> <script src="script.js"></script> </body> </html>'
echo $REPORT_RAW > "$PIPELINE_TARGET_PATH/rpt.html"
REPORT_RAW='const iframes = [ { id: 1, value: "bavv-pasivo-qa-api-dev/Test" }, { id: 2, value: "bavv-pasivo-qa-frontend-dev-cda/Serenity" }, { id: 3, value: "bavv-pasivo-qa-frontend-dev-cdt/Serenity" }, { id: 4, value: "bavv-pasivo-qa-frontend-dev-cncc/Serenity" }, { id: 5, value: "bavv-pasivo-qa-frontend-dev-cnsc/Serenity" }, { id: 6, value: "bavv-pasivo-qa-frontend-dev-cpcol/Serenity" }, { id: 7, value: "bavv-pasivo-qa-frontend-dev-deposit/Serenity" }, { id: 8, value: "bavv-pasivo-qa-api-dev-channels/Test" }, { id: 9, value: "bavv-pasivo-qa-frontend-dev-channels-cda/Serenity" }, { id: 10, value: "bavv-pasivo-qa-frontend-dev-channels-cdt/Serenity" }, { id: 11, value: "bavv-pasivo-qa-frontend-dev-channels-cnsc/Serenity" }, { id: 12, value: "bavv-pasivo-qa-frontend-dev-deposit-mfe/Serenity" } ]; function loadPage(pageUrl, iframes) { loadIframes(iframes) if (pageUrl === `stg`) { for (let i = 1; i <= iframes.length; i++) { const inputField = document.getElementById(`input` + i); inputField.value = inputField.value.replace(`dev`, `stg`); } } else { for (let i = 1; i <= iframes.length; i++) { const inputField = document.getElementById(`input` + i); inputField.value = inputField.value.replace(`stg`, `dev`); } } reloadIframes(iframes.length); } function loadIframes(iframes) { const content = document.getElementById('content'); iframes.forEach(data => { const container = document.createElement('div'); container.className = 'iframe-container'; container.innerHTML = ` <input type="text" id="input${data.id}" value="${data.value}" oninput="changeIframeSrc('iframe${data.id}')"> <iframe id="iframe${data.id}" class="iframe"></iframe> `; content.appendChild(container); }); } function changeIframeSrc(iframeId) { const baseUrl = "https://jenkins.rb-pre-ops.net/view/bavv-pasivo-qa/job/"; const input = baseUrl + document.getElementById( `input` + iframeId.slice(-1)).value; document.getElementById(iframeId).src = input; } function reloadIframes(iframesNumber) { const baseUrl = "https://jenkins.rb-pre-ops.net/view/bavv-pasivo-qa/job/"; for (let i = 1; i <= iframesNumber; i++) { document.getElementById(`iframe` + i).src = baseUrl + document.getElementById(`input` + i).value; } } window.onload = function () { loadPage(`dev`,iframes); };'
echo $REPORT_RAW > "$PIPELINE_TARGET_PATH/script.js"
