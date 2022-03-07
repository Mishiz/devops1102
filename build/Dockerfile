FROM ubuntu:18.04

RUN apt-get update \
    && apt-get -y install openssh-client \
    && apt-get install -y git \
    && apt-get install -y maven

ARG USER_ID=1000
ARG GROUP_ID=1000
RUN groupadd -g $GROUP_ID user && \
    useradd -u $USER_ID -s /bin/sh -g user user

# Install docker 18.03
RUN apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN apt-get -y install docker.io

ADD id_rsa ~/.ssh/id_rsa

# Clear cache
RUN apt-get clean
