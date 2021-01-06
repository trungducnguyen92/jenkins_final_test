echo '*************************'
echo '****Deploy container****'
echo '*************************'

IMAGE="nodejsapp"
var1="$(docker ps -aq -f name=nodejsapp)"

echo "** Logging in ***"
docker login -u trungducnguyen -p $PASS

docker pull trungducnguyen/$IMAGE:latest

if [ -z "$var1" ]
then
	HOST_NAME=$(hostname -f)
        docker container run -d -p 3000:3000 -e APP_VERSION="latest" -e APP_ENV=$HOST_NAME --name nodejsapp trungducnguyen/$IMAGE:latest
else
	echo 'Cleaning old container'
	docker stop nodejsapp
        docker rm nodejsapp
	HOST_NAME=$(hostname -f)
        docker container run -d -p 3000:3000 -e APP_VERSION="latest" -e APP_ENV=$HOST_NAME --name nodejsapp trungducnguyen/$IMAGE:latest
fi
