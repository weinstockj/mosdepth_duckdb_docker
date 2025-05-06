FROM ubuntu:22.04
ARG MOSDEPTH_VERSION=v0.3.11
ARG DUCKDB_VERSION=v1.1.3
ARG DUCKDB_ARCH=amd64

RUN apt-get update && \
    apt-get install -y \
    curl \
    wget  \
    unzip \
    parallel \
    curl

RUN wget https://github.com/brentp/mosdepth/releases/download/${MOSDEPTH_VERSION}/mosdepth

RUN chmod +x mosdepth && \
    mv mosdepth /usr/local/bin/mosdepth 

RUN curl -L -o duckdb_cli.zip "https://github.com/duckdb/duckdb/releases/download/${DUCKDB_VERSION}/duckdb_cli-linux-${DUCKDB_ARCH}.zip" \
    && unzip duckdb_cli.zip \
    && rm duckdb_cli.zip

RUN mv duckdb /usr/local/bin/duckdb

RUN apt-get install -y \
    samtools 

ENV SHELL=/bin/bash

CMD ["/bin/bash"]
