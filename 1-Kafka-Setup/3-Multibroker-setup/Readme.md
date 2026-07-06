## generate random cluster id
sh kafka-storage.sh --help
sh kafka-storage.sh random-uuid

## Running docker compose

docker compose --env-file environment.env -f docker-compose.yaml up

4. ## Creating a Topic Using Kafka Server One

./kafka-topics.sh --create --topic test-topic-2 --bootstrap-server localhost:9092

5. ## Listing Topics Using Kafka Server Two

./kafka-topics.sh --list --bootstrap-server localhost:9094

6. ## Listing Topics Using Kafka Server Three
./kafka-topics.sh --list --bootstrap-server localhost:9096