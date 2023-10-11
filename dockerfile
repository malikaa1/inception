FROM alpine:latest
RUN apk add gcc && apk add libc-dev
COPY main.c .
RUN gcc main.c
ENTRYPOINT [ "./a.out" ]
