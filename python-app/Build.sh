echo '************************************************'
echo '**Build Docker image for pythonapp application**'
echo '************************************************'

IMAGE="pythonapp"
cd python-app/ && docker build -t $IMAGE:latest .
