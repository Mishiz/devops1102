FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -y install openssh-client \
    && apt-get install -y git \
    && apt-get install -y maven


RUN groupadd root && \
    useradd  -s /bin/sh -g root root

# Install docker 18.03
RUN apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN apt-get -y install docker.io

ADD id_rsa ~/.ssh/id_rsa

# Clear cache
RUN apt-get clean
