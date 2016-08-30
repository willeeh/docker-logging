FROM logstash:2.3.4-1

RUN /opt/logstash/bin/logstash-plugin install logstash-output-amazon_es
RUN /opt/logstash/bin/logstash-plugin install logstash-patterns-core

COPY conf /etc/logstash/conf.d
COPY start_logstash.sh /
RUN chmod +x /start_logstash.sh

ENV AWS_REGION "eu-west-1"
EXPOSE 12201/udp
WORKDIR /
CMD ["sh", "start_logstash.sh"]
# ELASTICSEARCH_HOST needs to be passed through an environment variable (-e)
