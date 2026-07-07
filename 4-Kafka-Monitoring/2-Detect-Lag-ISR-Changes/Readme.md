 
---

## Delete & Recreate the Topic (T2)**

docker exec -it kafka-1 bash

Inside kafka-1:

Create fresh topic:

```bash
./kafka-topics.sh --bootstrap-server localhost:9092 \
  --create --topic lag-demo-topic \
  --partitions 3 --replication-factor 3
```

Verify:

```bash
./kafka-topics.sh --bootstrap-server localhost:9092 \
  --describe --topic lag-demo-topic
```

---

## **Start Consumer Group (T2)**

Inside localhost:

```bash
./kafka-console-consumer.sh \
  --bootstrap-server localhost:9092 \
  --topic lag-demo-topic \
  --group lag-demo-group \
  --from-beginning
```

---

## ** Start Lag Monitor (T3)**

```bash
cd ~/code/2-Detect-Lag-ISR-Changes
./lag-monitor.sh
```

---

## **Start ISR Monitor (T1)**

```bash
cd ~/code/2-Detect-Lag-ISR-Changes
./isr-monitor.sh
```

---

## **Generate Load on Healthy Cluster (T4)**

```bash
cd ~/code/2-Detect-Lag-ISR-Changes

docker exec -it kafka-1 /opt/kafka/bin/kafka-producer-perf-test.sh \
  --topic lag-demo-topic \
  --num-records 20000 \
  --record-size 100 \
  --throughput 500 \
  --producer-props bootstrap.servers=kafka-1:9090 acks=1
```


---

## ** Stress Broker2 & Create Real Lag**

### ** Pause Broker2 (T1)**

Stop ISR monitor (Ctrl+C), then:

```bash
docker pause kafka-2
docker ps   # shows broker2 as (Paused)
```

Restart ISR monitor:

```bash
./isr-monitor.sh
```


---

### ** Workload While Degraded (T4)**

```bash
docker exec -it kafka-1 /opt/kafka/bin/kafka-producer-perf-test.sh \
  --topic lag-demo-topic \
  --num-records 20000 \
  --record-size 100 \
  --throughput 500 \
  --producer-props bootstrap.servers=kafka-1:9090 acks=1
```


---

## ** Recovery (T1)**

```bash
docker unpause broker2
docker ps   # broker2 Up

./isr-monitor.sh # run monitor
```

---

## ** Stop Demo (optional)**


```bash
./kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic lag-demo-topic
```

