#!/bin/bash

# This is a rather brute force script... I really should refine it later
# Will kill everything, rebuild, and restart

PWD=$(pwd)
PWD=${PWD%/}

# Would be super-duper awesome if we could define dependencies
images=('hub', 'phibes', 'webterm')

for image in "${images[@]}"; do
  echo "=============================================================="
  echo "PROCESSING ${image}....."
  cd $image
  ./kill_clean.sh
  ./builder.sh
  ./start.sh
  cd $PWD
done
