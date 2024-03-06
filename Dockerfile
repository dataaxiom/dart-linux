FROM debian:bookworm-slim

ARG VERSION=3.3.0

ENV DEBIAN_FRONTEND=noninteractive

RUN mkdir -p /usr/share/man/man1 && \
    apt-get update && \
    apt-get -y dist-upgrade && \
    apt-get install -yq --no-install-recommends wget gpg ca-certificates apt-transport-https  && \
    wget -q https://storage.googleapis.com/dart-archive/channels/stable/release/${VERSION}/linux_packages/dart_${VERSION}-1_amd64.deb && \
    dpkg -i dart_${VERSION}-1_amd64.deb && \
    rm dart_${VERSION}-1_amd64.deb && \
    dart --disable-analytics && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/apt

ENV PATH "/usr/lib/dart/bin:${PATH}"

