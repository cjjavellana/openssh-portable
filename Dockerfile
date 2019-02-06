FROM centos:latest

RUN mkdir -p /opt/openssh

ADD . /opt/openssh

RUN yum install -y gcc make autoconf zlib-devel openssl-devel gdb
RUN chmod ugo+rwx /root && chmod ugo+rw /opt/openssh/id_rsa

RUN cd /opt/openssh && \
autoconf && \
autoheader && \
sh configure --prefix=/opt/ && \
make
 
