FROM debian:stable-slim

ARG LISTEN_PORT=9090

ENV LISTEN_PORT ${LISTEN_PORT}

COPY files/* files/

ADD app /app

ENTRYPOINT ["/app"]