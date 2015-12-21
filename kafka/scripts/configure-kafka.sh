#!/bin/bash
set -e

mkdir -p /etc/kafka/
configPath=/etc/kafka/server.properties
cp $KAFKA_HOME/config/server.properties $configPath

# --------------------------------------------------------

if [[ -z "$KAFKA_BROKER_ID" ]]; then
    echo "\$KAFKA_BROKER_ID not set"
    exit 2
fi

if [[ -z "$KAFKA_ADVERTISED_PORT" ]]; then
    echo "\$KAFKA_ADVERTISED_PORT not set"
    exit 2
fi

if [[ -z "$KAFKA_ZOOKEEPER_CONNECT" ]]; then
    export KAFKA_ZOOKEEPER_CONNECT=$(env | grep ZK.*PORT_2181_TCP= | sed -e 's|.*tcp://||' | paste -sd ,)
fi

if [[ -z "$KAFKA_ZOOKEEPER_CONNECT" ]]; then
    echo "\$KAFKA_ZOOKEEPER_CONNECT not set"
    exit 2
fi

# --------------------------------------------------------

export KAFKA_LOG_DIRS=/data/logs/
export KAFKA_PORT=9092

if [[ -z "$KAFKA_ADVERTISED_PORT" ]]; then
    export KAFKA_ADVERTISED_PORT=9092
fi

if [[ -z "$KAFKA_ADVERTISED_HOST_NAME" ]]; then
    export KAFKA_ADVERTISED_HOST_NAME=$( hostname -I )
fi

if [[ -n "$KAFKA_HEAP_OPTS" ]]; then
    sed -r -i "s/^(export KAFKA_HEAP_OPTS)=\"(.*)\"/\1=\"$KAFKA_HEAP_OPTS\"/g" $KAFKA_HOME/bin/kafka-server-start.sh
    unset KAFKA_HEAP_OPTS
fi

# --------------------------------------------------------

for VAR in `env`
do
  if [[ $VAR =~ ^KAFKA_ && ! $VAR =~ ^KAFKA_HOME ]]; then
    kafka_name=`echo "$VAR" | sed -r "s/KAFKA_(.*)=.*/\1/g" | tr '[:upper:]' '[:lower:]' | tr _ .`
    env_var=`echo "$VAR" | sed -r "s/(.*)=.*/\1/g"`
    if egrep -q "(^|^#)$kafka_name=" $configPath; then
        sed -r -i "s@(^|^#)($kafka_name)=(.*)@\2=${!env_var}@g" $configPath #note that no config values may contain an '@' char
    else
        echo "$kafka_name=${!env_var}" >> $configPath
    fi
  fi
done
