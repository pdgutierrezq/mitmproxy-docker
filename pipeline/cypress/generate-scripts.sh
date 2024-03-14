#!/usr/bin/env bash
function combine() {
  SCRIPT=$1
  cat "$MACHINE_PATH/$ENVIRONMENT" > "$JENKINS_PATH/$SCRIPT"
  cat "$TEMPLATES_PATH/$TEMPLATE/$SCRIPT" >> "$JENKINS_PATH/$SCRIPT"
}

function report(){
  SCRIPT=$1
  FILE_NAME=$2
  OUT_FILE_NAME="${3:-$FILE_NAME}"
  REPLACE_BY="-$(echo $OUT_FILE_NAME | sed -e "s/.html//g")"
  REPORT_TARGET_PATH="\"\$PIPELINE_TARGET_PATH/$OUT_FILE_NAME\""
  echo "REPORT_RAW='$(echo -e $(cat "$TEMPLATES_PATH/$TEMPLATE/$FILE_NAME"| sed -e "s/-dev/$REPLACE_BY/g"))'" >> "$SCRIPT"
  echo "echo \$REPORT_RAW >> $REPORT_TARGET_PATH" >> "$SCRIPT"
  echo "cat $REPORT_TARGET_PATH" >> "$SCRIPT"
}

TEMPLATES_PATH='./templates'
JENKINS_PATH='./jenkins'
EXECUTE_SCRIPT="$JENKINS_PATH/execute.sh"
CLOSURE_SCRIPT="$JENKINS_PATH/closure.sh"
JOB_SCRIPT="$JENKINS_PATH/job.sh"
MACHINE_PATH="$TEMPLATES_PATH/machine"

DEV_REPORT_BASE_FILE_NAME="dev.html"
FULL_REPORT_BASE_FILE_NAME="full.html"

rm -Rf "$JENKINS_PATH"
mkdir -p "$JENKINS_PATH"
combine "execute.sh"
sed -i.bak "s/##PROJECT_ID##/$PROJECT_ID/g" "$EXECUTE_SCRIPT"
rm "$EXECUTE_SCRIPT.bak"
combine "closure.sh"
combine "job.sh"
sed -i.bak "s/##PROJECT_ID##/$PROJECT_ID/g" "$JOB_SCRIPT"
rm "$JOB_SCRIPT.bak"
combine "runner.sh"
report "$CLOSURE_SCRIPT" $DEV_REPORT_BASE_FILE_NAME
report "$CLOSURE_SCRIPT" $DEV_REPORT_BASE_FILE_NAME "stg.html"
report "$CLOSURE_SCRIPT" $FULL_REPORT_BASE_FILE_NAME

CLOSURE=$(base64 "$CLOSURE_SCRIPT")
EXECUTE=$(base64 "$EXECUTE_SCRIPT")
echo "{\"job\": {\"execute\": \"$EXECUTE\",\"closure\":\"$CLOSURE\"}}" > "$JENKINS_PATH/$PROJECT_ID.json"
