#!/bin/bash

# Stick it in your pi-hole

. ./settings.sh
. ../global.sh

buildah rmi --force $image

pihole_cont=$(buildah from docker.io/pihole/pihole:latest)

PIHOLE_ADMIN_PASS=$(\
  podman exec phibes /usr/bin/env phibes get --password $PHIBES_PASS \
  --path $phibes_path --item $pihole_pass | \
  awk '/----------/{flag=1; next} /----------/{flag=0} flag')

buildah config -e TERM=$TERM $pihole_cont
buildah run $pihole_cont pihole -a -p $PIHOLE_ADMIN_PASS

buildah run $pihole_cont apt update
buildah run $pihole_cont apt install -y unbound
buildah run $pihole_cont \
  wget https://www.internic.net/domain/named.root -q -o /var/lib/unbound/root.hints

buildah copy $pihole_cont data/pi-hole.conf /etc/unbound/unbound.conf.d/pi-hole.conf

buildah commit $pihole_cont $image

buildah rm $python_cont
