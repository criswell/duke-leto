#!/bin/bash

# Starts the hub

. ./settings.sh

podman rm --force $instance
podman create -t \
              --expose=80 \
              -p 80:80 \
              --restart=always \
              --replace=true \
              --name $instance $image
podman start $instance
