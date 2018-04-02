FROM openjdk:8

MAINTAINER Ryan Anguiano <ryan@revpointmedia.com>

ENV BUILD_DEPS git maven make
ENV SECOR_REPO https://github.com/revpoint/secor.git
ENV SECOR_VERSION origin/schema_registry_value_topic_name

RUN apt-get update \
	&& apt-get install -y $BUILD_DEPS --no-install-recommends \
	&& git clone $SECOR_REPO && cd secor && git checkout $SECOR_VERSION \
    && make build \
	&& mkdir /opt/secor \
	&& tar zxvf target/secor-*.tar.gz -C /opt/secor \
	&& cd .. && rm -rf secor \
	&& apt-get purge -y --auto-remove $BUILD_DEPS

ADD config.sh run.sh /opt/secor/

WORKDIR /opt/secor

ENTRYPOINT ["/opt/secor/run.sh"]
