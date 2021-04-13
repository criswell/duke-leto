#!/bin/bash

. ./global.sh

# Phibes volume
if podman volume inspect $phibes_vol ; then
  echo ">>> phibes volume already exists!"
else
  echo ">>> Creating phibes volume!"
  podman volume create $phibes_vol
fi
