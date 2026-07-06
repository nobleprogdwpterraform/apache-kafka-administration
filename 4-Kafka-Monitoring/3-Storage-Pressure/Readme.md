

## 📦 **3 — Create Topic With Tight Retention (T2)**


Create fresh topic:

```bash
docker exec -it kafka-1 /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka-1:9092 \
  --create \
  --topic storage-pressure-topic \
  --partitions 2 \
  --replication-factor 3 \
  --config retention.ms=300000 \
  --config retention.bytes=268435456 \
  --config segment.bytes=67108864
```

Verify:

```bash
docker exec -it kafka-1 /opt/kafka/bin/kafka-topics.sh --bootstrap-server kafka-1:9092 \
  --describe --topic storage-pressure-topic
```

---

## 📡 **4 — Start Consumer Group (T2)**

```bash
docker exec -it kafka-1 /opt/kafka/bin/kafka-console-consumer.sh \
  --bootstrap-server kafka-1:9092 \
  --topic storage-pressure-topic \
  --group storage-pressure-group \
  --from-beginning
```


---

## 📊 **5 — Start Lag Monitor (T3)**

```bash
./lag-monitor.sh
```

---

## 💾 **6 — Start Disk Usage Monitor (T1)**

```bash
./disk-usage-monitor.sh
```

---

## 🔥 **7 — Generate Heavy Write Load (T4)**

```bash
docker exec -it kafka-1 /opt/kafka/bin/kafka-producer-perf-test.sh \
  --topic storage-pressure-topic \
  --num-records 30000 \
  --record-size 1000 \
  --throughput 1000 \
  --producer-props bootstrap.servers=kafka-1:9092 acks=1
```
