#!/bin/bash

echo "net.core.rmem_max=1048576" >> /etc/sysctl.conf

/etc/init.d/unbound start
/s6-init
