# Squid3
#
# A VERY simple squid proxy server.

FROM phusion/baseimage:0.9.15
MAINTAINER CosmicQ <cosmicq@cosmicegg.net>

ENV HOME /root
ENV LANG en_US.UTF-8
RUN locale-gen en_US.UTF-8

RUN ln -s -f /bin/true /usr/bin/chfn

# Install Squid
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install squid3 && apt-get clean

ADD squid.conf /etc/squid/squid.conf
ADD start.sh /start.sh

EXPOSE 3128
VOLUME ["/var/spool/squid3"]

CMD ["/start.sh"]
