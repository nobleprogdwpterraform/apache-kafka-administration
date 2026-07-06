## Generate cluster id
sh kafka-storage.sh --help
sh kafka-storage.sh random-uuid

## Running docker compose

docker compose --env-file environment.env -f single-broker.yaml up

## Open the Exec Tab in Docker Desktop
## Creating a Topic Using Kafka Server
./kafka-topics.sh --create --topic test-topic-2 --bootstrap-server localhost:9092


## Listing Kafka Topics

./kafka-topics.sh --list --bootstrap-server host.docker.internal:9092


## Executing Kafka CLI Scripts Using Docker Compose Exec

docker compose exec -it kafka-1 /opt/kafka/bin/kafka-topics.sh --list --bootstrap-server host.docker.internal:9092


## Executing Kafka CLI Scripts from the Host Machine
Download kafka on local
https://kafka.apache.org/community/downloads/

tar -xzf kafka_2.12-3.8.1.tgz

sudo apt install openjdk-17-jre-headless

cd kafka/bin
###  run kafka topic cli 
./kafka-topics.sh --list --bootstrap-server localhost:9092

### Add host.docker.internal to etc/hosts
sudo vi /etc/hosts
press i
127.0.0.1 host.docker.internal
ESC :wq! ENTER