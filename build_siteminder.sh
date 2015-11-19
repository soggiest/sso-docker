#!/bin/bash
#
#Runs the Siteminder scripts for a container

chmod 755 /tmp/ ca-wa-12.0-sp3-cr012-linux.bin

cat <EOF > /root/siteminder_installer.properties 
USER_INSTALL_DIR=$HOME/siteminder/webagent/r12.5
USER_SHORTCUTS=/root
EOF

mkdir -p /root/siteminder/webagent/r12.5

/tmp/ca-wa-12.0-sp3-cr012-linux.bin -f $HOME/siteminder_installer.properties -i silent >/dev/null 2>&1