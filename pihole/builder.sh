#!/bin/bash

# Stick it in your pi-hole

. ./settings.sh

buildah rmi --force $image

pihole_cont=$(buildah from docker.io/pihole/pihole:latest)


