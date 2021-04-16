#!/bin/bash

. ./settings.sh
. ../global.sh

podman rm --force $instance
podman create -t \
              --dns=127.0.0.1 \
              --dns=1.1.1.1 \
              -p 10.0.0.2:443:443 \
              -p 10.0.0.2:80:80 \
              -p 10.0.0.2:53:53 \
              --restart=always \
              --replace=true \
              --volume=$pihole_etc_vol:$pihole_etc_path \
              --volume=$pihole_dnsmasq_vol:$pihole_dnsmasq_path \
              --volume=$pihole_persist_vol:$pihole_persist_path \
              --name $instance $image
podman start $instance
