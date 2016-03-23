#!/bin/bash

set -e

: ${AWS_ACCESS_KEY:?not set}
: ${AWS_SECRET_KEY:?not set}
: ${ZK_QUORUM:?not set}
: ${SEED_BROKER_HOST:?not set}
: ${S3_BUCKET:?not set}

: ${SECOR_GROUP:=secor_backup}
: ${ZK_PATH:=/}
: ${SEED_BROKER_PORT:=9092}
: ${S3_PATH:=raw_logs/secor_backup}
: ${TOPIC_FILTER:=.*}
: ${MESSAGE_PARSER_CLASS:=com.pinterest.secor.parser.OffsetMessageParser}
: ${TS_NAME:=timestamp}
: ${LOCAL_PATH:=/mnt/secor_data/message_logs/backup}
: ${READER_WRITER_FACTORY:=com.pinterest.secor.io.impl.SequenceFileReaderWriterFactory}

java -ea -Dsecor.kafka.group=${SECOR_GROUP} \
	-Daws.access.key=${AWS_ACCESS_KEY} \
	-Daws.secret.key=${AWS_SECRET_KEY} \
	-Dzookeeper.quorum=${ZK_QUORUM} \
	-Dkafka.zookeeper.path=${ZK_PATH} \
	-Dkafka.seed.broker.host=${SEED_BROKER_HOST} \
	-Dkafka.seed.broker.port=${SEED_BROKER_PORT} \
	-Dsecor.s3.bucket=${S3_BUCKET} \
	-Dsecor.s3.path=${S3_PATH} \
	-Dsecor.kafka.topic_filter=${TOPIC_FILTER} \
	-Dsecor.message.parser.class=${MESSAGE_PARSER_CLASS} \
	-Dmessage.timestamp.name=${TS_NAME} \
	-Dsecor.local.path=${LOCAL_PATH} \
	-Dsecor.file.reader.writer.factory=${READER_WRITER_FACTORY} \
	-Dsecor.compression.codec=${COMPRESSION_CODEC} \
	-Dlog4j.configuration=log4j.prod.properties \
	-Dconfig=secor.prod.backup.properties \
	-cp secor-0.16-SNAPSHOT.jar:lib/* \
	com.pinterest.secor.main.ConsumerMain

