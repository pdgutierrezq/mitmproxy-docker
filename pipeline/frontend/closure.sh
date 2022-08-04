#!/usr/bin/env bash
KEY=machine.pem
EC2=rb-pb-dev-tcp-3310d9a6094bf5a8.elb.us-east-2.amazonaws.com
FILE_NAME="report.zip"
SRC_PATH="/home/ec2-user/jenkins/$FILE_NAME"
TARGET_PATH="."
PIPELINE_TARGET_PATH="./target/site/serenity"
ls -l
scp -i "$KEY" "ec2-user@$EC2:$SRC_PATH" "$TARGET_PATH"
mkdir -p "$PIPELINE_TARGET_PATH"
unzip "$TARGET_PATH/$FILE_NAME" -d "$PIPELINE_TARGET_PATH"
ls -Rl
