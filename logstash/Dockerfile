FROM logstash:2.2
COPY logstash.conf /etc/logstash/conf.d/logstash.conf
COPY run.sh /run.sh
RUN chmod +x /*.sh
CMD ["/run.sh"]
RUN plugin install logstash-input-mongodb
