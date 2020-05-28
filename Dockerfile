FROM alpine
WORKDIR /darkhttpd-fc
COPY ./ ./
RUN apk add --no-cache libc-dev gcc make && make clean && make

FROM alpine
COPY --from=0 /darkhttpd-fc/darkhttpd /usr/bin/
WORKDIR /www
ENTRYPOINT darkhttpd . 
