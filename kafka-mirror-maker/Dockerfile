FROM cantireinnovations/kafka-base@kafka-v0.8.2.1_scala-v2.10
MAINTAINER Canadian Tire Innovations 

COPY scripts/start-kafka-mirror-maker.sh /usr/bin/start-kafka-mirror-maker
RUN chmod +x /usr/bin/start-kafka-mirror-maker
CMD [ "start-kafka-mirror-maker" ]
