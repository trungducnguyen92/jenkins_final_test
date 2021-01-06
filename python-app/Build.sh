echo '*********************************************'
echo '**Build Docker image for nodejs application**'
echo '*********************************************'

IMAGE="nodejsapp"
cd nodejs-app/ && docker build -t $IMAGE:latest .
