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

#docker exec -it proxy sh -c "echo nameserver 8.8.8.8 > /etc/resolv.conf"
# Stg - load balancers vpc 10.5.12.0/22
# Dev - load balancers vpc 10.5.8.0/22 10.5.10.147
# ADL VPN 	10.255.224.0/21
# Github username: pedro-gutierrez_adlover
# Github tokem: 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l


