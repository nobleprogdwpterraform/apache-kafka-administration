#!/usr/bin/env bash
set -euo pipefail

docker exec kafka-1 bash -lc "
  unset JMX_PORT KAFKA_JMX_PORT KAFKA_JMX_OPTS;
  /opt/kafka/bin/kafka-producer-perf-test.sh \
    --topic ops-demo-metrics \
    --num-records 1000 \
    --record-size 100 \
    --throughput 50 \
    --producer-props bootstrap.servers=kafka-1:9090 acks=1 linger.ms=5 batch.size=32768
"