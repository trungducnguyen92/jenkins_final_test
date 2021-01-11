#echo '*************************'
#echo '****Deploy container****'
#echo '*************************'

IMAGE="nodejsapp-test"
var1="$(docker ps -aq -f name=nodejsapp-test)"

#echo "** Logging in ***"
#docker login -u trungducnguyen -p $PASS

docker pull trungducnguyen/$IMAGE:latest

if [ -z "$var1" ]
then
        HOST_NAME=$(hostname -f)
        docker container run -d -p 3000:3000 -e APP_VERSION="latest" -e APP_ENV=$HOST_NAME --name nodejsapp-test trungducnguyen/$IMAGE:latest
        DATE=$(date)
        echo "[$DATE] New container nodejs application successfully created" >> /root/compare.log
else
        DATE=$(date)
        echo "[$DATE] Cleaning old container" >> /root/compare.log
        docker stop nodejsapp-test
        docker rm nodejsapp-test
        HOST_NAME=$(hostname -f)
        docker container run -d -p 3000:3000 -e APP_VERSION="latest" -e APP_ENV=$HOST_NAME --name nodejsapp-test trungducnguyen/$IMAGE:latest
        DATE=$(date)
        echo "[$DATE] New container nodejs application successfully created" >> /root/compare.log
fi
