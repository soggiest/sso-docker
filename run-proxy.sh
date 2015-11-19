#!/bin/bash
#
#This script will add the proxy configuration for the SSO Reverse Proxy
#
#TODO: Can we app APPLICATION_NAME to the end of ProxyPass?

PROXY_TARGET=`echo -e $PROXY_TARGET`

echo `whoami`
echo $PROXY_TARGET

cat <<EOF > /tmp/proxy.conf
ProxyRequests Off
ProxyPass / http://$PROXY_TARGET
ProxyPassReverse / http://$PROXY_TARGET
EOF

#echo "error_log" > /opt/rh/httpd24/root/etc/httpd/logs/error_log
#echo "access_log" > /opt/rh/httpd24/root/etc/httpd/logs/access_log
#chown apache /opt/rh/httpd24/root/etc/httpd/logs/access_log
#chown apache /opt/rh/httpd24/root/etc/httpd/logs/error_log

cp /tmp/proxy.conf /opt/rh/httpd24/root/etc/httpd/conf.d/proxy.conf

#/root/host_registry.sh

/opt/rh/httpd24/root/usr/sbin/httpd -DFOREGROUND
#/usr/local/bin/run-httpd24.sh httpd -DFOREGROUND
