## Make executable scripts
chmod +x ./run-demo.sh


## 0. Setup 3 nodes kafka cluster

docker compose -f single-broker.yaml --env-file environment.env up

## 1. Open a Shell Inside Broker 1

Verify all containers are running:


docker ps


Run all Kafka CLI commands inside `broker1`:


docker exec -it kafka-1 bash
cd /opt/kafka/bin


---

## 6. Create a Replicated Topic

Create a topic `demo-topic` with three partitions and replication factor three:


./kafka-topics.sh   --bootstrap-server localhost:9092   --create   --topic demo-topic   --partitions 3   --replication-factor 3


Expected:

text
Created topic demo-topic.



## 7. Inspect the Healthy Topic Layout

Describe the topic:


./kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --describe \
  --topic demo-topic



---

## 8. Simulate a Broker Failure


Verify all containers are running:


docker ps

In a second host terminal:

docker stop kafka-2

Confirm:
docker ps


## 9. Recover the Broker and Confirm ISR

On the host:

docker start kafka-2

After a few seconds, describe the topic again:

./kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --describe \
  --topic demo-topic



Exit the container:


exit


Final check:


docker ps
