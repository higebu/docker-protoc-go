FROM golang:1.11.2-stretch
LABEL maintainer="yuya.kusakabe@gmail.com"

ENV PROTOC_VERSION 3.6.1

COPY ./install_plugins.sh .
RUN ./install_plugins.sh
RUN apt-get update && apt-get install -y unzip && apt-get clean
RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v$PROTOC_VERSION/protoc-$PROTOC_VERSION-linux-x86_64.zip && \
  unzip protoc-$PROTOC_VERSION-linux-x86_64.zip && \
  rm protoc-$PROTOC_VERSION-linux-x86_64.zip && \
  rm readme.txt
CMD ["protoc"]
