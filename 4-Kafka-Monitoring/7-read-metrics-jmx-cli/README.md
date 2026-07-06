
Start the environment:

```bash
./run-demo.sh
```

# 🧭 Demo Flow (follow in this order)

## STEP 1 — Create the topic (T1)

```bash
./scripts/01-create-topic.sh
```

---

## STEP 2 — Start producer load (T3)

```bash
./scripts/02-start-load.sh
```
---

## STEP 3 — Check lag BEFORE consumer starts (T2)

```bash
./scripts/04-check-lag.sh
```

---

## STEP 4 — Start the consumer group (T2)

```bash
./scripts/03-start-consumer.sh &
```

---

## STEP 5 — Observe lag (run twice) (T2)

```bash
./scripts/04-check-lag.sh
sleep 2
./scripts/04-check-lag.sh
```

---

## STEP 6 — Read broker metrics via JMX (T1)

```bash
./scripts/05-jmx-broker-stats.sh
./scripts/06-jmx-throughput.sh
./scripts/07-jmx-request-latency.sh
```

## Option 1

```bash
./run-demo.sh --down
```

## Option 2

```bash
docker compose down -v --remove-orphans
```
