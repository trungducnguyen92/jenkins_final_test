#!/bin/bash

echo "********************"
echo "** Pushing image ***"
echo "********************"

IMAGE="maven-project"

echo "** Logging in ***"
docker login -u trungducnguyen -p $PASS
echo "*** Tagging image ***"
docker tag $IMAGE:$BUILD_TAG trungducnguyen/$IMAGE:$BUILD_TAG
echo "*** Pushing image ***"
docker push trungducnguyen/$IMAGE:$BUILD_TAG
