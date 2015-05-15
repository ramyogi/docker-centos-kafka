FROM cantireinnovations/centos-java8
MAINTAINER Canadian Tire Innovations 

ENV \
    KAFKA_VERSION="0.8.2.1" \
    SCALA_VERSION="2.10"

RUN yum -y update && yum install -y \
    curl \
    docker \
    tar \
    wget

COPY jq /usr/local/bin/jq
RUN chmod +x /usr/local/bin/jq

COPY download-kafka.sh /tmp/download-kafka.sh
RUN /tmp/download-kafka.sh
RUN tar xf /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt
RUN rm \
    /tmp/download-kafka.sh \
    /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

VOLUME ["/kafka"]

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}
COPY start-kafka.sh /usr/bin/start-kafka.sh
CMD start-kafka.sh
