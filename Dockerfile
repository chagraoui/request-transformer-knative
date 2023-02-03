FROM alpine:latest as builder
RUN apk add --no-cache git
RUN mkdir /request-transformer-knative
RUN git clone https://github.com/chagraoui/request-transformer-knative.git request-transformer-knative

FROM nexus.iobeya.fr/iobeya/kong:3.1.1
USER root

ENV KONG_PLUGINS="bundled,request-transformer-knative"

RUN mkdir /usr/local/share/lua/5.1/kong/plugins/request-transformer-knative
COPY --from=builder  /request-transformer-knative/. /usr/local/share/lua/5.1/kong/plugins/request-transformer-knative

USER kong
