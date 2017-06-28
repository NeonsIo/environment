FROM haproxy:1.7

ENV HAPROXY_USER haproxy

RUN groupadd --system ${HAPROXY_USER} && \
  useradd --system --gid ${HAPROXY_USER} ${HAPROXY_USER} && \
  mkdir --parents /var/lib/${HAPROXY_USER} && \
  chown -R ${HAPROXY_USER}:${HAPROXY_USER} /var/lib/${HAPROXY_USER}

RUN mkdir -p /etc/ssl/neons.io
COPY neons.io.pem /etc/ssl/neons.io/neons.io.pem

COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

RUN mkdir -p /etc/rsyslog.d
COPY haproxy.conf /etc/rsyslog.d/haproxy.conf

RUN apt-get update
RUN apt-get install -y rsyslog
RUN /etc/init.d/rsyslog restart