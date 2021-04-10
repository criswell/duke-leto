#!/bin/bash

. ./settings.sh

buildah rmi --force $image

webssh2_cont=$(buildah from registry.opensuse.org/opensuse/tumbleweed:latest)

buildah run $webssh2_cont mdkir -p /var/buildah-data 
buildah copy $webssh2_cont data/config.json /var/buildah-data/.
buildah copy $webssh2_cont data/setup.sh /var/buildah-data/.
buildah copy $webssh2_cont data/start.sh /var/buildah-data/.

buildah run $webssh2_cont /var/buildah-data/setup.sh
buildah config --entrypoint '["/var/buildah-data/start.sh"]' $webssh2_cont
buildah config --port 2222 $webssh2_cont

buildah commit $webssh2_cont $image

buildah rm $webssh2_cont
