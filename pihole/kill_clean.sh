#!/bin/bash

. ./settings.sh

podman stop $instance
podman rm --force $instance
