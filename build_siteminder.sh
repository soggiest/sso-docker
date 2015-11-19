#!/bin/bash
#
#Runs the Siteminder scripts for a container

chmod 755 /root/ca-wa-12.5-cr02-rhas64.bin

cat <<EOF > /root/siteminder_installer.properties 
USER_INSTALL_DIR=/root/siteminder/webagent/r12.5
USER_SHORTCUTS=/root
EOF

mkdir -p /root/siteminder/webagent/r12.5

/tmp/ca-wa-12.5-cr02-rhas64.bin -f /root/siteminder_installer.properties -i silent >/dev/null 2>&1
