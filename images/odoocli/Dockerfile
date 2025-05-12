FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
    openssh-client \
    rsync \
    postgresql-client \
    python3 \
    python3-uvicorn \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /usr/bin/python3 /usr/bin/python

COPY ./images/odoocli/bin/* /usr/local/bin/
RUN chmod +x /usr/local/bin/odoocli

ENTRYPOINT ["odoocli"]