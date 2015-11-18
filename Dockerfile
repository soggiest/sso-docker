FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

USER root

COPY run-proxy.sh /root/run-proxy.sh
CMD chmod 755 /root/run-proxy.sh

ENTRYPOINT ["/root/run-proxy.sh"]
