

## 📦 **3 — Create Topic With Tight Retention (T2)**


Create fresh topic:

```bash
docker exec -it kafka-1 /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server kafka-1:9092 \
  --create --topic durability-topic \
  --partitions 1 --replication-factor 3
```

Verify:

```bash
docker exec -it kafka-1 /opt/kafka/bin/kafka-topics.sh --bootstrap-server kafka-1:9092 \
  --describe --topic durability-topic
```

---

## 📡 **4 — Start Consumer Group (T2)**

```bash
docker exec -it kafka-1 /opt/kafka/bin/kafka-console-consumer.sh \
  --bootstrap-server kafka-1:9092 \
  --topic durability-topic \
  --group durability-group \
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

## 🔥 **7 — Generate Write Load (T4)**

```bash
docker exec -it kafka-1 /opt/kafka/bin/kafka-producer-perf-test.sh \
  --topic durability-topic \
  --num-records 30000 \
  --record-size 1000 \
  --throughput 1000 \
  --producer-props bootstrap.servers=kafka-1:9092 acks=1
```



## 🔥 **7 — Generate Write Load (T4)**

```bash
docker exec -it kafka-1 /opt/kafka/bin/kafka-producer-perf-test.sh \
  --topic durability-topic \
  --num-records 30000 \
  --record-size 1000 \
  --throughput 1000 \
  --producer-props bootstrap.servers=kafka-1:9092 acks=all
```