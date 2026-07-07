# Topic Configurations

| Property | Value |
|---|---|
| min.insync.replicas | 2 |
| cleanup.policy | delete |
| retention.ms | 604800000 |
| retention.bytes | -1 |
| log.retention.hours | 168 |
| log.retention.ms | -1 |
| log.retention.minutes | 10080 |
| log.retention.bytes | -1 |
| log.segment.bytes | 1073741824 |
| log.segment.ms | 604800000 |
| segment.bytes | 1073741824 |
| segment.ms | 604800000 |
| delete.retention.ms | 86400000 |
| unclean.leader.election.enable | false |
| max.message.bytes | 10485760 |




## Changing a Topic configurations

```bash id="ez4qcu"
./kafka-topics.sh --describe \
  --bootstrap-server localhost:9092 \
  --topic configured-topic
```

```bash id="e3ly62"
./kafka-configs.sh \
  --bootstrap-server localhost:9092 \
  --entity-type topics \
  --entity-name configured-topic \
  --describe
```


```bash id="rjkhyh"
./kafka-configs.sh \
  --bootstrap-server localhost:9092 \
  --entity-type topics \
  --entity-name configured-topic \
  --alter \
  --add-config min.insync.replicas=2
```
 
 ### Kafka topics command to see topic configuration.

```bash id="ep56es"
./kafka-topics.sh --describe \
  --bootstrap-server localhost:9092 \
  --topic configured-topic
```



## Delete the Topic Configuration

```bash id="fgg36n"
./kafka-configs.sh \
  --bootstrap-server localhost:9092 \
  --entity-type topics \
  --entity-name configured-topic \
  --alter \
  --delete-config min.insync.replicas
```

## Verify the Config Was Removed

Now describe the topic configuration again.

```bash id="m5okdn"
./kafka-configs.sh \
  --bootstrap-server localhost:9092 \
  --entity-type topics \
  --entity-name configured-topic \
  --describe
```




## Log Compaction Compacted Topic


```bash id="68v1rw"
./kafka-topics.sh --create \
  --bootstrap-server localhost:9092 \
  --topic employee-salary \
  --partitions 1 \
  --replication-factor 1 \
  --config cleanup.policy=compact \
  --config min.cleanable.dirty.ratio=0.001 \
  --config segment.ms=5000
```


##  Start a Consumer

```bash id="vfuzty"
./kafka-console-consumer.sh \
  --bootstrap-server localhost:9092 \
  --topic employee-salary \
  --from-beginning \
  --property print.key=true \
  --property print.value=true
```

## Start a Producer with Key Support

```bash id="xjq8xo"
./kafka-console-producer.sh \
  --bootstrap-server localhost:9092 \
  --topic employee-salary \
  --property parse.key=true \
  --property key.separator=,
```

## Produce Salary Records

```text id="1xmf3i"
Patrick,10000
Lucy,20000
Bob,20000
Patrick,25000
Lucy,30000
Patrick,30000
```

##  Stop and Restart the Consumer
