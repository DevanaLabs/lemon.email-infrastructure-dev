FROM ubuntu:16.04

COPY install-parity.sh /usr/local/bin/install-parity.sh

RUN apt-get update -y && \
    apt-get install bash -y \
    git \
    gcc \
    g++ \
    libssl-dev \
    pkg-config \
    curl && \
    /usr/local/bin/install-parity.sh

EXPOSE 30303
EXPOSE 8545

COPY run-parity.sh /usr/local/bin/run-parity.sh
CMD ["/usr/local/bin/run-parity.sh"]
