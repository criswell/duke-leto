#!/bin/bash

. ./settings.sh
.. ./global.sh

../volume_create.sh

buildah rmi --force $image

python_cont=$(buildah from docker.io/library/python:$py_ver)

buildah run $python_cont pip install phibes
buildah run mkdir -p $phibes_path

buildah commit $python_cont $image

buildah rm $python_cont
