#!/bin/bash

function add_config () {
    local CONFIG_NAME=$1
    local VAR_VALUE=$2
    if [[ ! -z "$VAR_VALUE" ]]; then
        SECOR_CONFIG="$SECOR_CONFIG -D$CONFIG_NAME=$VAR_VALUE"
        echo "$CONFIG_NAME=$VAR_VALUE"
    fi
}

function required_option () {
    local VAR_NAME=$1
    local VAR_VALUE=${!VAR_NAME}
    local CONFIG_NAME=$2

    if [ -z "$VAR_VALUE" ]; then
    	echo "$VAR_NAME variable not set, launch with -e $VAR_NAME=..."
        exit 1
    else
        add_config $CONFIG_NAME $VAR_VALUE
    fi
}

function default_option () {
    local VAR_NAME=$1
    local VAR_VALUE=${!VAR_NAME}
    local CONFIG_NAME=$2
    local DEFAULT_VALUE=$3

    if [[ -z "$VAR_VALUE" && ! -z "$DEFAULT_VALUE" ]]; then
        VAR_VALUE=$DEFAULT_VALUE
    fi
    add_config $CONFIG_NAME $VAR_VALUE
}

: ${HOST:=localhost}
mkdir -p ${LOCAL_PATH:-/mnt/secor_data/message_logs/backup}

required_option "AWS_ACCESS_KEY" "aws.access.key"
required_option "AWS_SECRET_KEY" "aws.secret.key"
required_option "ZK_QUORUM" "zookeeper.quorum"
required_option "SEED_BROKER_HOST" "kafka.seed.broker.host"
required_option "S3_BUCKET" "secor.s3.bucket"

default_option "MESSAGE_PARSER_CLASS" "secor.message.parser.class" "com.pinterest.secor.parser.AvroMessageParser"
default_option "USE_KAFKA_TIMESTAMP" "kafka.useTimestamp" "true"
default_option "READER_WRITER_FACTORY" "secor.file.reader.writer.factory" "com.pinterest.secor.io.impl.AvroParquetFileReaderWriterFactory"
default_option "SCHEMA_REGISTRY_URL" "schema.registry.url" "http://$HOST:8081"
default_option "TIMEZONE" "secor.parser.timezone" "America/New_York"
default_option "LOG_DELETE_AGE_HOURS" "secor.local.log.delete.age.hours" "24"
default_option "SCHEMA_SUBJECT_SUFFIX" "avro.schema.subject.suffix" "-value"

default_option "SEED_BROKER_PORT" "kafka.seed.broker.port"
default_option "ZK_PATH" "kafka.zookeeper.path"
default_option "PARTITION_HOUR" "partitioner.granularity.hour"
default_option "PARTITION_MINUTE" "partitioner.granularity.minute"
default_option "SECOR_GROUP" "secor.kafka.group"
default_option "TOPIC_FILTER" "secor.kafka.topic_filter"
default_option "LOCAL_PATH" "secor.local.path"
default_option "FILE_MAX_SECONDS" "secor.max.file.age.seconds"
default_option "FILE_MAX_SIZE" "secor.max.file.size.bytes"
default_option "S3_PATH" "secor.s3.path"
default_option "SCHEMA_SUBJECT_OVERRIDE" "avro.schema.subject.override"
