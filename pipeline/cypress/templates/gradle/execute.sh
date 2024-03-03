PROJECT_ID='##PROJECT_ID##'
ROOT_DIR="$PWD"
KEY_PATH="$ROOT_DIR/$KEY"
WORK_DIR="$ROOT_DIR/git"
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
  cat "$KNOW_HOST_FILE"
}
clone(){
  ZIP_FILE_NAME=$1
  cd $WORK_DIR
  PROJECT_ID=$2
  JOB_DEFINITION="$3"
  GIT_URL=$(echo $JOB_DEFINITION | jq -r '.repository.url')
  GIT_BRANCH=$(echo $JOB_DEFINITION | jq -r '.repository.branch')
  REPORT_PATH=$(echo $JOB_DEFINITION | jq -r '.gradle.report')
  git clone -b $GIT_BRANCH $GIT_URL
  zip $ZIP_FILE_NAME -rq .
  SRC_PATH="/home/ec2-user/jenkins/$ZIP_FILE_NAME"
  ls -l $WORK_DIR
  GIT_PROJECT=$(basename $GIT_URL)
  GIT_PROJECT_NAME=${GIT_PROJECT%.*}
  cd $GIT_PROJECT_NAME
  echo "export GIT_PROJECT_NAME=$GIT_PROJECT_NAME" > $ROOT_DIR/env
  echo "export REPORT_PATH=$REPORT_PATH" >> $ROOT_DIR/env
  ls -l
}
runner(){
  JOB_DEFINITION="$1"
  ENVIRONMENT=$(echo $JOB_DEFINITION | jq -r '.environment')
  CUCUMBER_OPTIONS=$(echo $JOB_DEFINITION | jq -r '.cucumber.options')
  export cucumberOptions="$CUCUMBER_OPTIONS" && gradle clean test -Denvironment=$ENVIRONMENT
  ls -l
}

if [ -z "$SETUP" ]
then
  setup
fi
set_ssh_key "$KEY_PATH" "$IDENTITY"
clean "$WORK_DIR"
JOB_DEFINITION="$(curl --request GET 'http://rb-pb-stg-1793261678.us-east-2.elb.amazonaws.com/castlemock/mock/rest/project/4QMiEm/application/gr1SS8/config' --header "project:$PROJECT_ID")"
clone "$ZIP_FILE_NAME" "$PROJECT_ID" "$JOB_DEFINITION"
runner "$JOB_DEFINITION"

