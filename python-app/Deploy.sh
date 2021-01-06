echo '*************************'
echo '****Deploy container****'
echo '*************************'

IMAGE="pythonapp"
HOST_NAME=$(hostname -f)
var1="$(docker ps -aq -f name=pythonapp)"

echo "** Logging in ***"
docker login -u trungducnguyen -p $PASS

docker pull trungducnguyen/$IMAGE:latest

if [ -z "$var1" ]
then
        docker container run -d -p 5000:5000 --name pythonapp trungducnguyen/$IMAGE:latest
else
	echo 'Cleaning old container'
	docker stop pythonapp
        docker rm pythonapp
        docker container run -d -p 5000:5000 --name pythonapp trungducnguyen/$IMAGE:latest
fi
