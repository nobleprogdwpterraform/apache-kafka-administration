## Topic creation Command



./kafka-topics.sh --create \
  --topic topic-1 \
  --partitions 3 \
  --replication-factor 3 \
  --bootstrap-server localhost:9092,localhost:9094


## List topics
./kafka-topics.sh --list --bootstrap-server localhost:9092,localhost:9094

## Describe Topic
./kafka-topics.sh --describe --bootstrap-server localhost:9092

## Delete topic
./kafka-topics.sh --delete --topic topic-1 --bootstrap-server localhost:9092