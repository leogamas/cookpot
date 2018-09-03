#!/bin/bash
set -e

source config.sh

: ${CONFIG_FILE:=secor.prod.backup.properties}
: ${LOG_CONFIG_FILE:=log4j.docker.properties}
: ${CLASSPATH:="*:lib/*"}
: ${JVM_MEMORY:=1024m}

java -Xmx${JVM_MEMORY} $JAVA_OPTS -ea \
    -Dconfig=${CONFIG_FILE} \
    -Dlog4j.configuration=${LOG_CONFIG_FILE} \
    ${SECOR_CONFIG} ${SECOR_EXTRA_OPTS} \
    -cp $CLASSPATH \
    com.pinterest.secor.main.ConsumerMain
