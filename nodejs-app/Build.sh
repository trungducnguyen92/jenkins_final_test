echo '*********************************************'
echo '**Build Docker image for nodejs application**'
echo '*********************************************'

cd nodejs-app/ && docker build -t nodejs:latest .
