
## Consumer
./kafka-console-consumer.sh \
  --topic my-topic \
  --from-beginning \
  --bootstrap-server localhost:9092

## Starting a Producer in Another Terminal

./kafka-console-producer.sh \
  --bootstrap-server localhost:9092,localhost:9094 \
  --topic my-topic


## Starting a Second Consumer

./kafka-console-consumer.sh \
  --topic my-topic \
  --from-beginning \
  --bootstrap-server localhost:9092



## Reading New Messages Only
./kafka-console-consumer.sh \
  --topic my-topic \
  --bootstrap-server localhost:9092


## Reading keys and values
./kafka-console-consumer.sh \
  --topic my-topic \
  --from-beginning \
  --bootstrap-server localhost:9092 \
  --property "print.key=true" \
  --property "print.value=true"


## Printing Only the Key
./kafka-console-consumer.sh \
  --topic my-topic \
  --from-beginning \
  --bootstrap-server localhost:9092 \
  --property "print.key=true" \
  --property "print.value=false"