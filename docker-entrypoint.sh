#!/bin/sh
set -e

/bin/sed -i "s/{{MasterIP1}}/${MasterIP1}/g" /usr/local/etc/haproxy/haproxy.cfg
/bin/sed -i "s/{{MasterIP2}}/${MasterIP2}/g" /usr/local/etc/haproxy/haproxy.cfg
/bin/sed -i "s/{{MasterIP3}}/${MasterIP3}/g" /usr/local/etc/haproxy/haproxy.cfg
/bin/sed -i "s/{{MasterPort}}/${MasterPort}/g" /usr/local/etc/haproxy/haproxy.cfg


# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- haproxy "$@"
fi

if [ "$1" = 'haproxy' ]; then
	shift # "haproxy"
	# if the user wants "haproxy", let's add a couple useful flags
	#   -W  -- "master-worker mode" (similar to the old "haproxy-systemd-wrapper"; allows for reload via "SIGUSR2")
	#   -db -- disables background mode
	set -- haproxy -W -db "$@"
fi

exec "$@"
