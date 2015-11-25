#!/bin/bash
#
#Runs the Siteminder scripts for a container

chmod 755 /tmp/ca-wa-12.5-cr02-rhas64.bin

cat <<EOF > /tmp/siteminder_installer.properties 
USER_INSTALL_DIR=/tmp/siteminder/webagent/r12.5
USER_SHORTCUTS=/tmp
EOF

mkdir -p /tmp/siteminder/webagent/r12.5

chmod -R 755 /tmp/siteminder/webagent/r12.5

/tmp/ca-wa-12.5-cr02-rhas64.bin -f /tmp/siteminder_installer.properties -i silent >/dev/null 2>&1
