ROOT_DIR="$PWD"
KEY_PATH="$ROOT_DIR/$KEY"
EC2_MACHINE="ec2-user@$EC2"
set_ssh_key(){
  KEY_PATH=$1
  IDENTITY=$2
  echo $IDENTITY | base64 -d > "$KEY_PATH"
  chmod -R 700 "$KEY_PATH"
}
copy_dir(){
  ZIP_FILE_NAME=$1
  SRC_PATH=$2
  TARGET_PATH=$3
  zip $ZIP_FILE_NAME -rq .
  scp -i "$KEY_PATH" "$ROOT_DIR/$ZIP_FILE_NAME" "$EC2_MACHINE:$TARGET_PATH"
  rm "$ROOT_DIR/$ZIP_FILE_NAME"
}
set_ssh_key "$KEY_PATH" "$IDENTITY"
copy_dir "local.zip" "." "/home/ec2-user"
ssh -o StrictHostKeyChecking=no -i "$KEY_PATH" "ec2-user@$EC2" <<'ENDSSH'
clean_dir(){
    DIR=$1
    sudo rm -rf "$WORK_DIR"
    mkdir -p "$WORK_DIR"
}
  RELATIVE_DIR="local"
  ROOT_DIR="/home/ec2-user"
  WORK_DIR="$ROOT_DIR/$RELATIVE_DIR"
  clean_dir "$WORK_DIR"
  unzip -q "$ROOT_DIR/$RELATIVE_DIR.zip" -d "./$RELATIVE_DIR"
  rm "$ROOT_DIR/$RELATIVE_DIR.zip"
#  . $WORK_DIR/job.sh
ENDSSH
