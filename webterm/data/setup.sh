#!/bin/bash

mkdir -p /var/webssh2
cd /var/webssh2
sed -i '/rpm.install.excludedocs = yes/c\# rpm.install.excludedocs = yes' /etc/zypp/zypp.conf
zypper in -y npm-default git openssh-server zsh man vim shadow

git clone https://github.com/billchurch/webssh2.git
cp /var/buildah-data/config.json webssh2/app/.
cd webssh2/app/
npm install --production

/usr/sbin/sshd-gen-keys-start
mkdir -p /home
/usr/sbin/groupadd -g 1000 sam
/usr/sbin/useradd -M \
                  -g 1000 \
                  -d /home/sam \
                  -s /bin/zsh sam

echo "sam:$1" | /usr/sbin/chpasswd
