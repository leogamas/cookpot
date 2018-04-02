# Secor Dockerfile

Just a secor Dockerfile
https://github.com/pinterest/secor

## Required env variables
- `AWS_ACCESS_KEY`
- `AWS_SECRET_KEY`
- `ZK_QUORUM`
- `SEED_BROKER_HOST`
- `S3_BUCKET`

## optional env/defaults

- `MESSAGE_PARSER_CLASS` = `secor.message.parser.class` (com.pinterest.secor.parser.AvroMessageParser)
- `USE_KAFKA_TIMESTAMP` = `kafka.useTimestamp` (true)
- `READER_WRITER_FACTORY` = `secor.file.reader.writer.factory` (com.pinterest.secor.io.impl.AvroParquetFileReaderWriterFactory)
- `SCHEMA_REGISTRY_URL` = `schema.registry.url` (http://$HOST:8081)
- `TIMEZONE` = `secor.parser.timezone` (America/New_York)
- `LOG_DELETE_AGE_HOURS` = `secor.local.log.delete.age.hours` (24)
- `SCHEMA_SUBJECT_SUFFIX` = `avro.schema.subject.suffix` (-value)

- `SEED_BROKER_PORT` = `kafka.seed.broker.port`
- `ZK_PATH` = `kafka.zookeeper.path`
- `PARTITION_HOUR` = `partitioner.granularity.hour`
- `PARTITION_MINUTE` = `partitioner.granularity.minute`
- `SECOR_GROUP` = `secor.kafka.group`
- `TOPIC_FILTER` = `secor.kafka.topic_filter`
- `LOCAL_PATH` = `secor.local.path`
- `FILE_MAX_SECONDS` = `secor.max.file.age.seconds`
- `FILE_MAX_SIZE` = `secor.max.file.size.bytes`
- `S3_PATH` = `secor.s3.path`
- `SCHEMA_SUBJECT_OVERRIDE` = `avro.schema.subject.override`
