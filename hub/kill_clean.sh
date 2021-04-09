#!/bin/sh

# Stops the hub, then cleans it up

instance=hub

podman stop hub
podman rm --force hub
