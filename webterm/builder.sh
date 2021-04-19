#!/bin/bash

. ./settings.sh
. ../global.sh

buildah rmi --force $image

webssh2_cont=$(buildah from registry.opensuse.org/opensuse/tumbleweed:latest)

SAM_PASS=$(\
  podman exec phibes /usr/bin/env phibes get --password $PHIBES_PASS \
  --path $phibes_path --item $sam_pass | \
  awk '/----------/{flag=1; next} /----------/{flag=0} flag')

buildah run $webssh2_cont mkdir -p /var/buildah-data
buildah copy $webssh2_cont data/config.json /var/buildah-data/.
buildah copy $webssh2_cont data/setup.sh /var/buildah-data/.
buildah copy $webssh2_cont data/start.sh /var/buildah-data/.

buildah run $webssh2_cont /var/buildah-data/setup.sh $sam_pass
buildah config --entrypoint '["/var/buildah-data/start.sh"]' $webssh2_cont
buildah config --port 2222 $webssh2_cont
builhad config --port 22 $webssh2_cont

buildah commit $webssh2_cont $image

buildah rm $webssh2_cont
