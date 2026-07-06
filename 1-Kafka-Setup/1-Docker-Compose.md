
=====Download kafka on local
https://kafka.apache.org/community/downloads/

tar -xzf kafka_2.12-3.8.1.tgz

sudo apt install openjdk-17-jre-headless

======= generate random cluster id
sh kafka-storage.sh --help
sh kafka-storage.sh random-uuid

create new folder in kafka-1-data

services:
  kafka-1:
    image: apache/kafka:3.8.0
    container_name: kafka-1
    ports:
      - "9092:9092"
    environment:
      CLUSTER_ID: "WnLkTHhkQaiJbwP8FClPhw"
      KAFKA_NODE_ID: 1
      KAFKA_PROCESS_ROLES: broker,controller
      KAFKA_CONTROLLER_QUORUM_VOTERS: 1@kafka-1:9091
      KAFKA_LISTENERS: PLAINTEXT://:9090,CONTROLLER://:9091,EXTERNAL://:9092
      KAFKA_ADVERTISED_LISTENERS: PLAINTEXT://kafka-1:9090,EXTERNAL://${HOSTNAME:-localhost}:9092
      KAFKA_CONTROLLER_LISTENER_NAMES: CONTROLLER
      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT,EXTERNAL:PLAINTEXT
      KAFKA_INTER_BROKER_LISTENER_NAME: PLAINTEXT
      KAFKA_LOG_DIRS: /var/lib/kafka/data
    volumes:
      - ./kafka-1-data:/var/lib/kafka/data
 

docker compose -f single-broker.yaml --env-file environment.env up

===== Executing kafka container from docker desktop
/opt/kafka/bin $ ./kafka-topics.sh --create --topic test-topic --bootstrap-server host.docker.internal:9092

/opt/kafka/bin $ ./kafka-topics.sh --list --bootstrap-server host.docker.internal:9092

===  Executing Kafka container from host
docker compose -f single-broker.yaml exec kafka-1 /opt/kafka/bin/kafka-topics.sh --list --bootstrap-server localhost:9092

===== Execute kafka cli from host

```
sudo vi /etc/hosts

press i

127.0.0.1 host.docker.internal

ESC :wq! ENTER