#!/bin/bash

. ./settings.sh

buildah rmi --force $image

python_cont=$(buildah from docker.io/library/python:$py_ver)

buildah run $python_cont pip install phibes

buildah commit $python_cont $image

buildah rm $python_cont
