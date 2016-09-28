FROM ubuntu:16.04

MAINTAINER dong o kim <otwmoo@gmail.com>

USER root

RUN apt-get update
RUN apt-get dist-upgrade -y

RUN DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install python-software-properties
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common

RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

WORKDIR opt

RUN \
    wget http://mirror.navercorp.com/apache/tomcat/tomcat-9/v9.0.0.M10/bin/apache-tomcat-9.0.0.M10.tar.gz && \
    tar xzf apache-tomcat-9.0.0.M10.tar.gz && \
    mv apache-tomcat-9.0.0.M10 tomcat && \
    rm apache-tomcat-9.0.0.M10.tar.gz

ENV TOMCAT_HOME /opt/tomcat

RUN \
    mkdir /app && \
    mkdir -p /root/temp

ADD conf/server.xml tomcat/conf/server.xml
ADD conf/tomcat-users.xml tomcat/conf/tomcat-users.xml

VOLUME ["/app","/root/temp"]

EXPOSE 8080
EXPOSE 8009

CMD ["tomcat/bin/catalina.sh","run"]

