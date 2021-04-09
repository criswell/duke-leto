#!/bin/bash

# Starts the hub

image=lighttpd-core-site
instance=hub

podman rm --force hub
podman create -t -p 80:80 -n $instance $image
podman start $instance
