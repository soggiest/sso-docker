FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

USER root

COPY run-proxy.sh /root/run-proxy.sh
COPY httpd.conf /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf
COPY ssl.conf /opt/rh/httpd24/root/etc/httpd/conf.d/ssl.conf
RUN chmod 755 /root/run-proxy.sh
RUN touch /opt/rh/httpd24/root/etc/httpd/logs/error_log
RUN touch /opt/rh/httpd24/root/etc/httpd/logs/access_log
RUN chown apache:apache /opt/rh/httpd24/root/etc/httpd/logs/access_log
RUN chown apache:apache /opt/rh/httpd24/root/etc/httpd/logs/error_log
RUN chmod -R 777 /opt/rh/httpd24/

EXPOSE 8998 8999

ENTRYPOINT ["/root/run-proxy.sh"]
