set_ssh_key(){
  KEY=$1
  IDENTITY=$2
  echo $IDENTITY | base64 -d > "$KEY"
  chmod -R 700 "$KEY"
}
set_ssh_key "$KEY" "$IDENTITY"
ssh -o StrictHostKeyChecking=no -i "$KEY" "ec2-user@$EC2" <<'ENDSSH'
  WORK_DIR="/home/ec2-user/jenkins"
  . "$WORK_DIR/env"
  REPORT_ABSOLUTE_PATH="$WORK_DIR/$GIT_PROJECT_NAME/$REPORT_PATH"
  cd "$WORK_DIR/$GIT_PROJECT_NAME"
  docker run --rm -v $PWD:/app -e TESTRAIL_TESTRUN_NAME="$TESTRAIL_TESTRUN_NAME" -e TESTRAIL_USERNAME=$TESTRAIL_USERNAME -e TESTRAIL_PASSWORD=$TESTRAIL_PASSWORD bitnami/node:$NODEJS_VERSION /bin/bash -c "apt update && apt-get install -y software-properties-common && add-apt-repository 'deb http://security.debian.org/debian-security stretch/updates main' && apt update && apt install -y openjdk-8-jdk && npm run test:reports"
  cd $REPORT_ABSOLUTE_PATH
  REPORT_INDEX_FILE=$(find . -type f -regex ".*.html" | head -n 1)
  echo "[INFO] REPORT PATH: $WORK_DIR/$GIT_PROJECT_NAME/$REPORT_PATH"
  echo "[INFO] REPORT_INDEX_FILE: $REPORT_INDEX_FILE"
  sudo mv -f $REPORT_INDEX_FILE index.html
  ls -l
  ZIP_FILE="$WORK_DIR/report.zip"
  zip $ZIP_FILE -r .
ENDSSH
FILE_NAME="report.zip"
SRC_PATH="/home/ec2-user/jenkins/$FILE_NAME"
TARGET_PATH="."
PIPELINE_TARGET_PATH="./target/site/serenity"
scp -i "$KEY" "ec2-user@$EC2:$SRC_PATH" "$TARGET_PATH"
rm -rf "$PIPELINE_TARGET_PATH"
mkdir -p "$PIPELINE_TARGET_PATH"
unzip "$TARGET_PATH/$FILE_NAME" -d "$PIPELINE_TARGET_PATH"
ls -Rl $PIPELINE_TARGET_PATH
