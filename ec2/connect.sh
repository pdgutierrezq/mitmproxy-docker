#!/usr/bin/env bash
ssh -i "$KEY" "ec2-user@$EC2"
#docker logs -n 10 proxy
