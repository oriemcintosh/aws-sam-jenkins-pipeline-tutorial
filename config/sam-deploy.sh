#!/bin/bash

samStatusCode=$?

echo "...Deploying sam-app-recovery-plan-orchestration ..."
sam deploy 
if [ ${samStatusCode} -eq 2]; then 
    echo "No updates required."
else
    response=$?
    exit ${response}
fi