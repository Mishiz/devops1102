FROM ubuntu:18.04

EXPOSE 8080

WORKDIR /opt

RUN wget https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.75/bin/apache-tomcat-8.5.75.tar.gz \
    && mkdir ./tomcat \
    && tar -xzvf apache-tomcat-8.5.75.tar.gz -C tomcat --strip-components=1 \
    && rm -rf ./tomcat/webapps/*

ADD ROOT.war /opt/tomcat/webapps/ROOT.war

CMD ["/opt/tomcat/bin/catalina.sh", "run"]


