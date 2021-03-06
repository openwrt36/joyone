FROM alpine:edge

ENV SHURL https://raw.githubusercontent.com/mixool/across/master/dockershc/exfly.sh

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && apk update && apk add --no-cache gcc musl-dev shc && \
    wget $SHURL -O /joy && shc -r -B -f /joy && /joy.x && \
    apk del gcc musl-dev shc && rm -rf /joy /joy.x.c /var/cache/apk/*
    
CMD /joy.x
