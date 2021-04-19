#!/bin/bash

. ./settings.sh

podman rm --force $instance
podman create -t \
              -p 10.0.0.2:22:22 \
              -p 2222:2222 \
              --restart=always \
              --replace=true \
              --name $instance $image
podman start $instance
