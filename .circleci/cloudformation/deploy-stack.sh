#!/bin/bash
# Shell script for deploying an AWS CloudFormation Stack
# Author: Chris Karakannas, July 2021
### Dependencies ###
# - AWS CLI v2.x => Script uses the aws cloudformation deploy command

TEMPLATE_FILE=''
STACK_NAME=''
PARAMS=''
TAGS=''
CAPABILITIES=''

print_usage() {
  printf "Usage: deploy-stack.sh -n stack-name -f template-file -t <tags-array> -p <params-array> -c <CAPABILITIES_IAM>"
}

while getopts 'n:f:t:p:c' flag; do
  case "${flag}" in
    n)  STACK_NAME="${OPTARG}" ;;
    f)  TEMPLATE_FILE="${OPTARG}" ;;
    t)  TAGS="--tags"
        TAGS+=" "
        TAGS+="${OPTARG}" ;;
    p)  PARAMS="--parameter-overrides"
        PARAMS+=" "
        PARAMS+="${OPTARG}" ;;
    c)  CAPABILITIES="--capabilities CAPABILITY_IAM CAPABILITY_NAMED_IAM" ;;
    *)  print_usage
        exit 1 ;;
  esac
done

aws cloudformation deploy \
    --stack-name ${STACK_NAME} \
    --template-file ${TEMPLATE_FILE} ${TAGS} ${PARAMS} ${CAPABILITIES}

exit 0