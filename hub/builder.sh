#!/bin/bash

# Builder script for the basic web server

. settings.sh

# Start by removing the previous image
buildah rmi --force $image

httpd_cont=$(buildah from docker.io/sebp/lighttpd:latest)

buildah copy $httpd_cont data/www/index.html /var/www/localhost/htdocs/.

buildah config --entrypoint '["/usr/local/bin/start.sh"]' $httpd_cont
buildah config --port 80 $httpd_cont

buildah commit $httpd_cont $image

buildah rm $httpd_cont
