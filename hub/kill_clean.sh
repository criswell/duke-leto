#!/bin/sh

# Stops the hub, then cleans it up

. settings.sh

podman stop hub
podman rm --force hub
