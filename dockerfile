FROM centos
CMD ./start.sh

RUN dnf update -y
#RUN dnf install -y java-11-openjdk-headless.x86_64
RUN dnf install -y java-1.8.0-openjdk.x86_64

WORKDIR /server

ADD payload .

