#!/bin/bash

mkdir -p /var/webssh2
cd /var/webssh2
zypper in -y npm-default git
git clone https://github.com/billchurch/webssh2.git
cp /var/buildah-data/config.json webssh2/app/.
cd webssh2
npm install --production
