FROM openjdk:8u151-stretch

RUN apt-get update \
    && apt-get -y install openssh-client \
    && apt-get install -y git \
    && apt-get install -y maven

# Install docker 18.03
RUN apt-get -y install apt-transport-https ca-certificates curl gnupg2 software-properties-common
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
RUN apt-get update
RUN apt-get -y install docker-ce=18.03.1~ce-0~debian

ADD id_rsa ~/.ssh/id_rsa

# Clear cache
RUN apt-get clean
