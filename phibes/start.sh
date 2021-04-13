#!/bin/bash

. ./settings.sh
.. ./global.sh

podman rm --force $instance
podman create -t \
              --restart=always \
              --replace=true \
              --volume=$phibes_vol:$phibes_path
              --name $instance $image
podman start $instance
