#!/bin/bash

samStatusCode=$?

echo "...Deploying sam-app-recovery-plan-orchestration ..."
sam deploy 
if [ ${samStatusCode} -eq 0]; then 
    echo "Successfully created stack."
elif [ ${samStatusCode} -eq 2]; then
    echo "Successfully updated stack."
else 
    response=$?
    exit ${response}
fi