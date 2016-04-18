#!/bin/bash
sed -i 's#mongoURI#${mongoURI}#g' /etc/logstash/conf.d/logstash.conf
