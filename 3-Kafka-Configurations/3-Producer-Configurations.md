# Producer Configurations

| Property | Value |
|---|---|
| bootstrap.servers | localhost:9092,localhost:9094,localhost:9096 |
| acks | all |
| retries | 2147483647 |
| retry.backoff.ms | 100 |
| delivery.timeout.ms | 120000 |
| enable.idempotence | true |
| max.in.flight.requests.per.connection | 5 |
| linger.ms | 5 |
| batch.size | 32768 |
| compression.type | snappy |
| max.request.size | 10485760 |
