#!/usr/bin/env bash
./git.sh
#ssh -i "rb-pb-dev-ecs-auto.pem" ec2-user@ec2-3-15-4-198.us-east-2.compute.amazonaws.com
ssh -i "rb-pb-dev-ecs-auto.pem" "ec2-user@$EC2" <<'ENDSSH'
  sudo yum install git -y
  git clone https://github.com/pdgutierrezq/mitmproxy-docker.git
  sudo yum update -y
  sudo amazon-linux-extras install docker
  sudo service docker start
  sudo usermod -a -G docker ec2-user
  sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  docker-compose version
ENDSSH
./test.sh



