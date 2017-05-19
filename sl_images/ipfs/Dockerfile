FROM ubuntu:16.04

RUN apt-get update -y && \
    apt-get install ca-certificates -y && \
        update-ca-certificates -y && \
        apt-get install -y openssl \
        golang \
        git \
        make \
        gcc \
        musl-dev \
        wget \
        bash && \
        wget https://dist.ipfs.io/go-ipfs/v0.4.8/go-ipfs_v0.4.8_linux-amd64.tar.gz && \
        tar -xvzf go-ipfs_v0.4.8_linux-amd64.tar.gz && \
        cd go-ipfs && \
        mv ipfs /usr/local/bin/ipfs


EXPOSE 5001
EXPOSE 8080
EXPOSE 4001
EXPOSE 4002/udp

COPY ipfs.sh /usr/local/bin/ipfs.sh

CMD ["/usr/local/bin/ipfs.sh"]