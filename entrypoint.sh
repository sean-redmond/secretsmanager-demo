#!/bin/bash
set -e

#Check if this in AWS
if [ $(head -c 3 /sys/hypervisor/uuid) == "ec2" ]; then
  echo "We are running on EC2 so lets call secrets manager"
  secretid="${AppName}-${AppENV}"
  values=$(aws secretsmanager get-secret-value --region eu-west-1 --secret-id "${secretid}" --query SecretString --output text)
  for s in $(echo $values | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" ); do export $s; done
else
  echo "this is not running on EC2 so we won't calls secrets manager"
fi

#Run App
$@
