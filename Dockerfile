FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

USER root

COPY run-proxy.sh /root/run-proxy.sh
COPY httpd.conf /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf
COPY ssl.conf /opt/rh/httpd24/root/etc/httpd/conf.d/ssl.conf
RUN chmod 755 /root/run-proxy.sh
RUN ["echo", "error_log", ">", "/opt/rh/httpd24/root/etc/httpd/logs/error_log"]
RUN ["echo", "access_log", ">", "/opt/rh/httpd24/root/etc/httpd/logs/access_log"]
RUN ["chown", "apache", "/opt/rh/httpd24/root/etc/httpd/logs/access_log"]
RUN ["chown", "apache", "/opt/rh/httpd24/root/etc/httpd/logs/error_log"]
RUN chmod -R 777 /opt/rh/httpd24/

EXPOSE 8998 8999

ENTRYPOINT ["/root/run-proxy.sh"]
