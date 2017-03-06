#!/bin/bash

## declare an array variable
declare -a arr=("codelab-config-service" "codelab-registry-service" "codelab-gateway-service" "codelab-monitoring-service" "codelab-auth-service" "codelab-account-service" "codelab-article-service")

## now loop through the above array
for i in "${arr[@]}"
do
   echo "Pulling $i -----------------------------------------------------------------------------------------"
   cd $i
   git pull
   cd ../
   # or do whatever with individual element of the array
done

# You can access them using echo "${arr[0]}", "${arr[1]}" also
