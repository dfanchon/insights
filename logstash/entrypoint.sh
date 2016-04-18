#!/bin/bash

sed -i "s#mongoURI#$mongoURI#g" /etc/logstash/conf.d/logstash.conf

set -e

# Add logstash as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- logstash "$@"
fi

# Run as user "logstash" if the command is "logstash"
if [ "$1" = 'logstash' ]; then
	set -- gosu logstash "$@"
fi

logstash -f /etc/logstash/conf.d/logstash.conf --log /var/log/logstash/logstash-shipper.log

exec "$@"
