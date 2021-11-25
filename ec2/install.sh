#!/usr/bin/env bash
#ssh -i "rb-pb-dev-ecs-auto.pem" ec2-user@ec2-18-189-141-250.us-east-2.compute.amazonaws.com
#update
sudo yum update -y
#install most recent package
sudo amazon-linux-extras install docker
#start the service docker
sudo service docker start
#add the ec2-docker user to the group
sudo usermod -a -G docker ec2-user
#you need to logout to take affect
#logout
#login again
#ssh -i "rb-pb-dev-ecs-auto.pem" ec2-user@ec2-18-189-141-250.us-east-2.compute.amazonaws.com
#check the docker version
docker --version
sudo systemctl start docker
docker run --name castlemock -d -p 80:8080 -v $(pwd):/root/.castlemock castlemock/castlemock:1.51
#http://10.5.8.216/castlemock
sudo yum install git -y
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version


