```bash
chmod +x isr-monitor-tuning.sh
chmod +x lag-monitor-tuning.sh
```

---

# 📦 **STEP 2 — Create Topic (T1)**

```bash
docker exec -it kafka-1 /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka-1:9092 \
  --delete --topic throughput-demo-topic 

docker exec -it kafka-1 /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka-1:9092 \
  --create --topic throughput-demo-topic \
  --partitions 3 --replication-factor 3

docker exec -it kafka-1 /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka-1:9092 \
  --describe --topic throughput-demo-topic
```

---

# 👀 **STEP 3 — Start ISR Monitor (T1)**

```bash
./isr-monitor-tuning.sh
```

---

# 📡 **STEP 4 — Start Consumer (T2)**

```bash
docker exec -it kafka-1 /opt/kafka/bin/kafka-console-consumer.sh \
  --bootstrap-server kafka-1:9092 \
  --topic throughput-demo-topic \
  --group tuning-demo-group
```

---

# 📊 **STEP 5 — Start Lag Monitor (T3)**

```bash
./lag-monitor-tuning.sh
```

# ⚙️ **STEP 6 — Baseline Throughput Test (T4)**

```bash
docker exec -it kafka-2 /opt/kafka/bin/kafka-producer-perf-test.sh \
  --topic throughput-demo-topic \
  --num-records 30000 \
  --record-size 200 \
  --throughput 200 \
  --producer-props bootstrap.servers=kafka-1:9092 acks=1
```


# 🚀 **STEP 7 — Tuning 1: Increase batch.size (T4)**

```bash
docker exec -it kafka-2 /opt/kafka/bin/kafka-producer-perf-test.sh \
  --topic throughput-demo-topic \
  --num-records 30000 \
  --record-size 200 \
  --throughput 200 \
  --producer-props bootstrap.servers=kafka-1:9092 acks=1 batch.size=32768
```

---

# 🚀 **STEP 8 — Tuning 2: Add linger.ms (T4)**

```bash
docker exec -it kafka-2 /opt/kafka/bin/kafka-producer-perf-test.sh \
  --topic throughput-demo-topic \
  --num-records 30000 \
  --record-size 200 \
  --throughput 200 \
  --producer-props bootstrap.servers=kafka-1:9092 acks=1 batch.size=32768 linger.ms=5
```
