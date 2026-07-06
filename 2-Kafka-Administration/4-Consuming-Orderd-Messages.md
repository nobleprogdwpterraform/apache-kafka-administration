
## Creating a New Topic

./kafka-topics.sh --create \
  --topic messages-order \
  --partitions 3 \
  --replication-factor 3 \
  --bootstrap-server localhost:9092,localhost:9094


## Producing Messages with Keys
./kafka-console-producer.sh \
  --topic messages-order \
  --bootstrap-server localhost:9092,localhost:9094 \
  --property "parse.key=true" \
  --property "key.separator=:"

## Send Messages

## Consuming Messages from the Topic
./kafka-console-consumer.sh \
  --topic messages-order \
  --from-beginning \
  --bootstrap-server localhost:9092 \
  --property "print.key=true"

## Observing the Output
