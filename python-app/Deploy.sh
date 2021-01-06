echo '*************************'
echo '****Deploy container****'
echo '*************************'

IMAGE="pythonapp"
var1="$(docker ps -aq -f name=pythonapp)"

echo "** Logging in ***"
docker login -u trungducnguyen -p $PASS

docker pull trungducnguyen/$IMAGE:latest

if [ -z "$var1" ]
then
	HOST_NAME=$(hostname -f)
        docker container run -d -p 3000:3000 --name pythonapp trungducnguyen/$IMAGE:latest
else
	echo 'Cleaning old container'
	docker stop pythonapp
        docker rm pythonapp
	HOST_NAME=$(hostname -f)
        docker container run -d -p 3000:3000 --name pythonapp trungducnguyen/$IMAGE:latest
fi
