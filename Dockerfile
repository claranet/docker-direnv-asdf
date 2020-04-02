FROM docker.io/fedora:31

RUN dnf update -y \
 && dnf install -y \
        direnv \
        findutils \
        git \
        python3-virtualenv \
        unzip \
        which \
 && dnf clean all

RUN git clone https://github.com/asdf-vm/asdf.git "/asdf" --branch v0.7.8

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/bin/bash", "/usr/local/bin/entrypoint.sh"]

ENV DIRENV_WARN_TIMEOUT=5m
