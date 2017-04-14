#!/bin/bash

registryUrl=192.168.72.24:5000
registryUser=admin
registryPass=admin123

## declare an array variable
declare -a arr=("codelab-auth-mongodb" "codelab-account-mongodb" "codelab-article-mongodb" "codelab-ssh-mongodb" "codelab-config-service" "codelab-registry-service" "codelab-gateway-service" "codelab-monitoring-service" "codelab-auth-service" "codelab-account-service" "codelab-article-service" "codelab-ssh-service")

## now loop through the above array
for i in "${arr[@]}"
do
   echo "Building & Upload Docker Image: ----"
   echo "    Name: ${i}"
   echo "    Registry: ${registryUrl}"

   docker login ${registryUrl} -u ${registryUser} -p ${registryPass} && docker pull ${registryUrl}/codelab/${i}
done




