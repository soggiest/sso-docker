FROM registry.access.redhat.com/rhscl/httpd-24-rhel7

USER root

COPY run-proxy.sh /root/run-proxy.sh
COPY httpd.conf /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf
COPY ssl.conf /opt/rh/httpd24/root/etc/httpd/conf.d/ssl.conf
COPY ca-wa-12.5-cr02-rhas64.bin /root/ca-wa-12.5-cr02-rhas64.bin
COPY host_registry.sh /root/host_registry.sh
COPY log_to_stdout.pl /tmp/log_to_stdout.pl
COPY build_siteminder.sh /root/build_siteminder.sh

RUN chmod 755 /root/run-proxy.sh
RUN chmod 755 /root/host_registry.sh
RUN chmod 755 /root/build_siteminder.sh
RUN chmod 755 /root/ca-wa-12.5-cr02-rhas64.bin
RUN chmod 755 /tmp/log_to_stdout.pl
RUN chmod -R 777 /opt/rh/httpd24/

RUN /root/build_siteminder.sh

ENV USER_INSTALL_DIR=/root/siteminder/webagent/r12.5

EXPOSE 8998 8999

ENTRYPOINT ["/root/run-proxy.sh"]
