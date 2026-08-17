#  Reassign Partitions 

## Prereqs 

- jq installed:
```bash
sudo apt install jq
```

## Start / Stop
```bash
chmod +x scripts/*.sh
chmod +x run-demo.sh
chmod +x stop-demo.sh


### Terminal A (Topic State)
```bash
./run-demo.sh
./scripts/02-create-imbalanced-topic.sh
./scripts/03-describe-topic.sh
```

### Terminal B (Reassignment)
```bash
./scripts/04-generate-plan.sh
./scripts/05-execute-plan.sh
./scripts/06-verify-plan.sh

docker exec kafka-1 bash -lc /opt/kafka/bin/kafka-leader-election.sh --bootstrap-server kafka-1:9092 --election-type preferred --all-topic-partitions
```

### Terminal A (Proof after)
```bash
./scripts/03-describe-topic.sh
./scripts/07-leader-count.sh

./stop-demo.sh
```
