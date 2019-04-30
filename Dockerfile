FROM alpine:latest

RUN apk update
RUN apk add curl

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod u+x kubectl && mv kubectl /bin/kubectl

# Install Pyton Stuff
RUN apk update && \
    apk add python3 && \
    apk add python3-dev && \
    apk add py-pip && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    apk add py-requests && \
    rm -rf /var/cache/* \
    rm -rf /root/.cache/*

ENTRYPOINT []
CMD []
