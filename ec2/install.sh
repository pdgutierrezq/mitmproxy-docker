#!/usr/bin/env bash
sh ./git.sh
ssh -o StrictHostKeyChecking=no -i "$KEY" "ec2-user@$EC2" <<'ENDSSH'
  sudo yum install git -y
  sudo yum install jq -y
  git clone https://github.com/pdgutierrezq/mitmproxy-docker.git
  sudo yum update -y
  sudo amazon-linux-extras install docker
  sudo service docker start
  sudo usermod -a -G docker ec2-user
  sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  docker-compose version
  sudo systemctl enable docker.service
  sudo systemctl enable containerd.service
  apt-get update
  apt-get install curl
  sudo chmod +x /etc/rc.d/rc.local
  sudo sh -c "echo nameserver 8.8.8.8 > /etc/resolv.conf"
ENDSSH
sh ./proxy.sh
sh ./castlemock.sh
sh ../docker/jenkins/jenkins.sh

#
#
#
#
#
#


