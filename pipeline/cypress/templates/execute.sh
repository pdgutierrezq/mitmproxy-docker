PROJECT_ID='##PROJECT_ID##'
WORK_DIR="git"

clean(){
  WORK_DIR=$1
  rm -rf "$WORK_DIR"
  mkdir -p "$WORK_DIR"
}
setup(){
  WORK_DIR=$1
  cd $WORK_DIR
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
  WORK_DIR=$1
  cd $WORK_DIR
  PROJECT_ID= $2
  JOB_DEFINITION="$(curl --request GET 'http://rb-pb-stg-1793261678.us-east-2.elb.amazonaws.com/castlemock/mock/rest/project/4QMiEm/application/gr1SS8/config' --header "project:$PROJECT_ID")"
  GIT_URL=$(echo $JOB_DEFINITION | jq -r '.repository.url')
  GIT_BRANCH=$(echo $JOB_DEFINITION | jq -r '.repository.branch')
  git clone -b $GIT_BRANCH $GIT_URL
  ZIP_FILE="$WORK_DIR.zip"
  zip $ZIP_FILE -r .
  SRC_PATH="/home/ec2-user/jenkins/$ZIP_FILE"
  ls -lx
  cd ..
}
set_ssh_key(){
  KEY=$1
  IDENTITY=$2
  echo $IDENTITY | base64 -d > "$KEY"
  chmod -R 700 "$KEY"
}

clean "$WORK_DIR"
setup "$WORK_DIR"
clone "$WORK_DIR" "$PROJECT_ID"
set_ssh_key "$KEY" "$IDENTITY"
ssh -o StrictHostKeyChecking=no -i "$KEY" "ec2-user@$EC2" <<'ENDSSH'
  WORK_DIR="/home/ec2-user/jenkins"
  sudo rm -rf "$WORK_DIR"
  mkdir -p "$WORK_DIR"
ENDSSH
scp -i "$KEY" "$WORK_DIR/$ZIP_FILE" "ec2-user@$EC2:$SRC_PATH"
ssh -o StrictHostKeyChecking=no -i "$KEY" "ec2-user@$EC2" <<'ENDSSH'
  WORK_DIR="/home/ec2-user/jenkins"
  cd "$WORK_DIR"
  unzip "$WORK_DIR/git.zip" -d "."
ENDSSH
ssh -o StrictHostKeyChecking=no -i "$KEY" "ec2-user@$EC2" <<'ENDSSH'
  PROJECT_ID='##PROJECT_ID##'
  JOB_DEFINITION="$(curl --request GET 'http://rb-pb-stg-1793261678.us-east-2.elb.amazonaws.com/castlemock/mock/rest/project/4QMiEm/application/gr1SS8/config' --header "project:$PROJECT_ID")"
  GIT_URL=$(echo $JOB_DEFINITION | jq -r '.repository.url')
  GIT_BRANCH=$(echo $JOB_DEFINITION | jq -r '.repository.branch')
  ENVIRONMENT=$(echo $JOB_DEFINITION | jq -r '.environment')
  REPORT_PATH=$(echo $JOB_DEFINITION | jq -r '.cypress.report')
  NODEJS_VERSION=$(echo $JOB_DEFINITION | jq -r '.nodejs.version')
  CYPRESS_VERSION=$(echo $JOB_DEFINITION | jq -r '.cypress.version')
  CYPRESS_SPEC=$(echo $JOB_DEFINITION | jq -r '.cypress.spec')
  CYPRESS_BROWSER=$(echo $JOB_DEFINITION | jq -r '.cypress.browser')
  TESTRAIL_TESTRUN_NAME=$(echo $JOB_DEFINITION | jq -r '.testrail.testrun.name')
  TESTRAIL_USERNAME=$(echo $JOB_DEFINITION | jq -r '.testrail.username')
  TESTRAIL_PASSWORD=$(echo $JOB_DEFINITION | jq -r '.testrail.password')
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
  echo "export CYPRESS_SPEC=$CYPRESS_SPEC" >> env
  echo "export CYPRESS_BROWSER=$CYPRESS_BROWSER" >> env
  echo "export TESTRAIL_TESTRUN_NAME=\"$TESTRAIL_TESTRUN_NAME\"" >> env
  echo "export TESTRAIL_USERNAME=$TESTRAIL_USERNAME" >> env
  echo "export TESTRAIL_PASSWORD=$TESTRAIL_PASSWORD" >> env
  cat env
  cd $GIT_PROJECT_NAME
  docker run --rm -v $PWD:/app bitnami/node:$NODEJS_VERSION chmod -R 777 /root && npm install
  docker run --rm -v $PWD:/e2e -w /e2e cypress/included:$CYPRESS_VERSION run -b ${CYPRESS_BROWSER} --headless --reporter cypress-multi-reporters --reporter-options configFile=cypress.json --env configFile=$ENVIRONMENT -s "$CYPRESS_SPEC"
ENDSSH
