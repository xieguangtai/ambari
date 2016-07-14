#!/bin/bash
imageIP=10.110.18.12:5000
imageName=centos
imageTag=fakesystemd

docker build -t $imageIP/$imageName:$imageTag .
