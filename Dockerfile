FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

USER root

COPY run-proxy.sh /root/run-proxy.sh
COPY httpd.conf /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf
COPY ssl.conf /opt/rh/httpd24/root/etc/httpd/conf.d/ssl.conf
RUN chmod 755 /root/run-proxy.sh
RUN chmod -R 777 /opt/rh/httpd24/
RUN ["echo", "access_logs", ">", "/var/log/httpd24/access_log"]
RUN ["echo", "error_logs", ">", "/var/log/httpd24/error_log"]
RUN ["chown", "apache", "/var/log/httpd24/access_log"]
RUN ["chown", "apache", "/var/log/httpd24/error_log"]

EXPOSE 8998 8999

ENTRYPOINT ["/root/run-proxy.sh"]
