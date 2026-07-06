## Creating a New Topic

./kafka-topics.sh --create \
  --topic third_topic \
  --partitions 3 \
  --replication-factor 3 \
  --bootstrap-server localhost:9092,localhost:9094

## Starting the First Consumer in a Group

./kafka-console-consumer.sh \
  --topic third_topic \
  --bootstrap-server localhost:9092 \
  --group my-first-application

## Starting a Producer

./kafka-console-producer.sh \
  --bootstrap-server localhost:9092,localhost:9094 \
  --topic third_topic \
  --producer-property partitioner.class=org.apache.kafka.clients.producer.RoundRobinPartitioner


## Starting a Second Consumer in the Same Group

./kafka-console-consumer.sh \
  --topic third_topic \
  --bootstrap-server localhost:9092 \
  --group my-first-application


## Starting a Third Consumer

./kafka-console-consumer.sh \
  --topic third_topic \
  --bootstrap-server localhost:9092 \
  --group my-first-application

## Using a Different Consumer Group

./kafka-console-consumer.sh \
  --topic third_topic \
  --from-beginning \
  --bootstrap-server localhost:9092 \
  --group my-second-application



## Listing Consumer Groups

./kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --list


## Describing a Consumer Group

./kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --describe \
  --group my-second-application