# Builder script for the basic web server

image=lighttpd-core-site

# Start by removing the previous image
buildah rmi --force $image

httpd_cont=$(buildah from docker.io/sebp/lighttpd:latest)

buildah copy $httpd_cont data/www/index.html /var/www/localhost/htdocs/.

buildah config --entrypoint "/usr/local/bin/start.sh"

buildah commit $httpd_cont $image

