#  Reassign Partitions 

## Prereqs 

- jq installed:
```bash
sudo apt isntall jq
```

## Start / Stop
```bash
chmod +x scripts/*.sh


### Terminal A (Topic State)
```bash
./scripts/02-create-imbalanced-topic.sh
./scripts/03-describe-topic.sh
```

### Terminal B (Reassignment)
```bash
./scripts/04-generate-plan.sh
./scripts/05-execute-plan.sh
./scripts/06-verify-plan.sh
```

### Terminal A (Proof after)
```bash
./scripts/03-describe-topic.sh
./scripts/07-leader-count.sh
```
