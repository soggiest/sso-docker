FROM httpd:2.4

#RUN yum -y install tar glibc.i686
RUN apt-get update
RUN apt-get install libc6 libc6-dev
RUN apt-get -y install lib32z1
#RUN apt-get -y install default-jre
#RUN apt-get -y install default-jdk

RUN mkdir /sso-storage
RUN chmod 777 /sso-storage

COPY run-proxy.sh /sso-storage/run-proxy.sh
COPY httpd.conf /usr/local/apache2/conf/httpd.conf
#COPY ssl.conf /opt/rh/httpd24/root/etc/httpd/conf.d/ssl.conf
COPY ca-wa-12.5-cr02-rhas64.bin /sso-storage/ca-wa-12.5-cr02-rhas64.bin
#COPY ca-wa-12.5-cr02-rhas64.bin /root/ca-wa-12.5-cr02-rhas64.bin
COPY host_registry.sh /sso-storage/host_registry.sh
#COPY log_to_stdout.pl /sso-storage/log_to_stdout.pl
COPY build_siteminder.sh /sso-storage/build_siteminder.sh

RUN chmod 755 /sso-storage/run-proxy.sh
RUN chmod 755 /sso-storage/host_registry.sh
RUN chmod 755 /sso-storage/build_siteminder.sh
RUN chmod 755 /sso-storage/ca-wa-12.5-cr02-rhas64.bin
#RUN chmod 755 /sso-storage/ca-wa-12.5-cr02-rhas64.bin
#RUN chmod 755 /sso-storage/log_to_stdout.pl

RUN chmod -R 777 /usr/local/apache2
##RUN chmod 777 /proc/self/fd/1
##RUN chmod 777 /proc/self/fd/2
##RUN chmod -R 777 /opt/rh/httpd24/
##RUN chmod -R 777 /var/log/httpd24/

RUN /sso-storage/build_siteminder.sh

ENV USER_INSTALL_DIR=/sso-storage/siteminder/webagent/r12.5
ENV HTTPD_LOG_TO_VOLUME=true

EXPOSE 8998

ENTRYPOINT ["/sso-storage/run-proxy.sh"]
