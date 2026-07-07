````markdown

## Demo Actions (Terminal)

### 2) Create the topic

```bash
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
* Prometheus: [http://localhost:9090](http://localhost:9090)
* Kafka exporters:

  * Kafka exporter: `:9308/metrics`
  * JMX exporters:

    * broker1: `:5556/metrics`
    * broker2: `:5557/metrics`
    * broker3: `:5558/metrics`

```
```
