
---

# 📦 **STEP 3 — Create Topic `scale-demo-topic-v2` (T2 inside broker1)**

```bash
kafka-topics --bootstrap-server broker1:9092 \
  --create --topic scale-demo-topic-v2 \
  --partitions 6 --replication-factor 2
```

Verify:

```bash
kafka-topics --bootstrap-server broker1:9092 \
  --describe --topic scale-demo-topic-v2
```


---

# 🧑‍🏫 **STEP 4 — Start Consumer Group (T2 inside broker1)**

```bash
kafka-console-consumer \
  --bootstrap-server broker1:9092 \
  --topic scale-demo-topic-v2 \
  --group scale-demo-group
```

Leave it running.

---

# ⚡ **STEP 5 — Warm Up Offsets (T4)**

This ensures lag monitor sees the group.

```bash
docker exec -it broker3 kafka-producer-perf-test \
  --topic scale-demo-topic-v2 \
  --num-records 5000 \
  --record-size 200 \
  --throughput 100 \
  --producer-props bootstrap.servers=broker1:9092 acks=1
```

---

# 📊 **STEP 6 — Start Monitoring Tools**

### **T1 — ISR Monitor**

```bash
./isr-monitor-scale.sh
./leader-monitor-scale.sh
./lag-monitor-scale.sh
```

You should see all ISR entries **green**.

---

### **T5 — Leader Distribution Monitor**

```bash
  docker exec broker1 kafka-topics \
    --bootstrap-server broker1:9092 \
    --describe --topic 
```



# 🔥 **STEP 7 — Main Throughput Load (T4)**

```bash
docker exec -it broker3 kafka-producer-perf-test \
  --topic scale-demo-topic-v2 \
  --num-records 1000 \
  --record-size 200 \
  --throughput 200 \
  --producer-props bootstrap.servers=broker1:9092 acks=1
```



 