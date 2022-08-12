#!/usr/bin/env bash
function combine() {
  SCRIPT=$1
  cat "$MACHINE_PATH/$ENVIRONMENT" > "$JENKINS_PATH/$SCRIPT"
  cat "$TEMPLATES_PATH/$SCRIPT" >> "$JENKINS_PATH/$SCRIPT"
}

TEMPLATES_PATH='./templates'
JENKINS_PATH='./jenkins'
EXECUTE_SCRIPT="$JENKINS_PATH/execute.sh"
CLOSURE_SCRIPT="$JENKINS_PATH/closure.sh"
MACHINE_PATH="$TEMPLATES_PATH/machine"
rm -R "$JENKINS_PATH"
mkdir -p "$JENKINS_PATH"
combine "execute.sh"
sed -i.bak "s/##PROJECT_ID##/$PROJECT_ID/g" "$EXECUTE_SCRIPT"
rm "$EXECUTE_SCRIPT.bak"
combine "closure.sh"

CLOSURE=$(base64 "$CLOSURE_SCRIPT")
EXECUTE=$(base64 "$EXECUTE_SCRIPT")
echo "{\"job\": {\"execute\": \"$EXECUTE\",\"closure\":\"$CLOSURE\"}}" > "$JENKINS_PATH/$PROJECT_ID.json"
