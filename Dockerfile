FROM ubuntu:14.04
MAINTAINER L. Deri <deri@ntop.org>

RUN apt-get update
RUN apt-get -y -q install curl
RUN curl -s --remote-name http://packages.ntop.org/apt/14.04/all/apt-ntop.deb
RUN sudo dpkg -i apt-ntop.deb
RUN rm -rf apt-ntop.deb

RUN apt-get update
RUN apt-get -y -q install ntopng redis-server libpcap0.8 libmysqlclient18

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 3000

RUN echo "/etc/init.d/redis-server start && /etc/init.d/ntopng start && while true; do sleep 1m; done " > /tmp/run.sh && chmod +x /tmp/run.sh

ENTRYPOINT /tmp/run.sh
