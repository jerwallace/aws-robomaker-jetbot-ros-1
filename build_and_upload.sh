#!/bin/bash
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 593875212637.dkr.ecr.us-west-2.amazonaws.com
docker buildx build . -t 593875212637.dkr.ecr.us-west-2.amazonaws.com/move-test:latest --platform linux/arm64 --push
aws s3 cp docker-compose.yaml s3://ros-dance-greengrass-demo/move-test/latest/artifacts/docker-compose.yaml