#!/bin/bash

. ./settings.sh

podman rm --force $instance
podman create -t --name $instance $image
podman start $instance
