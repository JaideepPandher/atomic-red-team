#!/usr/bin/bash

count=0
temp="docker"

implant () {
docker run -d  --name T1525_container -itt alpine:3 | tail -n +1 | echo "I am here"
docker commit T1525_container my-alpine
}

check_preq () {
check=$(command -v docker)
if [[ "$check" =~ .*"$temp".* ]]; then
count=1;
echo "Docker is present"
else
echo "Docker is not present"
fi
}

check_implant () {
docker images -a
}

cleanup () {
docker stop T1525_container
docker rmi -f alpine:3
docker rmi -f my-alpine
}

echo "Check for prerequisite"
check_preq
implant
check_implant
echo "Do you want to run clean up function [Y/N]"
read input
if [ "$input" = "Y" ]
then
echo "Cleaning in Process"
cleanup
echo "Cleaning Completed"
elif [ "$input" = "N" ]
then
echo "Cleanup function not selected"
else
echo "Wrong input selected"
fi
