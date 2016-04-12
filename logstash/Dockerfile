FROM logstash:2.2
COPY logstash.conf /etc/logstash/conf.d/logstash.conf
RUN plugin install logstash-input-mongodb
