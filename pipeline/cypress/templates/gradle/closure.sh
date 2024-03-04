ROOT_DIR="$PWD"
. "$ROOT_DIR/env"
cat "$ROOT_DIR/env"

WORK_DIR="$ROOT_DIR/git"
TARGET_CHILD_PATH="$WORK_DIR/$GIT_PROJECT_NAME/target"
BUILD_CHILD_PATH="$WORK_DIR/$GIT_PROJECT_NAME/build"

report(){
  cp -Rf "$BUILD_CHILD_PATH" .
  cp -Rf "$BUILD_CHILD_PATH/reports/tests/test/." "./target/site/serenity"
}

report
