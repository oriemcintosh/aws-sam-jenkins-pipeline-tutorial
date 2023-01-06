#!/bin/bash

echo "...Testing CodeBuild Project..."
echo "...Verifying Enviroment Variables in Bash Script..."

if [[ ! -z "$SAMConfigEnv" ]]; then 
    echo $SAMConfigEnv 
else echo "Empty Variable"
fi
