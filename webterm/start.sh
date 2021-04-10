#!/bin/bash

. ./settings.sh

podman rm --force $instance
podman create -t -p 2222:2222 --name $instance $image
podman start $instance
