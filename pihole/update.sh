#!/bin/bash

# Hacky update script

systemctl --user stop container-pihole.service
./kill_clean.sh
./builder.sh
systemctl --user start container-pihole.service

