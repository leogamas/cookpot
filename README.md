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
- `SECOR_GROUP` = `secor_backup`
- `ZK_PATH` = `/`
- `SEED_BROKER_PORT` = `9092`
- `S3_PATH` = `raw_logs/secor_backup`
- `TOPIC_FILTER` = `.*`
- `MESSAGE_PARSER_CLASS` = `com.pinterest.secor.parser.OffsetMessageParser`
- `TS_NAME` = `timestamp`
- `LOCAL_PATH` = `/mnt/secor_data/message_logs/backup`
- `READER_WRITER_FACTORY` = `com.pinterest.secor.io.impl.SequenceFileReaderWriterFactory`
- `COMPRESSION_CODEC` = ` `

