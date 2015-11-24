FROM httpd:2.4

RUN yum -y install tar glibc.i686 ps

COPY run-proxy.sh /root/run-proxy.sh
COPY httpd.conf /opt/rh/httpd24/root/etc/httpd/conf/httpd.conf
#COPY ssl.conf /opt/rh/httpd24/root/etc/httpd/conf.d/ssl.conf
COPY ca-wa-12.5-cr02-rhas64.bin /root/ca-wa-12.5-cr02-rhas64.bin
COPY host_registry.sh /root/host_registry.sh
#COPY log_to_stdout.pl /tmp/log_to_stdout.pl
COPY build_siteminder.sh /root/build_siteminder.sh

RUN chmod 755 /root/run-proxy.sh
RUN chmod 755 /root/host_registry.sh
RUN chmod 755 /root/build_siteminder.sh
RUN chmod 755 /root/ca-wa-12.5-cr02-rhas64.bin
RUN chmod 755 /tmp/log_to_stdout.pl
#RUN chmod 777 /proc/self/fd/1
#RUN chmod 777 /proc/self/fd/2
#RUN chmod -R 777 /opt/rh/httpd24/
#RUN chmod -R 777 /var/log/httpd24/

RUN /root/build_siteminder.sh

ENV USER_INSTALL_DIR=/root/siteminder/webagent/r12.5
ENV HTTPD_LOG_TO_VOLUME=true

EXPOSE 8998

ENTRYPOINT ["/root/run-proxy.sh"]
