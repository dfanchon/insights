FROM logstash:2.2
RUN plugin install logstash-input-mongodb
COPY logstash.conf /etc/logstash/conf.d/logstash.conf
COPY run.sh /run.sh
RUN chmod +x /*.sh
CMD ["/run.sh"]
