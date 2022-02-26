FROM openjdk:8u151-stretch

RUN apt-get update \
    && apt-get -y install openssh-client \
    && apt-get install -y git \
    && apt-get install -y maven \
    && apt-get install -y docker.io

# Clear cache
RUN apt-get clean
