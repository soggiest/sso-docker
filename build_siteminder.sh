#!/bin/bash
#
#Runs the Siteminder scripts for a container

chmod 755 /sso-storage/ca-wa-12.5-cr02-rhas64.bin

cat <<EOF > /sso-storage/siteminder_installer.properties 
USER_INSTALL_DIR=/sso-storage/siteminder/webagent/r12.5
USER_SHORTCUTS=/sso-storage
EOF

mkdir -p /sso-storage/siteminder/webagent/r12.5

chmod -R 755 /sso-storage/siteminder/webagent/r12.5

/sso-storage/ca-wa-12.5-cr02-rhas64.bin -f /sso-storage/siteminder_installer.properties -i silent # >/dev/null 2>&1
