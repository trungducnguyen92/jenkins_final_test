#echo "******************************************"
#echo "**Checking Docker Hub repo for nodejsapp**"
#echo "******************************************"

export IMAGE="trungducnguyen/nodejsapp-test:latest"

var1=$(skopeo inspect docker://trungducnguyen/nodejsapp-test:latest | jq '.Digest')
var1=${var1:1}
var1=${var1::-1}

var2=$(docker inspect --format='{{index .RepoDigests 0}}' $IMAGE)
var2=${var2:30}

#echo $var1
#echo $var2

if [[ "$var1" = "$var2" ]]
then
  DATE=$(date)
  echo "[$DATE] No need to create new container" >> /root/compare.log
else
  DATE=$(date)
  echo "[$DATE] Now creating new container" >> /root/compare.log
  ./Deploy_new_container.sh
fi
