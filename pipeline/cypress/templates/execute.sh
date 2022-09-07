echo $IDENTITY | base64 -d > "$KEY"
chmod -R 700 "$KEY"
ssh -o StrictHostKeyChecking=no -i "$KEY" "ec2-user@$EC2" <<'ENDSSH'
  KNOW_HOST='Z2l0aHViLmF2YWxkaWdpdGFsbGFicy5jb20gZWNkc2Etc2hhMi1uaXN0cDI1NiBBQUFBRTJWalpITmhMWE5vWVRJdGJtbHpkSEF5TlRZQUFBQUlibWx6ZEhBeU5UWUFBQUJCQkFrb1dIT0hkZjNMa0VjWUFONU1yQUk1YUFpdXJRMzl0cnhZRFpvY0xJaVpRcXlmQmFlMG1UdnRqK09LMEkrUlowWXhiNVRobnFzSTBiL0VNYWluekpzPQpnaXRodWIuY29tLDE0MC44Mi4xMTMuMyBlY2RzYS1zaGEyLW5pc3RwMjU2IEFBQUFFMlZqWkhOaExYTm9ZVEl0Ym1semRIQXlOVFlBQUFBSWJtbHpkSEF5TlRZQUFBQkJCRW1LU0VOalFFZXpPbXhrWk15N29wS2d3RkI5bmt0NVlScllNak51RzVOODd1UmdnNkNMcmJvNXdBZFQveTZ2MG1LVjBVMncwV1oyWUIvKytUcG9ja2c9Cg=='
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
  GIT_PROJECT=$(basename $GIT_URL)
  GIT_PROJECT_NAME=${GIT_PROJECT%.*}
  WORK_DIR="/home/ec2-user/jenkins"
  SSH_DIR="$WORK_DIR/.ssh"
  SSH_FILE="$SSH_DIR/id_rsa"
  KNOW_HOST_FILE="$SSH_DIR/known_hosts"
  sudo rm -rf "$WORK_DIR"
  mkdir -p "$SSH_DIR"
  cd "$WORK_DIR"
  echo "$KNOW_HOST" | base64 -d > "$KNOW_HOST_FILE"
  curl --request GET 'http://rb-pb-stg-1793261678.us-east-2.elb.amazonaws.com/castlemock/mock/rest/project/4QMiEm/application/gr1SS8/config' --header 'key:*' | base64 -d > "$SSH_FILE"
  echo "export GIT_URL=$GIT_URL" > env
  echo "export GIT_BRANCH=$GIT_BRANCH" >> env
  echo "export GIT_PROJECT_NAME=$GIT_PROJECT_NAME" >> env
  echo "export REPORT_PATH=$REPORT_PATH" >> env
  echo "export ENVIRONMENT=$ENVIRONMENT" >> env
  echo "export NODEJS_VERSION=$NODEJS_VERSION" >> env
  echo "export CYPRESS_VERSION=$CYPRESS_VERSION" >> env
  echo "export CYPRESS_SPEC=$CYPRESS_SPEC" >> env
  echo "export CYPRESS_BROWSER=$CYPRESS_BROWSER" >> env
  cat env
  docker run --rm -v $(pwd)/.ssh:/root/.ssh -v $(pwd):/git alpine/git clone -b $GIT_BRANCH $GIT_URL
  cd $GIT_PROJECT_NAME
  docker run --rm -v $PWD:/app bitnami/node:$NODEJS_VERSION npm install
  docker run --rm -v $PWD:/e2e -w /e2e cypress/included:$CYPRESS_VERSION run -b ${CYPRESS_BROWSER} --headless --reporter cypress-multi-reporters --reporter-options configFile=cypress.json --env configFile=$ENVIRONMENT -s "$CYPRESS_SPEC"
ENDSSH
