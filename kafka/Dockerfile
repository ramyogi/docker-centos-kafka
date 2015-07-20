FROM cantireinnovations/kafka-base@kafka-v0.8.2.1_scala-v2.10
MAINTAINER Canadian Tire Innovations 

VOLUME [ "/kafka" ]

COPY scripts/start-kafka.sh /usr/bin/start-kafka
RUN chmod +x /usr/bin/start-kafka
CMD [ "start-kafka" ]
