#!/bin/sh

dir="${PWD##*/}"
sudo docker build -t $USER/$dir .
