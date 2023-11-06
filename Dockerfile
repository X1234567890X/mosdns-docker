FROM --platform=${TARGETPLATFORM} golang:alpine as builder
ARG CGO_ENABLED=0
ARG TAG
ARG REPOSITORY

WORKDIR /root
RUN apk add --update git \
	&& git clone https://github.com/${REPOSITORY} mosdns \
	&& cd ./mosdns \
	&& git fetch --all --tags \
	&& git checkout tags/${TAG} \
	&& go build -ldflags "-s -w -X main.version=${TAG}" -trimpath -o mosdns

FROM --platform=${TARGETPLATFORM} alpine:latest
LABEL maintainer="dante <github.com/0x5826>"

COPY --from=builder /root/mosdns/mosdns /usr/bin/

RUN apk add --no-cache ca-certificates \
	&& mkdir /etc/mosdns

ADD config.yaml /etc/mosdns

ADD entrypoint.sh /root
ADD init_rules.sh /root
RUN chmod a+x /root/*.sh && \
	/root/init_rules.sh

VOLUME /etc/mosdns

EXPOSE 53/udp
EXPOSE 53/tcp

WORKDIR /etc/mosdns

CMD ["/root/entrypoint.sh"]