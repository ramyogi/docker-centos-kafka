FROM centos
MAINTAINER Canadian Tire Innovations

EXPOSE 9092
VOLUME /data/logs

ENV \
    JAVA_HOME=/usr/java/latest \
    JAVA_VERSION=8u66 \
    JAVA_BUILD_VERSION=b17 \
    JRE_HOME=/usr/java/latest/jre \
    KAFKA_VERSION="0.9.0.0" \
    SCALA_VERSION="2.11"

RUN \
    yum -y upgrade \
    && yum -y update \
    && yum -y install curl tar wget

# --------------------------------------------------------------------------------------------

RUN \
    wget \
        --no-cookies \
        --no-check-certificate \
        --header "Cookie: oraclelicense=accept-securebackup-cookie" \
        "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$JAVA_BUILD_VERSION/jdk-$JAVA_VERSION-linux-x64.rpm" \
        -O /tmp/jdk-8-linux-x64.rpm \
    && yum -y install /tmp/jdk-8-linux-x64.rpm \
    && rm /tmp/jdk-8-linux-x64.rpm

# --------------------------------------------------------------------------------------------

COPY ./scripts/download-kafka.sh /tmp/download-kafka.sh
RUN \
    /tmp/download-kafka.sh \
    && tar xf /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt \
    && rm /tmp/download-kafka.sh \
    && rm /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}
COPY \
    ./scripts/configure-kafka.sh \
    ./scripts/start-kafka.sh \
    /usr/bin/
CMD start-kafka.sh
