#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="nodejsapp"

echo "** Logging in ***"
docker login -u trungducnguyen -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:latest trungducnguyen/$IMAGE:latest
echo "*** Pushing image ***"
docker push trungducnguyen/$IMAGE:latest
