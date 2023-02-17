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
#  docker run --rm -v $PWD:/app -w /app -e JIRA_TOKEN="$JIRA_TOKEN" -e XRAY_CLIENT_ID="$XRAY_CLIENT_ID" -e XRAY_CLIENT_TOKEN="$XRAY_CLIENT_TOKEN" -e XRAY_TEST_PLAN_KEY="$XRAY_TEST_PLAN_KEY" node:$NODEJS_VERSION /bin/bash -c "apt update && apt-get install -y software-properties-common && add-apt-repository 'deb http://security.debian.org/debian-security stretch/updates main' && apt update && apt install -y openjdk-8-jdk && chmod -R 777 /app && export npm_config_cache=./.npm-cache && npm run test:reports"
  docker run --rm -v $PWD:/app -w /app -e JIRA_TOKEN="$JIRA_TOKEN" -e XRAY_CLIENT_ID="$XRAY_CLIENT_ID" -e XRAY_CLIENT_TOKEN="$XRAY_CLIENT_TOKEN" -e XRAY_TEST_PLAN_KEY="$XRAY_TEST_PLAN_KEY" node:$NODEJS_VERSION /bin/bash -c "chmod -R 777 /app && export npm_config_cache=./.npm-cache && npm run test:reports"
  cd $REPORT_ABSOLUTE_PATH
  REPORT_INDEX_FILE=$(find . -type f -regex ".*.html" | head -n 1)
  echo "[INFO] REPORT PATH: $WORK_DIR/$GIT_PROJECT_NAME/$REPORT_PATH"
  echo "[INFO] REPORT_INDEX_FILE: $REPORT_INDEX_FILE"
  sudo mv -f $REPORT_INDEX_FILE index.html
  ZIP_FILE="$WORK_DIR/report.zip"
  zip $ZIP_FILE -rq .
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
