if [ ! "$(docker ps -q -f name=nodejsapp)" ]; then
    if [ "$(docker ps -aq -f status=running -f status=exited -f name=nodejsapp)" ]; then
        # cleanup
	docker stop nodejsapp
        docker rm nodejsapp
    fi
    # run your container
	HOST_NAME=$(hostname -f)
	docker container run -d -p 3000:3000 -e APP_VERSION="latest" -e APP_ENV=$HOST_NAME --name nodejsapp nodejs:latest
fi
