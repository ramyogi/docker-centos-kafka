#!/bin/bash
set -e

if [[ -z "$NO_AUTO_CONFIGURE" ]]; then
    configure-kafka.sh
fi

$KAFKA_HOME/bin/kafka-server-start.sh /etc/kafka/server.properties
