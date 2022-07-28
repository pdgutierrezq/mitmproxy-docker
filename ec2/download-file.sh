#!/usr/bin/env bash
scp -i "$KEY" "ec2-user@$EC2:$SRC_PATH" $(basename $SRC_PATH)
#docker logs -n 10 proxy
