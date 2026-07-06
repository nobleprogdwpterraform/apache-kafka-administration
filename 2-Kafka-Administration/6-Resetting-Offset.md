
## Resetting Offsets to the Beginning

./kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --group my-first-application \
  --topic third_topic \
  --reset-offsets \
  --to-earliest \
  --dry-run


## Executing the Offset Reset

./kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --group my-first-application \
  --topic third_topic \
  --reset-offsets \
  --to-earliest \
  --execute

## Verifying the Reset

./kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --describe \
  --group my-first-application


## Starting the Consumer Again

./kafka-console-consumer.sh \
  --topic third_topic \
  --bootstrap-server localhost:9092 \
  --group my-first-application



## Checking Lag After Consumption

./kafka-consumer-groups.sh \
  --bootstrap-server localhost:9092 \
  --describe \
  --group my-first-application