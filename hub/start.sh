#!/bin/bash

# Starts the hub

. ./settings.sh

podman rm --force $instance
podman create -t \
              -p 10.0.0.10:80:80 \
              --restart=always \
              --replace=true \
              --name $instance $image
podman start $instance
