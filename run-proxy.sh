#!/bin/bash
#
#This script will add the proxy configuration for the SSO Reverse Proxy
#
#TODO: Can we app APPLICATION_NAME to the end of ProxyPass?

PROXY_TARGET=`echo -e $PROXY_TARGET`

echo `whoami`
echo $PROXY_TARGET

cat <<EOF > /sso-storage/proxy.conf
ProxyRequests Off
ProxyVia On
ProxyPreserveHost Off
ProxyStatus On
AllowCONNECT 8080
ProxyPass / http://$PROXY_TARGET/
ProxyPassReverse / http://$PROXY_TARGET/
Header set Proxy-Test "I love reverse proxies!"
LogLevel Info
EOF

#echo "error_log" > /opt/rh/httpd24/root/etc/httpd/logs/error_log
#echo "access_log" > /opt/rh/httpd24/root/etc/httpd/logs/access_log
#chown apache /opt/rh/httpd24/root/etc/httpd/logs/access_log
#chown apache /opt/rh/httpd24/root/etc/httpd/logs/error_log

#cp /sso-storage/proxy.conf /opt/rh/httpd24/root/etc/httpd/conf.d/proxy.conf
cp /sso-storage/proxy.conf /usr/local/apache2/conf/extra/proxy-html.conf

/sso-storage/host_registry.sh

#/opt/rh/httpd24/root/usr/sbin/httpd -DFOREGROUND
#/usr/local/bin/run-httpd24.sh httpd -DFOREGROUND

#exec "$@"

set -e

# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache2/logs/httpd.pid

exec httpd -DFOREGROUND
