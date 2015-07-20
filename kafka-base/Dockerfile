FROM cantireinnovations/centos-java8
MAINTAINER Canadian Tire Innovations 

ENV \
    KAFKA_VERSION="0.8.2.1" \
    SCALA_VERSION="2.10" \
    KAFKA_HOME=/opt/kafka

COPY scripts/download-kafka.sh /tmp/download-kafka.sh

RUN                                                                                                 \
    yum -y upgrade                                                                                  \
    && yum -y update                                                                                \
    && yum install -y curl tar wget                                                                 \
    && chmod +x /tmp/download-kafka.sh                                                              \
    && /tmp/download-kafka.sh                                                                       \
    && mkdir ${KAFKA_HOME}                                                                          \
    && tar xf /tmp/kafka.tgz -C ${KAFKA_HOME} --strip 1                                             \
    && rm /tmp/kafka.tgz
