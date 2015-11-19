#!/bin/bash
#
#runs the Host Registration scripts

source $USER_INSTALL_DIR/ca_wa_env.sh
export SMREGHOST=”$USER_INSTALL_DIR/bin/”
exprt SMHOST=”$USER_INSTALL_DIR/config/SmHost.conf”
export HOSTNAME=`hostname`

$USER_INSTALL_DIR/bin/smreghost –i $POLICY_SERVER –u $POLICY_SERVER_USERNAME –p $POLICY_SERVER_PASSWORD –hn $HOSTNAME – hc $POLICYSERVER –cf “COMPACT” –f $SMHOST

cat <<EOF > /root/webagent_config.properties 
USER_INSTALL_DIR=/root/siteminder/webagent/r12.5
USER_SHORTCUTS=/root
HOST_REGISTRATION_YES=0
APACHE_SELECTED=1
APACHE_WEBSERVER_ROOT=<Path to apache dir, which contains the conf dir>
APACHE_SPECIFIC_PATH_YES=
APACHE_VENDOR_TYPE=HTTP_APACHE
APACHE_VERSION=2.2.15
WEB_SERVER_INFO=Apache,/opt/rh/httpd24/root/etc/httpd/conf,Apache 2.2.15,+EMPTYSTR+,apache,2.2.15,/opt/rh/httpd24/root/etc/httpd/conf,Unix,+EMPTYSTR+,1,1,0,0,0,1,No advanced authentication,127.0.0.1:8998,0,undefined,ENC:6f1I5TLVEpuSBHpf4GrASg==,
ENABLE_WEBAGENT_RESULT=YES 
EOF

$USER_INSTALL_DIR/ca-wa-config.sh –f $HOME/webagent_config.properties –i silent;