#!/bin/sh

# Stops the hub, then cleans it up

. ./settings.sh

podman stop $instance
podman rm --force $instance
