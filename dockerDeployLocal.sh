#!/bin/bash

registryUrl=192.168.72.24:5000
registryUser=admin
registryPass=admin123

function buildMongoDb()
{
    service=$1
    dbService=$2

    echo "Building & Upload Docker Image: ----"
    echo "    Name: ${service}"
    echo "    DB Name: ${dbService}"
    echo "    Registry: ${registryUrl}"

    cd $service
    docker build -t $dbService .
    docker tag $dbService $registryUrl/codelab/$dbService
    docker login $registryUrl -u $registryUser -p $registryPass && docker push $registryUrl/codelab/$dbService
    cd ../
}

## declare an array variable
declare -a arr=("codelab-config-service" "codelab-registry-service" "codelab-gateway-service" "codelab-monitoring-service" "codelab-auth-service" "codelab-account-service" "codelab-article-service")

## now loop through the above array
for i in "${arr[@]}"
do
   echo "Building & Upload Docker Image: ----"
   echo "    Name: ${i}"
   echo "    Registry: ${registryUrl}"
   cd $i
   docker build -t $i .
   docker tag $i $registryUrl/codelab/$i
   docker login $registryUrl -u $registryUser -p $registryPass && docker push $registryUrl/codelab/$i
   cd ../
   # or do whatever with individual element of the array
done

buildMongoDb 'codelab-auth-service' 'codelab-auth-mongodb'
buildMongoDb 'codelab-account-service' 'codelab-account-mongodb'
buildMongoDb 'codelab-article-service' 'codelab-article-mongodb'


