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
  chmod 777 /home/ec2-user/jenkins/job.sh
  crontab -l
  echo '0 * * * * /home/ec2-user/jenkins/job.sh &> /home/ec2-user/log/`date +\%Y-\%m-\%d_\%H-\%M-\%S`.log' > cronjob
  crontab cronjob
  crontab -l
  rm cronjob
ENDSSH
