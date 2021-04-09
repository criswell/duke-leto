#!/bin/bash

# Starts the hub

. settings.sh

podman rm --force hub
podman create -t -p 80:80 --name $instance $image
podman start $instance
