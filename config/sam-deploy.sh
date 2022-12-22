#!/bin/bash

samStatusCode=$?

echo "...Deploying SAM App ..."
sam deploy
if [ ${samStatusCode} -eq 0 ]; then 
    echo "Done"
else 
    response=$?
    exit ${response}
fi