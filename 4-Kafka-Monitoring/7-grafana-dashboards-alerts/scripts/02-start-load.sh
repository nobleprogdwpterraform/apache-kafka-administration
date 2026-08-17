#!/usr/bin/env bash
set -euo pipefail

docker exec kafka-1 bash -lc "
  unset JMX_PORT KAFKA_JMX_PORT KAFKA_JMX_OPTS;
  /opt/kafka/bin/kafka-producer-perf-test.sh \
    --topic ops-demo-observability \
    --num-records 10000 \
    --record-size 100 \
    --throughput 100 \
    --producer-props bootstrap.servers=kafka-1:9090 acks=1 linger.ms=5 batch.size=32767
"
