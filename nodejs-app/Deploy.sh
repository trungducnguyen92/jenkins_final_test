echo '*************************'
echo '****Deploy container****'
echo '*************************'

var1="$(docker ps -aq -f name=nodejsapp)"

if [ -z "$var1" ]
then
	HOST_NAME=$(hostname -f)
        docker container run -d -p 3000:3000 -e APP_VERSION="latest" -e APP_ENV=$HOST_NAME --name nodejsapp nodejs:latest
else
	echo 'Cleaning old container'
	docker stop nodejsapp
        docker rm nodejsapp
	HOST_NAME=$(hostname -f)
        docker container run -d -p 3000:3000 -e APP_VERSION="latest" -e APP_ENV=$HOST_NAME --name nodejsapp nodejs:latest
fi
