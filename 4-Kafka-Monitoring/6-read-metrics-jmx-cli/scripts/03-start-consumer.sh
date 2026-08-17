#!/usr/bin/env bash
set -euo pipefail

docker exec kafka-1 bash -lc "
  unset JMX_PORT KAFKA_JMX_PORT KAFKA_JMX_OPTS;
  /opt/kafka/bin/kafka-console-consumer.sh \
    --bootstrap-server kafka-1:9090 \
    --topic ops-demo-metrics \
    --group ops-demo-cg \
    --from-beginning \
    > /tmp/ops-demo-consumer.log 2>&1
"