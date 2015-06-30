#!/bin/sh

dir="${PWD##*/}"
container_name=$USER-$dir
image_name=$USER/$dir
sudo docker run -v /home/kzlin129/Repo/github/kzlin129/core-alljoyn:/tmp/core-alljoyn -it --name $container_name $image_name

