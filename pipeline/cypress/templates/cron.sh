ROOT_DIR="$PWD"
KEY_PATH="$ROOT_DIR/$KEY"
set_ssh_key(){
  KEY_PATH=$1
  IDENTITY=$2
  echo $IDENTITY | base64 -d > "$KEY_PATH"
  chmod -R 700 "$KEY_PATH"
}
set_ssh_key "$KEY_PATH" "$IDENTITY"
FILE_NAME="job.sh"
SRC_PATH="/home/ec2-user/jenkins"
EC2_MACHINE="ec2-user@$EC2"
scp -i "$KEY_PATH" "$ROOT_DIR/$FILE_NAME" "$EC2_MACHINE:$SRC_PATH"
ssh -o StrictHostKeyChecking=no -i "$KEY_PATH" "ec2-user@$EC2" <<'ENDSSH'
  WORK_DIR="/home/ec2-user/jenkins"
  chmod 777 /home/ec2-user/jenkins/job.sh
  crontab -l
  echo '0 * * * * /home/ec2-user/jenkins/job.sh &> /home/ec2-user/log/`date +\%H-\%M-\%S_\%Y-\%m-\%d`.log' > cronjob
  crontab cronjob
  crontab -l
  rm cronjob
ENDSSH