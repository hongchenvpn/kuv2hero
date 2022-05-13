FROM alpine:latest

ADD entrypoint.sh /entrypoint.sh

RUN apk add --no-cache --virtual .build-deps ca-certificates curl \
 && chmod +x /entrypoint.sh


CMD /entrypoint.sh
