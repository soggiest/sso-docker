FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

USER root

COPY run-proxy.sh /root/run-proxy.sh
RUN chmod 755 /root/run-proxy.sh
RUN chmod -R 777 /opt/rh/httpd24/root/etc/httpd/conf.d/ 

ENTRYPOINT ["/root/run-proxy.sh"]
