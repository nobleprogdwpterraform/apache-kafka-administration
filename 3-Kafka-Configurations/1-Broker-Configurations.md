# Broker Configurations

| Property | Value |
|---|---|
| broker.id | 1 |
| advertised.listeners | PLAINTEXT://hostname:9092 |
| delete.topic.enable | true |
| log.dirs | /data/kafka |
| auto.create.topics.enable | true |
| num.partitions | 8 |
| default.replication.factor | 3 |
| min.insync.replicas | 2 |
| log.retention.hours | 168 |
| log.segment.bytes | 1073741824 |
| log.retention.check.interval.ms | 300000 |
| offsets.retention.minutes | 10080 |
| background.threads | 10 |
| message.max.bytes | 10485760 |
| unclean.leader.election.enable | false |



## verify broker configs

docker exec kafka-1 /opt/kafka/bin/kafka-configs.sh --bootstrap-server kafka-1:9092 --entity-type brokers --entity-name 1 --describe