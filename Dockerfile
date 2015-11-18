FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

USER root

COPY run-proxy.sh /root/run-proxy.sh
CMD /bin/bash -c 'chmod 755 /root/run-proxy.sh'

ENTRYPOINT ["/bin/bash","-c","'/root/run-proxy.sh'"]
