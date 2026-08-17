#!/usr/bin/env bash
set -euo pipefail

docker exec kafka-1 bash -lc "
  unset JMX_PORT KAFKA_JMX_PORT KAFKA_JMX_OPTS;
  /opt/kafka/bin/kafka-topics.sh --bootstrap-server kafka-1:9090 \
    --create --if-not-exists \
    --topic ops-demo-metrics \
    --partitions 3 --replication-factor 3
"