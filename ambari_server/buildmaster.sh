#!/bin/bash
imageIP=10.110.18.25:5000
imageName=ambari
imageTag=bigdata

docker build -t $imageIP/$imageName:$imageTag .
