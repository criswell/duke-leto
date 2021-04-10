#!/bin/bash

. ./settings.sh

podman rm --force $instance
podman create -t \
              --restart=always \
              --replace=true \
              --name $instance $image
podman start $instance
