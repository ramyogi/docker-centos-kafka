FROM cantireinnovations/centos-java8

MAINTAINER Canadian Tire Innovations 

ENV KAFKA_VERSION="0.8.2.1" SCALA_VERSION="2.10"

RUN yum update
RUN yum install -y curl docker.io tar wget

ADD download-kafka.sh /tmp/download-kafka.sh
RUN /tmp/download-kafka.sh
RUN tar xf /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt

VOLUME ["/kafka"]

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}
ADD start-kafka.sh /usr/bin/start-kafka.sh
CMD start-kafka.sh
