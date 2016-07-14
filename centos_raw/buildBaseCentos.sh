#!/bin/bash
imageIP=10.110.18.12:5000
imageName=base
imageTag=fakesystemd

docker build -t $imageIP/$imageName:$imageTag .
