#!/bin/bash

# Stick it in your pi-hole

. ./settings.sh

buildah rmi --force $image

pihole_cont=$(buildah from docker.io/pihole/pihole:latest)

PIHOLE_ADMIN_PASS=$(\
  podman exec phibes /usr/bin/env phibes get --password $PHIBES_PASS \
  --path $phibes_path --item $pihole_pass | \
  awk '/----------/{flag=1; next} /----------/{flag=0} flag')

buildah run $pihole_cont pihole -a -p $PIHOLE_ADMIN_PASS

buildah commit $pihole_cont $image

buildah rm $python_cont
