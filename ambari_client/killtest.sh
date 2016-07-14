#!/bin/bash
name=test-client

docker kill $name
docker rm $name
