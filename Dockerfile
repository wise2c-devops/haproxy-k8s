FROM haproxy:1.8.13
COPY docker-entrypoint.sh /
COPY haproxy.cfg /usr/local/etc/haproxy/
