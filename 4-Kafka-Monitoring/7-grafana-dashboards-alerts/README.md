````markdown

## Demo Actions (Terminal)

### 2) Create the topic

```bash
chmod +x scripts/*.sh
chmod +x run-demo.sh
chmod +x stop-demo.sh

./run-demo.sh

./scripts/01-create-topic.sh
```

Expected: topic `ops-demo-observability` created.

### 3) Start the consumer group

```bash
./scripts/03-start-consumer.sh

### 4) Start producer load

```bash
./scripts/02-start-load.sh
```

### 5) Check lag (CLI snapshot)

```bash
./scripts/04-check-lag.sh
```

```bash
./scripts/04-check-lag.sh
sleep 5
./scripts/04-check-lag.sh
```

---

## What to observe in Grafana

Open **Kafka Operational Health** dashboard and set:

---


## Stop / Cleanup

```bash
./stop-demo.sh
```

---


* Grafana: [http://localhost:3000](http://localhost:3000) (admin/admin)
```
```
