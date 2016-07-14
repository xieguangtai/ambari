#!/bin/bash
imageIP=10.110.18.12:5000
imageName=ambari
imageTag=client

docker build -t $imageIP/$imageName:$imageTag .
