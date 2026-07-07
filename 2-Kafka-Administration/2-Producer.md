./kafka-topics.sh --create \
  --topic my-topic \
  --partitions 3 \
  --replication-factor 3 \
  --bootstrap-server localhost:9092,localhost:9094

## Producer

./kafka-console-producer.sh \
  --bootstrap-server localhost:9092,localhost:9094 \
  --topic my-topic

## With Message keys
./kafka-console-producer.sh \
  --bootstrap-server localhost:9092,localhost:9094 \
  --topic my-topic \
  --property "parse.key=true" \
  --property "key.separator=:"