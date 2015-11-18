#!/bin/bash
#
#This script will add the proxy configuration for the SSO Reverse Proxy
#
#TODO: Can we app APPLICATION_NAME to the end of ProxyPass?

PROXY_TARGET = `echo -e $PROXY_TARGET`
/usr/local/bin/run-httpd24.sh
cat <<EOF > /opt/rh/httpd24/root/etc/httpd/conf.d/proxy.conf
ProxyRequests Off
ProxyPass / http://$PROXY_TARGET
ProxyPassReverse / http://$PROXY_TARGET
EOF

/usr/local/bin/run-httpd24.sh httpd -DFOREGROUND