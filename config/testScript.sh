#!/bin/bash

echo "...Testing CodeBuild Project..."
echo "...Verifying Enviroment Variables in Bash Script..."

if [[ ! -z "$EnvSuffix" ]]; then 
    echo $EnvSuffix 
else echo "Empty Variable"
fi
