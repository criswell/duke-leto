#!/bin/bash

. ./global.sh

# Phibes volume
if podman volume inspect $phibes_vol ; then
  echo ">>> phibes volume already exists!"
else
  echo ">>> Creating phibes volume!"
  podman volume create $phibes_vol
fi

# Pihole volumes
if podman volume inspect $pihole_etc_vol ; then
  echo ">>> pihole etc volume already exists!"
else
  echo ">>> Creating pihole etc volume!"
  podman volume create $pihole_etc_vol
fi

if podman volume inspect $pihole_dnsmasq_vol ; then
  echo ">>> pihole dnsmasq volume already exists!"
else
  echo ">>> Creating pihole dnsmasq volume!"
  podman volume create $pihole_dnsmasq_vol
fi
