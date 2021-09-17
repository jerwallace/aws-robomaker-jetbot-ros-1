#!/bin/bash
account=<ACCOUNT>
region=<REGION>
s3_key=s3://<BUCKET_NAME>/<PATH>
container_name=jetbot
aws ecr get-login-password --region $region| docker login --username AWS --password-stdin $account.dkr.ecr.$region.amazonaws.com
docker buildx build . -t $account.dkr.ecr.$region.amazonaws.com/$container_name:latest --platform linux/arm64 --push
aws s3 cp docker-compose.yaml $s3_key/docker-compose.yaml