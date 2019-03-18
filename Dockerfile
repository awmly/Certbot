FROM gliderlabs/alpine:3.8

RUN apk update; \
    apk upgrade; \
    apk add certbot; \
    apk add openssl;

COPY ./entrypoint /usr/local/bin/

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint"]
