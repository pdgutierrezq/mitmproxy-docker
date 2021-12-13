#!/usr/bin/env bash
ssh -i "rb-pb-dev-ecs-auto.pem" "ec2-user@$EC2"
#docker logs -n 10 proxy
