#!/bin/bash

# command to gather parameter value from AWS and assign to $ConfigEnv variable
ConfigEnv=$(aws cloudformation describe-stacks --stack-name recovery-plan-orchestration |jq '.Stacks[].Parameters | map(select(.ParameterKey == "ConfigEnv")) | .[0].ParameterValue ')

echo "...Checking Enviroment Config to Deploy SAM App..."

if [[ ! -z "$ConfigEnv" ]]; then 
    sam deploy --config-env ${ConfigEnv} --s3-bucket ${SAMs3bucket} --kms-key-id ${SAMkmsKeyID}
else sam deploy --s3-bucket ${SAMs3bucket} --kms-key-id ${SAMkmsKeyID}
fi

echo "...Done..."