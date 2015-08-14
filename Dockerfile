FROM buildpack-deps:jessie
MAINTAINER nick@silvamerica.com

RUN apt-get update && \
	apt-get install -y --no-install-recommends \
						unzip && \
	rm -rf /var/lib/apt/lists/*

ENV HASHI_PRODUCT packer
ENV HASHI_VERSION 0.8.5

RUN curl -fsSL http://dl.bintray.com/mitchellh/${HASHI_PRODUCT}/${HASHI_PRODUCT}_${HASHI_VERSION}_linux_amd64.zip > /tmp/${HASHI_PRODUCT}.zip && \
		unzip /tmp/${HASHI_PRODUCT}.zip -d /usr/local/bin && \
		rm /tmp/${HASHI_PRODUCT}.zip

VOLUME /data
WORKDIR /data

ENTRYPOINT ["/usr/local/bin/packer"]

CMD ["--help"]
