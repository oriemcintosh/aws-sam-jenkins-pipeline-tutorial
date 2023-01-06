#!/bin/bash

# command to gather parameter value from AWS and assign to $EnvSuffix variable
EnvSuffix=$(aws cloudformation describe-stacks --stack-name recovery-plan-orchestration |jq '.Stacks[].Parameters | map(select(.ParameterKey == "EnvSuffix")) | .[0].ParameterValue ')

echo "...Checking Enviroment Config to Deploy SAM App..."

if [[ ! -z "$EnvSuffix" ]]; then 
    sam deploy --config-env QA --s3-bucket ${SAMs3bucket} --kms-key-id ${SAMkmsKeyID}
else sam deploy --s3-bucket ${SAMs3bucket} --kms-key-id ${SAMkmsKeyID}
fi

echo "...Done..."