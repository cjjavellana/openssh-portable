FROM centos:latest

ADD . /opt/openssh

RUN yum install -y gcc make autoconf zlib-devel openssl-devel gdb
RUN chmod ugo+rwx /root && chmod ugo+rw /opt/openssh/id_rsa

WORKDIR /opt/openssh

RUN autoconf && \
autoheader && \
./configure --prefix=/usr && \
adduser sshd && \
make && make install
 
